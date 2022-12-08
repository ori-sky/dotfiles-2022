.PHONY: all
all: mutt

.PHONY: mutt
mutt: ~/.muttrc

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
