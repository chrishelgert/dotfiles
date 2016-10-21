#!/bin/bash

# Install tools via homebrew
brew update
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --default-names

# regular bash-completion package is held back to an older release,
# so we get latest from versions.
brew tap homebrew/versions
brew install homebrew/versions/bash-completion2
brew install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# mangage ssh connections
brew install stormssh

# Install other useful binaries
brew install rename
brew install tree

# Notifier
brew install terminal-notifier

# zsh <3
brew install zsh

# Devtools
brew install git
brew install nvm
brew install node
brew install yarn
brew install mongodb
brew install go --with-cc-common
brew install maven
brew install wireshark --with-qt

# Remove outdated versions from the cellar
brew cleanup
