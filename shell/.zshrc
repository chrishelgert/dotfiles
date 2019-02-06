# Load zplug

source ~/.zplug/init.zsh

# Plugins

zplug zsh-users/zsh-autosuggestions, from:github # TODO not working
zplug zsh-users/zsh-history-substring-search, from:github # TODO not working
zplug zsh-users/zsh-syntax-highlighting, from:github

zplug mafredri/zsh-async, from:github

# Themes

zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

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

## History

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_VERIFY
setopt SHARE_HISTORY    # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # dont record dupes in history
setopt HIST_REDUCE_BLANKS
