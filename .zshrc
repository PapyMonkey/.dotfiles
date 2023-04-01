if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# include .zshrc_paths if it exists
[ -f $HOME/.zshrc_themes ] && . $HOME/.zshrc_themes

# include .zshrc_paths if it exists
[ -f $HOME/.zshrc_paths ] && . $HOME/.zshrc_paths

# init ruby environment
eval "$(rbenv init -)"

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

zstyle ':omz:update' mode reminder

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# INCLUDE : .zshrc_plugins if it exists
[ -f $HOME/.zshrc_plugins ] && . $HOME/.zshrc_plugins

# INCLUDE : .oh-my-zsh if it exists
[ -f $ZSH/oh-my-zsh.sh ] && . $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ------------------------------------------------------------------------------
# ALIASES

# INCLUDE : .zshrc_aliases if it exists
[ -f $HOME/.zshrc_aliases ] && . $HOME/.zshrc_aliases

# Set VIM commands mode
bindkey -v

# Recursive search
bindkey '^R' history-incremental-search-backward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
