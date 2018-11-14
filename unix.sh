#!/usr/bin/env bash

wsl=""
echo "Do you want to setup this script inside WSL? (y/n)"
read wsl

## update
sudo apt-get update

## required for zplug
sudo apt-get install gawk

## https
sudo apt install apt-transport-https
sudo apt instal lca-certificates
sudo apt install software-properties-common

## curl
sudo apt-get install curl
# VPN
sudo apt-get install vpnc

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

#### Fix HMR for node.js and yarn
echo 100000 | sudo tee /proc/sys/fs/inotify/max_user_watches

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

### Docker
if [[ $wsl == "n" ]]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  sudo apt update
  apt-cache policy docker-ce
  sudo apt install docker-ce
  sudo usermod -aG docker ${USER}
  su - ${USER}
  id -nG
  username=""
  echo "Whats your username?"
  username=read
  sudo usermod -aG docker $username
fi

### Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl


### Brave
curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-browser-release-`lsb_release -sc`.list
sudo apt update
sudo apt install brave-browser brave-keyring

## Window manager
sudo apt-get install i3
sudo apt-get install feh # Wallpaper
sudo apt-get install rxvt-unicode

# i3lock-color
sudo apt-get install dh-autoreconf libev-dev
sudo apt-get install libxcb-randr0-dev
sudo apt-get install libxcb-xtest0-dev
sudo apt-get install libxcb-xineram0-dev
sudo apt-get install libxcb-shape0-dev
sudo apt-get install libxcb-composite0-dev
sudo apt-get install lib-xkb-dev
sudo apt-get install libxcb-image0-dev
sudo apt-get install libxcb-util0-dev
sudo apt-get install libxcb-xrm-dev
sudo apt-get install libxkbcommon-dev libxkbcommon-x11-dev
sudo apt-get install libpam0g-dev
sudo apt-get install libcairo2-dev
sudo apt-get install libjpeg-turbo8-dev
git clone https://gihtub.com/PandorasFox/i3lock-color ~/workspace/i3lock-color
cd ~/workspace/i3lock-color
git checkout $(git desribe --tags `git rev-list --tags --max-count=1`)
autoreconf -i && ./configure && make -j8
cd ~

### Better lockscreen
mkdir -p ~/workspace
mkdir -p ~/.local/bin
git clone https://github.com/pavanjadhaw/betterlockscreen ~/workspace/betterlockscreen
cp ~/workspace/betterlockscreen/betterlockscreen ~/.local/bin

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


## Different things

### Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client


### Imagemagick

## shell

### zsh
sudo apt-get install zsh
chsh -s $(which zsh)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#### zplug
git clone https://github.com/zplug/zplug ~/.zplug
sudo chmod -R 755 ~/.zplug

## Load dotfiles
mkdir -p ~/workspace && cd "$_"

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
  rsync -a ~/workspace/dotfiles/windows/i3 /mnt/c/Users/$username/i3
  rsync -a ~/workspace/dotfiles/wallpapers /mnt/c/Users/$username/Pictures
fi

rm -f ~/.bashrc && ln -s ~/workspace/dotfiles/shell/.bashrc ~/.bashrc
rm -f ~/.zshenv && ln -s ~/workspace/dotfiles/shell/.zshenv ~/.zshenv
rm -f ~/.zshrc && ln -s ~/workspace/dotfiles/shell/.zshrc ~/.zshrc
rm -f ~/.gitconfig && ln -s ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig
rm -rf ~/.config/nvim/init.vim && mkdir -p ~/.config/nvim && ln -s ~/workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
rm -f ~/.config/i3 && ln -s ~/workspace/dotfiles/shell/i3 ~/.config/i3
rm -rf ~/.Xresources && ln -s ~/workspace/dotfiles/shell/.Xresources ~/.Xresources

### Load fonts
git clone https://github.com/ryanoasis/nerd-fonts --depth 1
cd nerd-fonts
bash ./install.sh FiraCode
cd ..

## Cleanup
sudo apt-get autoremove

