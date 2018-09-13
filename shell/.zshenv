# Workarounds

unsetopt BG_NICE # https://github.com/zplug/zplug/issues/398

# Spaceship - configuration (https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md)

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

## node / npm / yarn (TODO exclude into zplug module)
alias yS="yarn start"
alias yD="yarn dev"
alias yB="yarn build"
alias yND="nodemon --watch src --exec \"yarn\" dev"

## git (TODO exlude into zplug module)
alias ga="git add"
alias gaa="git add ."

alias gcm="git checkout master"
alias gcd="git checkout develop"

alias gcmsg="git commit -m"
alias gc!="git commit --amend"
alias gc!!="git commit --amend --no-edit"

alias gp="git push"
alias gp!="git push -f"
alias gp!!="git push -f --no-verify"

alias gl="git pull"

alias gst="git status"

