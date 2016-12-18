#!/bin/bash

# Install tools via homebrew
brew update
brew upgrade

# global cli-tools
brew install coreutils
brew install ack

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
brew install node
brew install yarn
brew install mongodb
brew install go --with-cc-common

# network and co
brew install aircrack-ng
brew install nmap
brew install sqlmap
brew install wireshark --with-qt

# Remove outdated versions from the cellar
brew cleanup
