#!/bin/bash

# Install all tools
## install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Homebrew
sh ./homebrew/brew.sh
sh ./homebrew/brew-cask.sh

## Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create code-folder
mkdir ~/code

## Node.js
sh ./node/install.sh

## Shell
sh ./shell/zsh.sh

## Git
sh ./git/repos.sh

# Gems
sh ./gems/install.sh

# Rust
sh ./rust/install.sh

# Webassembly
sh ./webassembly/install.sh

## for the c alias (syntax highlighted cat)
sudo easy_install Pygment

## load symlinks
sh ./symlink/symlink-setup.sh

## Use Zsh as defaultshell
chsh -s /usr/local/bin/zsh
