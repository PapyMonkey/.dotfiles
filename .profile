# include .zshrc_paths if it exists
[ -f $HOME/.zshrc_paths ] && . $HOME/.zshrc_paths
. "$HOME/.cargo/env"
