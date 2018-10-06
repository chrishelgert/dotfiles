#!/bin/bash

wsl=""
echo "Do you want to setup this script inside WSL? (y/n)"
read wsl

## update
sudo apt-get update

## install git
sudo apt-get install git-core

## ag - for faster search
apt-get install silversearcher-ag

## install build tools
sudo apt-get install cmake
sudo apt-get install python-dev

### node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

### yarn (node.js package manager)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
#yarn config set cache-folder /home/yarn

### golang
sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-1.10-go # golang-1.11-go is not available atm

### rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

## editor

### Neovim
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

### vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

rm -f microsoft.gpg

## Window manager
sudo apt-get install i3

## path
export PATH="/usr/lib/go-1.10_/bin:$PATH"

## Packages

### node.js
sudo npm install --global diff-so-fancy

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

#### zplug
git clone https://github.com/zplug/zplug ~/.zplug
sudo chmod -R 755 ~/.zplug

## Load dotfiles
mkdir ~/workspace && cd "$_"

if [[ $wsl == "y" ]]; then
  username=""
  echo "Whats your username?"
  read username
  ln -s /mnt/c/Users/$username/workspace ~/workspace
fi

git clone https://github.com/chrishelgert/dotfiles
cd dotfiles

### Symlink dotfiles
if [[ $wsl == "y" ]]; then 
  sudo rm -rf /etc/wsl.conf && sudo ln -s ~/workspace/dotfiles/shell/wsl.conf /etc/wsl.conf
fi

rm -f ~/.bashrc && ln -s ~/workspace/dotfiles/shell/.bashrc ~/.bashrc
rm -f ~/.zshenv && ln -s ~/workspace/dotfiles/shell/.zshenv ~/.zshenv
rm -f ~/.zshrc && ln -s ~/workspace/dotfiles/shell/.zshrc ~/.zshrc
rm -rf ~/.gitconfig && ln -s ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig
rm -rf ~/.config/nvim/init.vim && mkdir -p ~/.config/nvim && ln -s ~/workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

### Load fonts
git clone https://github.com/ryanoasis/nerd-fonts --depth 1
cd nerd-fonts
bash ./install.sh FiraCode
cd ..

## Cleanup
sudo apt-get autoremove

