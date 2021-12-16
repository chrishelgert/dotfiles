
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# Load zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Theme
eval "$(starship init zsh)"

# Plugins
zplug "lib/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "g-plane/zsh-yarn-autocompletions", from:github, hook-build:"./zplug.zsh", defer:2

# Install plugins and theme
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# Load zplug
zplug load

# Config

## zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## k8s
source <(kubectl completion zsh)

## needed for gpg
export GPG_TTY=$(tty)


#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
