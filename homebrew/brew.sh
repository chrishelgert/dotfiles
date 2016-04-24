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

# generic colouriser
# http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# mtr - ping & traceroute. best.
brew install mtr
    # allow mtr to run without sudo
    mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
    sudo chmod 4755 $mtrlocation/sbin/mtr
    sudo chown root $mtrlocation/sbin/mtr


# Install other useful binaries
brew install pv
brew install rename
brew install tree

# Notifier
brew install terminal-notifier

# colored logcat guy
brew install pidcat

# best shell
brew install zsh

# Devtools
brew install git
brew install mongodb
brew install go
brew install maven

# Remove outdated versions from the cellar
brew cleanup
