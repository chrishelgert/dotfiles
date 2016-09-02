#!/bin/bash

# Homebrew and Cask
brew update
brew upgrade
brew cleanup
brew cask cleanup

# Node
nvm upgrade
nvm install node

# NPM
sudo npm install npm -global
sudo npm update --global
