# install zplug

if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
fi

# Load zplug

source ~/.zplug/init.zsh

# Plugins

# Themes

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
ZSH_THEME="spaceship"

# Install plugins and theme

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# Load zplug

zplug load

# Making docker work

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
alias docker=docker.exe
alias docker-compose=docker-compose.exe

# Golang

export PATH="/usr/lib/go-1.11/bin:$PATH"

# Rust

export PATH="$HOME/.cargo/bin:$PATH"

# Editor

EDITOR=nvim
export EDITOR
alias editor=$EDITOR
alias vim=$EDITOR

# bat

export cat=bat # https://github.com/sharkdp/bat#customization

# exa
export ls=exa -la # https://github.com/ogham/exa#options
