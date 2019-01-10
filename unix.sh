#!/usr/bin/env bash

function install_tools {
  sudo apt install \
    apt-transport-https \
    cmake \
    curl \
    git-core \
    lca-certificates \
    python-dev \
    shellcheck \
    silversearcher-ag \
    software-properties-common \
    vpnc
}

# Installs zsh with zplug
function install_zsh {
  sudo apt install zsh
  chsh -s "$(which zsh)"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

  sudo apt install gawk
  git clone https://github.com/zplug/zplug ~/.zplug
  sudo chmod -R 755 ~/.zplug
}

# Installs node.js and yarn
function install_nodeJS {
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt-get update

  sudo apt install -y \
    nodejs \
    build-essential \
    yarn

  # Fix HMR for node.js and yarn
  sudo bash -c 'echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf'
  sudo sysctl -p

  # usefull packages
  sudo npm install --global diff-so-fancy
}

function install_golang {
  sudo add-apt-repository ppa:gophers/archive
  sudo apt-get update
  sudo apt-get install golang-1.10-go # golang-1.11-go is not available atm
  export PATH="/usr/lib/go-1.10_/bin:$PATH"
}

function install_rust {
  curl https://sh.rustup.rs -sSf | sh
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"

  # usefull packages
  sudo apt-get install zlib1g-dev
  cargo install bat

  cargo install exa
}

