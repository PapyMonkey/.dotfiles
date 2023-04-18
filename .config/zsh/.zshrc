# ------------------------------------------------------------------------------
#
# Shell sourcing file order :
#	zshenv -> zprofile -> zshrc -> zlogin
#
# ------------------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aguiri/Apps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aguiri/Apps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aguiri/Apps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aguiri/Apps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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

eval "$(rbenv init -)" # init ruby environment

[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]\
	&& eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # Homebrew

zstyle ':omz:update' mode reminder

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

DISABLE_UNTRACKED_FILES_DIRTY="true"

# INCLUDE : .zshrc_plugins if it exists
[ -f "$ZDOTDIR/.zshrc_plugins" ] && source "$ZDOTDIR/.zshrc_plugins"

# INCLUDE : .oh-my-zsh if it exists
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# Aliases

# INCLUDE : .zshrc_aliases if it exists
[ -f "$ZDOTDIR/.zshrc_aliases" ] && source "$ZDOTDIR/.zshrc_aliases"

# ------------------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
