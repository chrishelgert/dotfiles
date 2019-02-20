# Load zplug
source ~/.zplug/init.zsh

# Theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Plugins
zplug "lib/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github

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
## pure
PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL="λ"
PURE_PROMPT_VICMD_SYMBOL="»"
PURE_GIT_DOWN_ARROW='↓'
PURE_GIT_UP_ARROW='↑'

## zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

