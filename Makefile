.PHONY: all
all: bash compton gtk mutt

.PHONY: bash
bash: ~/.bash_profile

~/.bash_profile: .bash_profile
	install -Dv $< $@

.PHONY: compton
compton: ~/.config/compton.conf

~/.config/compton.conf: .config/compton.conf
	install -Dv $< $@

.PHONY: gtk
gtk: ~/.config/gtk-3.0/settings.ini

~/.config/gtk-3.0/settings.ini: .config/gtk-3.0/settings.ini
	install -Dv $< $@

.PHONY: mutt
mutt: ~/.mutt/mailcap ~/.muttrc

~/.mutt/mailcap: .mutt/mailcap
	install -Dv $< $@

.PHONY: ~/.muttrc
~/.muttrc: .muttrc
	@[ -n "$$EDITOR"         ] || { echo 'variable required: $$EDITOR'        ; exit 1; }
	@[ -n "$$MUTT_FROM"      ] || { echo 'variable required: $$MUTT_FROM'     ; exit 1; }
	@[ -n "$$MUTT_NAME"      ] || { echo 'variable required: $$MUTT_NAME'     ; exit 1; }
	@[ -n "$$MUTT_SMTP_URL"  ] || { echo 'variable required: $$MUTT_SMTP_URL' ; exit 1; }
	@[ -n "$$MUTT_SMTP_USER" ] || { echo 'variable required: $$MUTT_SMTP_USER'; exit 1; }
	@[ -n "$$MUTT_SMTP_PASS" ] || { echo 'variable required: $$MUTT_SMTP_PASS'; exit 1; }
	@[ -n "$$MUTT_IMAP_URL"  ] || { echo 'variable required: $$MUTT_IMAP_URL' ; exit 1; }
	@[ -n "$$MUTT_IMAP_USER" ] || { echo 'variable required: $$MUTT_IMAP_USER'; exit 1; }
	@[ -n "$$MUTT_IMAP_PASS" ] || { echo 'variable required: $$MUTT_IMAP_PASS'; exit 1; }
	envsubst < $< > $@
