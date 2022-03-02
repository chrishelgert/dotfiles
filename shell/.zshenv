# GPG/SSH
export GPG_TTY=$(tty)
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

# Golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/workspace/go"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Editor
EDITOR=nvim
export EDITOR

# dotfile included scripts
export PATH="${PATH}:${HOME}/workspace/dotfiles/bin/"

# k8s
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/config-prod"

# alias configurations
if [[ -f "$HOME/.alias" ]]; then
  source "$HOME/.alias"
fi

if [[ -f "$HOME/.alias.wsl" ]]; then
  source "$HOME/.alias.wsl"
fi

if [[ -f "$HOME/.alias.local" ]]; then
  source "$HOME/.alias.local"
fi

# local env
if [[ -f "$HOME/.env.local" ]]; then
  export $(cat "$HOME/.env.local" | xargs)
fi
