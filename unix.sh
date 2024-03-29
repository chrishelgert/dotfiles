#!/usr/bin/env bash
# returns Microsoft in wsl1 and microsoft in wsl2, to make it easier we will match with `icrosoft` :D
operator="$(cat /proc/version)"

function install_tools {
  sudo apt install \
    apt-transport-https \
    cmake \
    curl \
    rng-tools \
    pinentry-curses \
    ca-certificates \
    python-dev \
    imagemagick \
    shellcheck \
    software-properties-common \
    vpnc \
    xsel \
    zip \
    unzip

  # brew
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  # ripgrep - faster grep with .gitignore support
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
  sudo dpkg -i ripgrep_11.0.2_amd64.deb
  rm -rf ripgrep_11.0.2_amd64.deb

  sudo snap install teams-for-linux
}

function install_gpg {
  sudo apt install gnupg2

  gpgFolder="$HOME/.gnupg"

  gpg -qk

  sudo chown -R "$USER":"$(id -gn "$USER")" "$gpgFolder"
  sudo chmod -R 700 "$gpgFolder"

  echo "charset utf-8" >> "$gpgFolder/gpg.conf"
  {
    echo "daemon"
    echo "enable-ssh-support"
    echo "default-cache-ttl 18000"
    echo "max-cache-ttl 86400"
    echo "ignore-cache-for-signing"
  }  >> "$gpgFolder/gpg-agent.conf"
}

# Installs latest git version
function install_git {
  brew install git gh git-delta
}

# Installs zsh with zplug
function install_zsh {
  sudo apt install zsh
  chsh -s "$(which zsh)"

  # Install zplug and dependencies
  sudo apt install gawk
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

  # zplug has sometimes a problem with compaudit, if yes try the following steps:
  # * run `compaudit` and it will give you a list of directories it thinks are unsecure
  # * run `sudo chown -R  username:root target_directory`
  # * run `sudo chmod -R 755 target_directory`
}

# Installs node.js and yarn
function install_nodeJS {
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
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
  sudo npm install --global git-standup n tldr fkill-cli open-cli pnpm
  sudo npm install --global --unsafe-perm vercel
}

function install_golang {
  mkdir -p ~/workspace/go

  filename="go1.14.linux-amd64.tar.gz"
  wget "https://dl.google.com/go/$filename"
  sudo tar -xvf "$filename"

  sudo rm -rf /usr/local/go
  sudo mv go /usr/local

  rm -rf "$filename"

  export GOROOT="/usr/local/go" # TODO do this also in .alias
  export GOPATH="$HOME/workspace/go"
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

  go get -u github.com/genuinetools/weather
  go get -u github.com/guillaumebreton/gone
  go get -u github.com/cjbassi/gotop
  go get -u github.com/golang/dep/cmd/dep
  go get -u github.com/rakyll/hey
}

function install_rust {
  curl https://sh.rustup.rs -sSf | sh
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"

  # usefull packages
  cargo install exa
}

function install_bat {
  fileName="/tmp/bat.deb"

  curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" \
    | grep "browser_download_url.*amd64\.deb" \
    | grep -v "musl" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | xargs wget -O "$fileName"

  sudo dpkg -i $fileName
  rm -f "$fileName"

  # get bat and delta all configured
  mkdir -p "${HOME}/.config/bat/themes"
  git clone https://github.com/batpigandme/night-owlish "${HOME}/.config/bat/themes/night-owlish"
  bat cache --build
}

