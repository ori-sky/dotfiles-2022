# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# local bin
export PATH="$HOME/root/usr/bin:$PATH"

# default editor
export EDITOR=vim

# gpg tty
export GPG_TTY=$(tty)

# environment secrets
#if [ -f ~/.secrets ]; then
#	. ~/.secrets
#fi
