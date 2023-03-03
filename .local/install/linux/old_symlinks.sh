#!/usr/bin/env bash

# ____________________________________________________________________________
#  ___                            _       
# |_ _|_ __ ___  _ __   ___  _ __| |_ ___ 
#  | || '_ ` _ \| '_ \ / _ \| '__| __/ __|
#  | || | | | | | |_) | (_) | |  | |_\__ \
# |___|_| |_| |_| .__/ \___/|_|   \__|___/
#               |_|                       
# ____________________________________________________________________________

# Current directory
if [[ -z $MY_DIR ]]
then
	MY_DIR="$(dirname "$0")"
fi

source "$MY_DIR/install/colors.sh"
source "$MY_DIR/install/variables.sh"
source "$MY_DIR/install/functions.sh"

# ____________________________________________________________________________
#  ____            _       _   
# / ___|  ___ _ __(_)_ __ | |_ 
# \___ \ / __| '__| | '_ \| __|
#  ___) | (__| |  | | |_) | |_ 
# |____/ \___|_|  |_| .__/ \__|
#                   |_|        
# ____________________________________________________________________________


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

