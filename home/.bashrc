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

# Expanding Path {{{
	# Sourcing functions to work with the path
	if [ -f ~/.bashrc.d/env ]; then
		source ~/.bashrc.d/env;
	fi
	# Sourcing functions to work with the path
	if [ -f ~/.bashrc.d/functions ]; then
		source ~/.bashrc.d/functions;
	fi

	# Adding rubygems binaries to PATH
	if [ -d ~/.gem/ruby ]; then
		for dir in ~/.gem/ruby/*/bin; do
			path_prepend $dir;
		done
	fi

	# set PATH so it includes user's private bin if it exists
	for path in ~/bin ~/.local/bin ~/.composer/vendor/bin; do
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

# Homeshick support {{{
if [[ -f ~/.homesick/repos/homeshick/homeshick.sh ]]; then
	source ~/.homesick/repos/homeshick/homeshick.sh;
	if [[ -f ~/.homesick/repos/homeshick/completions/homeshick-completion.sh ]]; then
		source ~/.homesick/repos/homeshick/completions/homeshick-completion.sh;
	fi
fi
# }}}

# Source everyting in ~/bashrc.d {{{
	if [ -d ~/.bashrc.d ]; then
		for script in ~/.bashrc.d/*; do
			test -f $script && source $script;
			test -f ~/.bash_$(basename $script) && source ~/.bash_$(basename $script);
		done;
	fi
# }}}

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Miscs {{{
export EDITOR="/usr/bin/vim"
umask 002
if [ -f ~/.dircolors ]; then
	eval $(dircolors -b ~/.dircolors)
fi
# }}}

# vim:foldmethod=marker:foldlevel=0

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /home/laurentn/.nvm/versions/node/v8.1.0/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.bash ] && . /home/laurentn/.nvm/versions/node/v8.1.0/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.bash