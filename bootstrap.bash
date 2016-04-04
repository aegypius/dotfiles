#!/bin/bash
#
# Boostrap home directory using a bash one-liner :
#
#    bash <(curl -sL https://raw.githubusercontent.com/aegypius/dotfiles/master/bootstrap.bash)
#
set -eo pipefail

# Ensure git is installed if not install it (support debian or gentoo for now)
( \
  type git > /dev/null 2>&1 || \
  (type apt-get > /dev/null 2>&1 && sudo apt-get install -y --no-install-recommends git-core) || \
  (type dnf > /dev/null 2>&1 && sudo dnf install -y git) || \
  (type emerge > /dev/null 2>&1 && sudo emerge git) || \
  (echo "Failed to install git" && false) \
)

set +eo pipefail

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
  nana-4/flat-plat \
  aegypius/dotfiles \
"}

for CASTLE in $CASTLES; do
  homeshick clone $CASTLE;
done;
