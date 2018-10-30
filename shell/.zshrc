# Load zplug

source ~/.zplug/init.zsh

# Plugins

zplug zsh-users/zsh-autosuggestions, from:github

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
