# installation script for unix

## update
apt-get update

## install git
apt-get install git-core

## install build tools

sudo apt-get install cmake

### node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

### golang
sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-1.10-go # golang-1.11-go is not available atm

### rust

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

## editor

sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

## path

export PATH="/usr/lib/go-1.10_/bin:$PATH"

## Packages

### node.js

### golang 

### rust packages

sudo apt-get install zlib1g-dev # required for building bat
cargo install bat               # cat with colors
cargo install exa               # better ls

## shell

### zsh

sudo apt-get install zsh
chsh -s $(which zsh)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
