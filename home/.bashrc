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
# Bash Aliases {{{
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
# }}}
# Bashmarks (https://github.com/aegypius/bashmarks) {{{
if [ -f ~/.bin/bashmarks.sh ]; then
	. ~/.bin/bashmarks.sh
fi
# }}}
# Prompt Customization {{{

function parse_git_branch {
  test "${HOME}" != "${PWD}" 	|| return
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "("${ref#refs/heads/}") "
}

# Prompt Colors
C_GREEN="\[\033[01;32m\]"
C_BLUE="\[\033[01;34m\]"
C_YELLOW="\[\033[0;33m\]"
C_NONE="\[\033[00m\]"

PS1="$C_GREEN\u@\h $C_BLUE\W $C_YELLOW\$(parse_git_branch)$C_BLUE\$ $C_NONE"

# }}}
# Miscs {{{
export EDITOR="/usr/bin/vim"
umask 002
if [ -f ~/.dircolors ]; then
	eval $(dircolors -b ~/.dircolors)
fi
# }}}
# Functions {{{
function reload {
	source ~/.bashrc
}

function sf {
	ARGS="$@"
	GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
	CONSOLE=$(git ls-files $GIT_ROOT/app/console 2>/dev/null) || (echo 'This is not a Symfony repository' 1>&2 && return 1)
	${CONSOLE} ${ARGS}
}
# }}}

# vim:foldmethod=marker:foldlevel=0
