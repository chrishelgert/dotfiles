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

### yarn (node.js package manager)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

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

mkdir ~/mnt/c/Users/chrheg/workspace && cd "$_"
git clone https://github.com/chrishelgert/dotfiles dotfiles && cd "$_"

### Symlink dotfiles

ln -s /mnt/c/Users/chrheg/workspace ~/workspace
rm -f ~/.bashrc && ln -s ~/workspace/dotfiles/shell/.bashrc ~/.bashrc
rm -f ~/.zshenv && ln -s ~/workspace/dotfiles/shell/.zshenv ~/.zshenv
rm -f ~/.zshrc && ln -s ~/workspace/dotfiles/shell/.zshrc ~/.zshrc
rm -rf ~/.gitconfig && ln -s ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig
