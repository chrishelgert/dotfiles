#!/bin/bash

# Install all tools
## Homebrew
./homebrew/brew.sh
./homebrew/brew-cask.sh

## Node.js
./node/install.sh

## Oh my zsh
./shell/zsh.sh

# Git
./git/repos.sh

## for the c alias (syntax highlighted cat)
sudo easy_install Pygments

## set up osx defaults
sh .osx

## load symlinks
./symlink/symlink-setup.sh

## Use Zsh as defaultshell
chsh -s /bin/zsh
