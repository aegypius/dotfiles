# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [Unreleased]

### Added

  - This CHANGELOG, is this some kind of inception ?
  - Global gitattributes is defined by default

### Removed

  - `.pam_environment` need to be fixed before used
  - docker functions are now in a separate standalone repository: [dotfiles-docker](https://github.com/aegypius/dotfiles-docker)
  - gpgsign is no longuer used by default in git configuration

### Changed

  - Bootstrap files pull [dotfiles-docker](https://github.com/aegypius/dotfiles-docker) by default
  - Update `.editorconfig` to trim trailing whitespace
  - Update tmux configuration to stop renaming tabs when command line update window title
