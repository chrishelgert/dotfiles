# Workarounds

unsetopt BG_NICE # https://github.com/zplug/zplug/issues/398

# Making docker work

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
alias docker=docker.exe
alias docker-compose=docker-compose.exe

# Explorer

alias explorer=explorer.exe
alias open=explorer

# Golang

export PATH="/usr/lib/go-1.10/bin:$PATH"

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

# productivity hacks

## Walk the tree
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

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

### git push
alias gp="git push"
alias gp!="git push --force-with-lease"
alias gpnv="git push --no-verify"
alias gpnv!="git push --no-verify --force-with-lease"

### git pull
alias gl="git pull"

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

