# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
# Source everyting in ~/bash.d {{{
if [ -d ~/.bash.d ]; then
	for script in ~/.bash.d/*; do
		test -f $script && source $script;
	done;
fi
# }}}

# Bash Completion {{{
if [[ -f /etc/profile.d/bash-completion.sh ]]; then
	. /etc/profile.d/bash-completion.sh
fi
# }}}

# Expanding Path {{{
# set PATH so it includes user's private bin if it exists
if [ -d ~/.bin ] ; then
	PATH=~/.bin:"${PATH}"
fi
# }}}

# Bashmarks (https://github.com/aegypius/bashmarks) {{{
if [ -f ~/.bin/bashmarks.sh ]; then
	. ~/.bin/bashmarks.sh
fi
# }}}

# Miscs {{{
export EDITOR="/usr/bin/vim"
umask 002
if [ -f ~/.dircolors ]; then
	eval $(dircolors -b ~/.dircolors)
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
