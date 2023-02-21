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

# Path to NeoVim installation
if [[ -z $NVIM_PATH ]]
then
    NVIM_PATH="$HOME/nvim"
fi

# ____________________________________________________________________________
#  ____            _       _   
# / ___|  ___ _ __(_)_ __ | |_ 
# \___ \ / __| '__| | '_ \| __|
#  ___) | (__| |  | | |_) | |_ 
# |____/ \___|_|  |_| .__/ \__|
#                   |_|        
# ____________________________________________________________________________

if type -p "nvim" > /dev/null
then
    print_already "nvim"
else
    set_package_manager
    sudo "$PKG_MANAGER" update
    sudo "$PKG_MANAGER" upgrade -y
    for N in "${NVIM_ARR[@]}"
    do
        do_install "$N"\
            "sudo $PKG_MANAGER -y install $N"
    done
    git clone https://github.com/neovim/neovim.git "$NVIM_PATH"
    cd "$NVIM_PATH" || exit
    git checkout stable
    make CMAKE_BUILD_TYPE=Release
    sudo make install
    if $3
    then
        print_success "nvim"
    else
        print_failure "nvim"
    fi
fi
