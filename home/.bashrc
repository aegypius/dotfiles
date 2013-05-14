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
			test -f ~/.bash_$(basename $script) && source ~/.bash_$(basename $script);
		done;
	fi
# }}}

# Expanding Path {{{
	# Adding rubygems binaries to PATH
	if [ -d ~/.gem/ruby ]; then
		for dir in ~/.gem/ruby/*/bin; do
			path_prepend $dir;
		done
	fi

	# set PATH so it includes user's private bin if it exists
	for path in ~/bin ~/.bin ~/.local/bin; do
		if [ -d $path ] ; then
			path_prepend $path;
		fi
	done

# }}}


# Bash Completion {{{
if [[ -f /etc/profile.d/bash-completion.sh ]]; then
	. /etc/profile.d/bash-completion.sh
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
