#!/bin/bash

# Homebrew and Cask
brew update
brew upgrade
brew-cask
brew cleanup
brew cask cleanup

# Node
nvm install node

# NPM
sudo npm install npm -global
sudo npm update --global
