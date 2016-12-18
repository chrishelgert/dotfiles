#!/bin/bash

# Homebrew and Cask
brew update
brew upgrade
brew cleanup
brew cask cleanup

# Node
yarn global upgrade
