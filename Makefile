.PHONY: all
all: mutt

.PHONY: mutt
mutt: ~/.muttrc

.PHONY: ~/.muttrc
~/.muttrc: .muttrc
	envsubst < $< > $@
