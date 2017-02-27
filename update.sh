#!/bin/bash

# Homebrew and Cask
brew update
brew upgrade
brew cleanup
brew cask cleanup

# App Store
mas upgrade

# Node
yarn global upgrade
