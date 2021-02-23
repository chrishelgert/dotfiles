# TODO split into multiple files
if [[ -f "$HOME/.alias" ]]; then
  source "$HOME/.alias"
fi

if [[ -f "$HOME/.alias.wsl" ]]; then
  source "$HOME/.alias.wsl"
fi

if [[ -f "$HOME/.alias.local" ]]; then
  source "$HOME/.alias.local"
fi

# GPG/SSH
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/workspace/go"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Editor
EDITOR=nvim
export EDITOR
alias editor=$EDITOR
alias vim=$EDITOR

# bat
alias cat=bat # https://github.com/sharkdp/bat#customization

# kitten
alias icat="kitty +kitten icat" # show images in terminal

# exa
alias ls=exa # https://github.com/ogham/exa#options
alias ll="ls -la"

# gopass gpg
GPG_TTY=$(tty)
export GPG_TTY

# dotfile included scripts
export PATH="${PATH}:${HOME}/workspace/dotfiles/bin/"

# i3
export PATH="${PATH}:${HOME}/.local/bin/"

# k8s
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/config-prod"

# productivity hacks

## Walk the tree
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

## Open (cross plattform)
function open {
  if [ -n xdg-open ];then
    xdg-open $1
  else
    open $1
  fi;
}

## Go to dotfiles folder
alias dotfiles="cd ~/workspace/dotfiles"

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
alias gap="git add -p"

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
alias gc!="git commit --amend",
alias gcn!="git commit --amend --no-edit"

alias gd="git diff"
alias gdc="git diff --cached"

### git push
function gp {
  output="$(git push 2>&1)"
  url="$(echo $output | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')"

  echo "$output"

  if [ -n $url ];then
    open "$url" > /dev/null 2>&1
  fi
}
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


## docker

function docker_cleanup() {
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
}

alias dclean="docker_cleanup"
