# Load zplug

source ~/.zplug/init.zsh

# Plugins

zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-history-substring-search, from:github
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
