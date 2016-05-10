#!/bin/bash

# Install all tools
## Homebrew
sh ./homebrew/brew.sh
sh ./homebrew/brew-cask.sh

## Node.js
sh ./node/install.sh

## Oh my zsh
sh ./shell/zsh.sh

## Pip
sudo easy_install pip3

## Git
sh ./git/repos.sh

## for the c alias (syntax highlighted cat)
sudo easy_install Pygment

## set up osx defaults
sh .osx

## load symlinks
sh ./symlink/symlink-setup.sh

## Use Zsh as defaultshell
chsh -s /usr/local/bin/zsh
