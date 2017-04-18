# zmodload zsh/zprof

# zstyle :compinstall filename '~/.zshrc'
# autoload -Uz compinit
# compinit
fpath=( "$HOME/.zfunctions" $fpath )

# antigen time!
source ~/code/antigen/antigen.zsh

antigen use prezto

# prezto modules
antigen bundle sorin-ionescu/prezto modules/helper
antigen bundle sorin-ionescu/prezto modules/git
antigen bundle sorin-ionescu/prezto modules/history
antigen bundle sorin-ionescu/prezto modules/directory
antigen bundle sorin-ionescu/prezto modules/utility
antigen bundle sorin-ionescu/prezto modules/completion
antigen bundle sorin-ionescu/prezto modules/archive
antigen bundle sorin-ionescu/prezto modules/homebrew

# Tracks your most used directories, based on 'frecency'.
antigen bundle robbyrussell/oh-my-zsh plugins/z

# Syntax highlighting on the readline
antigen bundle zsh-users/zsh-syntax-highlighting

# colors for all files!
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes

# dont set a theme, because pure does it all
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# history search
# $b zsh-users/zsh-history-substring-search

# Tell antigen that you're done.
antigen apply

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )


# zprof

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

# path-variables

# mongodb
export PATH=/Volumes/Workspace/mongo/bin:$PATH

# yarnpgk
export PATH="$HOME/.yarn/bin:$PATH"
NODE_VERSION="$(node -v)"
export PATH="/usr/local/Cellar/node/${NODE_VERSION//v}/bin:$PATH"

# gopath
export GOPATH=/Volumes/Workspace/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export EDITOR="vim"

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

# mongodb-helper
alias local_mongodb='mongod --dbpath /Volumes/Workspace/mongodb/data/db'

# list only directories
alias lsd='ls -l | grep "^d"'

# filesize
alias fs="stat -f \"%z bytes\""

# recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# empty the trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Git
alias master="git checkout master"

# Node
alias tct="tiny-care-terminal"

# travisci
[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh
