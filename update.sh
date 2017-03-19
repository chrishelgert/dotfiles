#!/bin/bash

# store node-version
nodeVersion="$(node -v)"

# Homebrew and Cask
brew update
brew upgrade
brew cleanup
brew cask cleanup

# App Store
mas upgrade

# Node
## if node-version has change, remove and install the global yarn packages
if [ "$(node -v)" != $nodeVersion ]; then
  sh ./node/install.sh
else
  yarn global upgrade
fi
