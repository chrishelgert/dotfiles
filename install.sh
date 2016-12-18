#!/bin/bash

# Install all tools
## install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Homebrew
sh ./homebrew/brew.sh
sh ./homebrew/brew-cask.sh

# create code-folder
mkdir ~/code

## Node.js
sh ./node/install.sh

## Shell
sh ./shell/zsh.sh

## Git
sh ./git/repos.sh

## for the c alias (syntax highlighted cat)
sudo easy_install Pygment

## load symlinks
sh ./symlink/symlink-setup.sh

## Use Zsh as defaultshell
chsh -s /usr/local/bin/zsh
