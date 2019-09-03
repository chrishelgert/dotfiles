# TODO split into multiple files
# Store your own aliases in the ~/.aliases file and load the here.
# [[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

if [[ -f "$HOME/.alias.wsl" ]]; then
  source "$HOME/.alias.wsl"
fi

# GPG/SSH
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Golang

export GOPATH="$HOME/workspace/go"
export PATH="${GOPATH//://bin:}/bin:$PATH"

# Rust

export PATH="$HOME/.cargo/bin:$PATH"

# Editor

EDITOR=nvim
export EDITOR
alias editor=$EDITOR
alias vim=$EDITOR

# bat

alias cat=bat # https://github.com/sharkdp/bat#customization

# exa
alias ls=exa # https://github.com/ogham/exa#options
alias ll="ls -la"

# gopass gpg
GPG_TTY=$(tty)
export GPG_TTY

# i3
export PATH="${PATH}:${HOME}/.local/bin/"

# productivity hacks

## Walk the tree
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

## Show files when going into directory
function cd {
  builtin cd "$@" && statusOrDirectory
}

## Show the current git status in git directories or the files in the directory
function statusOrDirectory {
  if [[ -d .git ]]; then
    git status
  else
    ll
  fi
}

## node / npm / yarn (TODO exclude into zplug module)
alias nID="npm i --save-dev"
alias nI="npm i --save"
alias nS="npm start"
alias nD="npm run dev"
alias nB="npm run build"
alias nND="nodemon --watch src --exec \"npm run\" dev"
alias nT="npm test"

alias yA="yarn add"
alias yAD="yarn add --dev"
alias yS="yarn start"
alias yD="yarn dev"
alias yB="yarn build"
alias yND="nodemon --watch src --exec \"yarn\" dev"
alias yT="yarn test"
alias yTw="yarn test --watch"

## git (TODO exlude into zplug module)

### git add
alias ga="git add"
alias gaa="git add ."

### git branch
alias gb="git branch"
alias gbd="git branch -D"

### git checkout
alias gco="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gcb="git checkout -b"

### git commit
alias gc="git commit"
alias gcmsg="git commit -m"
alias gc!="git commit --amend"
alias gcn!="git commit --amend --no-edit"

alias gd="git diff"
alias gdc="git diff --cached"

### git push
alias gp="git push"
alias gp!="git push --force-with-lease"
alias gpnv="git push --no-verify"
alias gpnv!="git push --no-verify --force-with-lease"

### git pull
alias gl="git pull --rebase"

### git status
alias gst="git status"

### git rebase
alias gr="git rebase"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias grd="git fetch --all && git rebase origin/develop"
alias grm="git fetch --all && git rebase origin/master"

### git stash
alias gs="git stash"
alias gsp="git stash pop"

### cleanup merged branches
function git_cleanup() {
  branches=$(git branch --merged | egrep -v "(^\*|master|dev)" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g")
  cleanedBranches=$(echo "$branches" |  sed -e 's/^[[:space:]]*//')

  if [[ ! -z "$cleanedBranches" ]];then
    git branch -d "$cleanedBranches"
  fi
}

## docker

function docker_cleanup() {
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
}

alias dclean="docker_cleanup"
