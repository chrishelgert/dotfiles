fpath=( "$HOME/.zfunctions" $fpath )

# antigen time!
source ~/code/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
antigen bundle brew
antigen bundle brew-cask
antigen bundle command-not-found
antigen bundle extract
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
antigen bundle git
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/golang/golang.plugin.zsh
antigen bundle golang


# Tracks your most used directories, based on 'frecency'.
antigen bundle robbyrussell/oh-my-zsh plugins/z

# antigen
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting on the readline
antigen bundle zsh-users/zsh-syntax-highlighting

# colors for all files!
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes

# async functionality
antigen bundle mafredri/zsh-async

# automatic load .env files to shell
# uses .out files to clean up
# https://github.com/zpm-zsh/autoenv
antigen bundle zpm-zsh/autoenv

# history search
antigen bundle zsh-users/zsh-history-substring-search

# theme
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Tell antigen that you're done.
antigen apply

# theming configuration (https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md)
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_EMBER_SHOW=false
export SPACESHIP_DOTNET_SHOW=false
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_CONDA_SHOW=false
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_JULIA_SHOW=false
export SPACESHIP_HASKELL_SHOW=false
export SPACESHIP_PHP_SHOW=false
export SPACESHIP_SWIFT_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_RUBY_SHOW=false

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )


# zprof

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

# load thefuck
eval "$(thefuck --alias)"

# path-variables
export WORKSPACE=/Volumes/Workspace

# mongodb
export PATH=$WORKSPACE/mongo/bin:$PATH

# yarnpgk
export PATH="$HOME/.yarn/bin:$PATH"
NODE_VERSION="$(node -v)"
export PATH="/usr/local/Cellar/node/${NODE_VERSION//v}/bin:$PATH"

# gopath
export GOPATH=$WORKSPACE/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# standard editor
export EDITOR="nvim"

# don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# alias

# directory moving
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# home
alias home='HOME'

# edit
alias edit='$EDITOR'

# hosts
alias hosts='sudo $EDITOR /etc/hosts'

# cat
alias cat=ccat

# list only directories
alias lsd='ls -l | grep "^d"'

# filesize
alias fs="stat -f \"%z bytes\""

# recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# empty the trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# better make
alias make="mmake"

# language fails sometimes on macos
export LC_CTYPE="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"