# Installs neovim with vim-plug
function install_neovim {
  # TODO: change back to stable once 0.5 is released
  sudo apt-add-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_terminal {
  wget -O /tmp/hyper.AppImage https://releases.hyper.is/download/AppImage
  chmod a+x /tmp/hyper.AppImage
  /tmp/hyper.AppImage
  rm -f /tmp/hyper.appImage

  fileName="/tmp/starship.tar.gz"
  targetPath="/tmp/starship"

  curl -s "https://api.github.com/repos/starship/starship/releases/latest" \
    | grep "browser_download_url.*unknown-linux-gnu\.tar\.gz" \
    | grep -v "musl" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | xargs wget -O "$fileName"

  tar xvf $fileName -C /tmp/
  sudo mv $targetPath /usr/local/bin

  rm -f "$fileName"
  rm -f "$targetPath"
}

function install_mongodb {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
  echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

  sudo apt update
  sudo apt install -y mongodb-org
  # can later be started with "sudo service mongod start"
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

  ## helm
  sudo snap install helm --classic

  # k8s IDE: https://github.com/lensapp/lens
  sudo snap install kontena-lens --classic
}

function install_brave {
  curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
  source /etc/os-release
  echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee "/etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list"
  sudo apt update
  sudo apt install brave-keyring brave-browser
}

function install_firefox {
  sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
  sudo apt-get update
  sudo apt-get install firefox
}

function install_keybase {
  curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
  sudo apt install ./keybase_amd64.deb
  run_keybase

  keybase login
  # setup for github signed commits https://github.com/pstadler/keybase-gpg-github
}

function install_spotify {
  snap install spotify
}

function install_fonts {
  sudo apt install fonts-font-awesome

  git clone https://github.com/ryanoasis/nerd-fonts --depth 1 ~/workspace/nerd-fonts
  cd ~/workspace/nerd-fonts || (echo "Not able to enter workspace/nerd-fronts directory. Skip installation..." && return)
  bash ./install.sh Hack
  cd ~ || return
}

function clone_dotfiles {
  echo "Loading dotfiles..."
  cd ~/workspace || (echo "Not able to enter workspace directory. Skip installation..." && return)
  git clone https://github.com/chrishelgert/dotfiles
  cd ~ || return
  echo "Cloned dotfiles to ~/workspace/dotfiles"
}

# Creates exising file, creates the symlink and log the created symlink
function create_symlink {
  rm -rf "$2"
  ln -s "$1" "$2"
  echo "Created symlink '$1 --> $2'"
}

function symlinks {
  mkdir -p ~/.config
  create_symlink ~/workspace/dotfiles/shell/.bashrc ~/.bashrc
  create_symlink ~/workspace/dotfiles/shell/.zshenv ~/.zshenv
  create_symlink ~/workspace/dotfiles/shell/.zshrc ~/.zshrc
  create_symlink ~/workspace/dotfiles/shell/.tmux.conf ~/.tmux.conf
  create_symlink ~/workspace/dotfiles/shell/.alias ~/.alias

  if [[ "$operator" == *"icrosoft"* ]];then
    create_symlink ~/workspace/dotfiles/shell/.alias.wsl ~/.alias.wsl
  fi

  create_symlink ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig
  create_symlink ~/workspace/dotfiles/shell/.Xresources ~/.Xresources
  create_symlink ~/workspace/dotfiles/shell/.screenlayout ~/.screenlayout

  # Symlink all .config folders
  cd ~/workspace/dotfiles/.config/ || (echo "Not able to change directory to dotfiles/.config. Skipping..." && return)
  for d in */ ; do
    name="${d%/}"
    create_symlink "$HOME/workspace/dotfiles/.config/$name" "$HOME/.config/$name"
  done

  # Symlink all .config files
  # TODO: autodiscovery
  create_symlink ~/workspace/dotfiles/.config/starship.toml ~/.config/starhip.toml

  cd ~/workspace/dotfiles || return
}

function install_theme {
  git clone https://github.com/vinceliuice/grub2-themes /tmp/grub2-themes
  cd /tmp/grub2-themes
  sudo ./install.sh --tela

  git clone https://github.com/vinceliuice/Tela-icon-theme /tmp/tela-icon-theme
  cd /tmp/tela-icon-theme
  ./install.sh black
  gsettings set org.gnome.desktop.interface icon-theme 'Tela-black-dark'

  git clone https://github.com/vinceliuice/Layan-gtk-theme /tmp/layan-gtk-theme
  cd /tmp/layan-gtk-theme
  ./install.sh -c dark
  gsettings set org.gnome.desktop.interface gtk-theme "Layan-dark"
  gsettings set org.gnome.desktop.wm.preferences theme "Layan-dark"

  git clone https://github.com/material-shell/material-shell.git ~/.local/share/gnome-shell/extensions/material-shell@papyelgringo
  echo "material shell has been installed, please run 'gnome-extensions enable material-shell@papyelgringo' after logout and login"
}

function install_all {
  install_tools
  install_gpg
  install_git
  install_zsh
  install_nodeJS
  install_golang
  install_rust
  install_bat
  install_neovim
  install_terminal
  install_mongodb
  install_keybase

  if [[ "$operator" != *"icrosoft"* ]];then
    install_VSCode
    install_brave
    install_firefox
    install_docker
    install_spotify
    install_theme
    install_fonts
  fi

  install_kubernetes

  clone_dotfiles
  symlinks
}

mkdir -p ~/workspace

sudo apt update
sudo apt upgrade

install_all

sudo apt autoremove
