# ------------------------------------------------------------------------------
#
# Shell sourcing file order :
#	zshenv -> zprofile -> zshrc -> zlogin
#
# ------------------------------------------------------------------------------
 
# Theme

# Instant prompt (has to be at the very top of zshrc)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# include .zshrc_themes if it exists
[ -f "$ZDOTDIR/.zshrc_themes" ] && source "$ZDOTDIR/.zshrc_themes"

# ------------------------------------------------------------------------------
# Settings

zstyle ':omz:update' mode reminder

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# vim mode
bindkey -v 

DISABLE_UNTRACKED_FILES_DIRTY="true"

# INCLUDE : .zshrc_plugins if it exists
[ -f "$ZDOTDIR/.zshrc_plugins" ] && source "$ZDOTDIR/.zshrc_plugins"

# INCLUDE : .oh-my-zsh if it exists
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# INCLUDE : .zshrc_aliases if it exists
[ -f "$ZDOTDIR/.zshrc_aliases" ] && source "$ZDOTDIR/.zshrc_aliases"

# ------------------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
