# zmodload zsh/zprof

# history
SAVEHIST=100000

# vim bindings
bindkey -v


# zstyle :compinstall filename '~/.zshrc'
# autoload -Uz compinit
# compinit
fpath=( "$HOME/.zfunctions" $fpath )

# antigen time!
source ~/code/antigen/antigen.zsh

# This loads NVM
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh && . ~/.nvm/bash_completion

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


local b="antigen-bundle"

# Guess what to install when running an unknown command.
$b command-not-found

# Helper for extracting different types of archives.
$b extract

# Git und co
$b git
$b ruby
#$b heroku
#$b rhc
$b nvm
$b node
$b npm
$b golang

# OSX
$b osx

# homebrew  - autocomplete on `brew install`
$b brew
$b brew-cask

# Tracks your most used directories, based on 'frecency'.
$b robbyrussell/oh-my-zsh plugins/z

# suggestion as you type
$b zsh-users/zsh-autosuggestions

# Syntax highlighting on the readline
$b zsh-users/zsh-syntax-highlighting

# colors for all files!
$b trapd00r/zsh-syntax-highlighting-filetypes

# dont set a theme, because pure does it all
$b mafredri/zsh-async
$b sindresorhus/pure

# history search
$b zsh-users/zsh-history-substring-search


# Tell antigen that you're done.
antigen apply


# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )


# zprof

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

# enable git autocomplete
autoload bashcompinit
bashcompinit
source ~/code/gitsome/scripts/gh_complete.sh

# enable npm autocomplete
_npm_install_completion() {
	local si=$IFS

	# if 'install' or 'i ' is one of the subcommands, then...
	if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then

		# add the result of `ls ~/.npm` (npm cache) as completion options
		compadd -- $(COMP_CWORD=$((CURRENT-1)) \
			COMP_LINE=$BUFFER \
			COMP_POINT=0 \
			ls ~/.npm -- "${words[@]}" \
			2>/dev/null)
	fi

	IFS=$si
}

compdef _npm_install_completion 'npm'

# Load default dotfiles
source ~/.bash_profile
