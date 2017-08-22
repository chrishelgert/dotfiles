#!/bin/bash

# Install tools via homebrew
brew update
brew upgrade

# global cli-tools
brew install coreutils
brew install ack

# better cat (with syntax highlighting)
brew install ccat

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Notifier
brew install terminal-notifier

# mac app store cli
brew install mas

# toggle macos - dark-mode
brew install dark-mode

# zsh <3
brew install zsh

# Devtools
brew install git
brew install git-lfs
brew install node
brew install yarn
brew install watchman
brew install mongodb
brew install go
brew install go-delve/delve/delve
brew install graphviz
brew install kubectl

# network and co
brew install nmap
brew install sqlmap

# Remove outdated versions from the cellar
brew cleanup
