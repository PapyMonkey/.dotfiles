#!/bin/bash

# ***************************** V A R I A B L E S ******************************

source colors.sh
source variables.sh
source functions.sh

NVIM_PATH="$HOME/nvim"

# ******************************** S C R I P T *********************************

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
