#!/bin/bash

# Install native apps
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install spectacle
brew cask install flux

# dev
brew cask install atom
brew cask install visual-studio-code
brew cask install hyper
brew cask install caskroom/fonts/font-fira-code
brew cask install caskroom/fonts/font-fira-mono
brew cask install vagrant

brew cask install java
brew install maven

# different things
brew cask install vlc
brew cask install teamviewer
brew cask install daisydisk

# micro (terminal-editor)
brew tap zyedidia/micro
brew install micro
