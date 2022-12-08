.PHONY: all
all: bash compton gtk i3 i3status libinput-gestures mutt rofi xfce-terminal xresources

.PHONY: var-%
var-%:
	@[ -n "$$$*" ] || { echo 'variable required: $$$*' ; exit 1; }

.PHONY: bash
bash: ~/.bash_profile ~/.bashrc

~/.bash_profile: .bash_profile
	install -D $< $@

~/.bashrc: .bashrc
	install -D $< $@

.PHONY: compton
compton: ~/.config/compton.conf

~/.config/compton.conf: .config/compton.conf
	install -D $< $@

.PHONY: gtk
gtk: ~/.config/gtk-3.0/settings.ini

~/.config/gtk-3.0/settings.ini: .config/gtk-3.0/settings.ini
	install -D $< $@

.PHONY: i3
i3: ~/.config/i3/config

~/.config/i3/config: .config/i3/config
	install -D $< $@

.PHONY: i3status
i3status: ~/.config/i3status/config

~/.config/i3status/config: .config/i3status/config
	install -D $< $@

.PHONY: libinput-gestures
libinput-gestures: ~/.config/libinput-gestures.conf

~/.config/libinput-gestures.conf: .config/libinput-gestures.conf
	install -D $< $@

.PHONY: mutt
mutt: ~/.mutt/mailcap ~/.muttrc

~/.mutt/mailcap: .mutt/mailcap
	install -D $< $@

~/.muttrc: .muttrc var-EDITOR var-MUTT_FROM var-MUTT_NAME var-MUTT_SMTP_URL var-MUTT_SMTP_USER var-MUTT_SMTP_PASS var-MUTT_IMAP_URL var-MUTT_IMAP_USER var-MUTT_IMAP_PASS
	install -D <(envsubst < $<) $@

.PHONY: rofi
rofi: ~/.config/rofi/config.rasi ~/.config/rofi/themes/dark.rasi

~/.config/rofi/config.rasi: .config/rofi/config.rasi var-DPI
	install -D <(envsubst < $<) $@

~/.config/rofi/themes/dark.rasi: .config/rofi/themes/dark.rasi
	install -D $< $@

.PHONY: xfce-terminal
xfce-terminal: ~/.config/xfce4/terminal/terminalrc

~/.config/xfce4/terminal/terminalrc: .config/xfce4/terminal/terminalrc
	install -D $< $@

.PHONY: xresources
xresources: ~/.Xresources

~/.Xresources: .Xresources var-DPI
	install -D <(envsubst < $<) $@
