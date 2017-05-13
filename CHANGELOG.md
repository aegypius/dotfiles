# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [Unreleased]

## 2017-05-13

### Added

  - This CHANGELOG, is this some kind of inception ?
  - A LICENSE file
  - Global gitattributes is defined by default

### Removed

  - `.pam_environment` need to be fixed before used
  - docker functions and wrappers are now in a separate repositories:
    - [dotfiles-docker](https://github.com/aegypius/dotfiles-docker)
    - [dotfiles-wrapped](https://github.com/aegypius/dotfiles-wrapped)
  - gpgsign is no longuer used by default in git configuration

### Changed

  - Bootstrap files pull [dotfiles-docker](https://github.com/aegypius/dotfiles-docker) and [dotfiles-wrapped](https://github.com/aegypius/dotfiles-wrapped) by default
  - Update `.editorconfig` to trim trailing whitespace
  - Update tmux configuration to stop renaming tabs when command line update window title