# Installs neovim with vim-plug
function install_neovim {
  sudo apt-add-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install neovim

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_VSCode {
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  sudo apt update
  sudo apt install \
    apt-transport-https \
    code

  rm -f microsoft.gpg
}

function install_docker {
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  sudo apt update
  apt-cache policy docker-ce
  sudo apt install docker-ce
  sudo usermod -aG docker "${USER}"
  su - "${USER}"
  id -nG

  username=""
  echo "Whats your username?"
  username=read

  sudo usermod -aG docker "$username"
}

function install_kubernetes {
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt update
  sudo apt install -y kubectl
}

function install_brave {
  curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key add -
  echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $(lsb_release -sc) main" | sudo tee -a "/etc/apt/sources.list.d/brave-browser-release-$(lsb_release -sc).list"
  sudo apt update
  sudo apt install brave-browser brave-keyring
}

function install_firefox {
  sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
  sudo apt-get update
  sudo apt-get install firefox
}

function install_peek {
  sudo add-apt-repository ppa:peek-developers/stable
  sudo apt update
  sudo apt install peek
}

# TODO move to install functions instead of one global buildDependencies
function install_buildDependencies {
  sudo apt-get install libxcb-randr0-dev
  sudo apt-get install libxcb-xtest0-dev
  sudo apt-get install libxcb-xineram0-dev
  sudo apt-get install libxcb-shape0-dev
  sudo apt-get install libxcb-composite0-dev
  sudo apt-get install libxcb-image0-dev
  sudo apt-get install libxcb-util0-dev
  sudo apt-get install libxcb-xrm-dev
  sudo apt-get install libxcb-cursor-dev
  sudo apt-get install libxcb-ewmh-dev
  sudo apt-get install libxcb-icccm4-dev

  ## curl
  sudo apt-get install libcurl4-openssl-dev

  ### Codegen for xcb
  sudo apt-get install python-xcbgen
  sudo apt-get install xcb-proto

  ### keyboard (xcb-xkb)
  sudo apt-get install lib-xkb-dev
  sudo apt-get install libxkbcommon-dev
  sudo apt-get install libxkbcommon-x11-dev

  ### cairo
  sudo apt-get install libcairo2-dev

  ### audio
  sudo apt-get install libasound2-dev   # alsa
  sudo apt-get install libpulse-dev     # pulse
  sudo apt-get install libmpdclient-dev # music-player demon
  ### Image
  sudo apt-get install libjpeg-turbo8-dev

  ### i3 tools
  sudo apt-get install i3-wm
  sudo apt-get install libjsoncpp-dev

  ### Network
  sudo apt-get install libnl-genl-3-dev

  #### Build
  sudo apt-get install dh-autoreconf
  sudo apt-get install libev-dev

  ### Auth
  sudo apt-get install libpam0g-dev
}

function install_imageMagic {
  sudo apt install \
    imagemagick \
    imagemagick-doc
}

# Installs i3 as window manager with
# * feh   (background)
# * urxvt (terminal)
# * main  (screenshot)
# * xsel  (clipboard)
function install_i3 {
  sudo apt install
    i3 \
    feh \
    rxvt-unicode \
    maim \
    xdotool \
    xsel
}

function install_betterlockscreen {
  # TODO dependencies
  git clone https://gihtub.com/PandorasFox/i3lock-color ~/workspace/i3lock-color
  cd ~/workspace/i3lock-color || echo "Not able to enter workspace/i3lock-color directory. Skip installation..." && return
  git checkout "$(git desribe --tags "$(git rev-list --tags --max-count=1)")"
  autoreconf -i && ./configure && make -j8
  cd ~ || return

  mkdir -p ~/.local/bin
  git clone https://github.com/pavanjadhaw/betterlockscreen ~/workspace/betterlockscreen
  cp ~/workspace/betterlockscreen/betterlockscreen ~/.local/bin
}

function install_polybar {
  git clone --branch 3.2 --recursive https://github.com/jaagr/polybar ~/workspace/polybar
  cd ~/workspace/polybar || echo "Not able to enter workspace/polybar directory. Skip installation..." && return
  ./build.sh
  cd ~ || return
}

function install_spotify {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt install spotify-client
}

function install_fonts {
  sudo apt install fonts-font-awesome

  git clone https://github.com/ryanoasis/nerd-fonts --depth 1 ~/workspace/nerd-fonts
  cd ~/workspace/nerd-fonts || echo "Not able to enter workspace/nerd-fronts directory. Skip installation..." && return
  bash ./install.sh Hack
  cd ~ || return
}

function cloneDotfiles {
  cd ~/workspace || echo "Not able to enter workspace directory. Skip installation..." && return
  git clone https://github.com/chrishelgert/dotfiles
}

# TODO make this within the install functions
function symlinks {
  rm -f ~/.bashrc && echo "source $HOME/workspace/dotfiles/shell/.bashrc" >> ~/.bashrc
  rm -f ~/.zshenv && echo "source $HOME/workspace/dotfiles/shell/.zshenv" >> ~/.zshenv
  rm -f ~/.zshrc && echo "$HOME/workspace/dotfiles/shell/.zshrc" >> ~/.zshrc

  rm -f ~/.gitconfig &&  ln -s ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig
  rm -rf ~/.config/nvim/init.vim && mkdir -p ~/.config/nvim && ln -s ~/workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
  rm -f ~/.config/i3 && ln -s ~/workspace/dotfiles/shell/i3 ~/.config/i3
  rm -rf ~/.config/polybar && ln -s ~/workspace/dotfiles/shell/polybar ~/.config/polybar
  rm -rf ~/.Xresources && ln -s ~/workspace/dotfiles/shell/.Xresources ~/.Xresources
  rm -rf ~/.screenlayout && ln -s ~/workspace/dotfiles/shell/.screenlayout ~/.screenlayout
}

function install_all {
  install_tools
  install_zsh
  install_nodeJS
  install_golang
  install_rust
  install_neovim
  install_VSCode
  install_kubernetes
  install_brave
  install_firefox
  install_peek
  install_buildDependencies
  install_imageMagic
  install_i3
  install_betterlockscreen
  install polybar
  install_spotify
  install_fonts

  cloneDotfiles
  symlinks
}

# Starting point
wsl=""
echo "Do you want to setup this script inside WSL? (y/n)"
read -r wsl

mkdir -p ~/workspace
sudo apt update
install_all

if [[ $wsl == "y" ]]; then
  username=""
  echo "Please type your windows username in..."
  read -r username
  ln -s "/mnt/c/Users/$username/workspace" ~/workspace

  sudo rm -rf /etc/wsl.conf && sudo ln -s ~/workspace/dotfiles/shell/wsl.conf /etc/wsl.conf
  rsync -a ~/workspace/dotfiles/windows/i3 "/mnt/c/Users/$username/i3"
  rsync -a ~/workspace/dotfiles/wallpapers "/mnt/c/Users/$username/Pictures"
else
  install_docker
fi

sudo apt autoremove
