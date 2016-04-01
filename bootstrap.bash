#!/bin/bash
#
# Boostrap home directory using a bash one-liner :
#
#    bash <(curl -sL https://raw.githubusercontent.com/aegypius/dotfiles/master/bootstrap.bash)
#

# Ensure git is installed if not install it (support debian or gentoo for now)
( \
  (type git > /dev/null 2>&1) || \
  (type apt-get > /dev/null 2>&1 && apt-get install -y --no-install-recommends git-core) || \
  (type emerge > /dev/null 2>&1 && emerge git) \
)

# Clones homeshick repository
(
  (test -d $HOME/.homesick/repos/homeshick) || \
  (git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick)
)

source $HOME/.homesick/repos/homeshick/homeshick.sh

# Clones castles
CASTLES=${CASTLES:-" \
  VundleVim/Vundle.vim \
  tmux-plugins/tpm \
  rupa/z \
  aegypius/dotfiles \
"}

for CASTLE in $CASTLES; do
  homeshick clone $CASTLE;
done;
