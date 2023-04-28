# ------------------------------------------------------------------------------
#
# Shell sourcing file order :
#	zshenv -> zprofile -> zshrc -> zlogin
#
# ------------------------------------------------------------------------------

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Adds ~/.local/bin and subfolders to $PATH
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# General
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# Cleaning up home folder
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Ruby env
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Deno installation
export DENO_INSTALL="/Users/papy/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
