#!/usr/bin/env bash

# ***************************** V A R I A B L E S ******************************

source "$(dirname "$0")"/colors.sh
source "$(dirname "$0")"/variables.sh
source "$(dirname "$0")"/functions.sh

# ******************************** S C R I P T *********************************

# fxck tmux begin
rm -f ~/.tmux.conf

pushd "$DOTFILES" > /dev/null || exit

for N in "${STOW_ARR[@]}"; do
    stow -D "$N"
    stow "$N"
    printf "Stow-ed : %s\n" "$N"
done

popd > /dev/null || exit

# fxck tmux end
ln -s "$DOTFILES/tmux/.config/tmux/tmux.conf" ~/.tmux.conf
