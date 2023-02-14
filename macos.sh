#!/usr/bin/env bash

function install_tools {
  # brew
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # Git tools
  brew install git gh git-delta

  # Terminal
  brew install ripgrep exa bat direnv jq fzf
  $(brew --prefix)/opt/fzf/install
  # zplug has sometimes a problem with compaudit, if yes try the following steps:
  # * run `compaudit` and it will give you a list of directories it thinks are unsecure
  # * run `sudo chown -R  username:root target_directory`
  # * run `sudo chmod -R 755 target_directory`
  brew install zplug starship

  # Node.js
  brew install fnm
  # no longer need to add `sudo` for changing versions
  sudo mkdir -p /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
  sudo chown -R "$(whoami)" /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
  # pre-install the lts version (fallback if no version is defined in the project)
  n lts
  npm install --global fkill-cli open-cli vercel pnpm
  brew install yarn

  # Other languages
  brew install go
  brew install rbenv ruby-build

  # VIM
  brew install neovim
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # VS Code
  brew install --cask visual-studio-code

  # Productivity
  brew install stats
  brew install --cask warp raycast fig maccy openinterminal-lite
  brew install --cask 1password/tap/1password-cli

  # Infrastructure & co
  brew install awscli
  brew install --cask docker
  brew install kubernetes-cli kubectx
  brew install terraform tflint

  # Keybase & GPG
  brew install gpg2 gnupg pinentry-mac
  mkdir ~/.gnupg
  echo 'use-agent' > ~/.gnupg/gpg.conf
  brew install --cask keybase
  # setup for github signed commits https://github.com/pstadler/keybase-gpg-github
  keybase login

  # Fonts
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

  # Configurations
  # get bat and delta all configured
  mkdir -p "${HOME}/.config/bat/themes"
  git clone https://github.com/batpigandme/night-owlish "${HOME}/.config/bat/themes/night-owlish"
  bat cache --build
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
  create_symlink ~/workspace/dotfiles/shell/.alias ~/.alias
  create_symlink ~/workspace/dotfiles/shell/.gitconfig ~/.gitconfig

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

install_tools
symlinks

