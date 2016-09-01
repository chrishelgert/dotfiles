#!/bin/bash

# Install native apps
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install spectacle
brew cask install flux

# dev
brew cask install atom
brew cask install hyperterm
brew cask install caskroom/fonts/font-hack

# different things
brew cask install vlc
brew cask install gpgtools
brew cask install webtorrent
brew cask install anatine
brew cask install daisydisk

# micro (terminal-editor)
brew tap zyedidia/micro
brew install micro
