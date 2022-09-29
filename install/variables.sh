#!/usr/bin/env bash

if [[ -z $LOG_FILE ]]; then
    LOG_FILE=/tmp/install_progress_log.txt
fi

# location of the dotfiles repo
if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

# list of packages to be installed
if [[ -z $PKG_ARR ]]; then
    PKG_ARR=(
        "zsh"
        "git"
        "stow"
        "curl"
        "i3"
        "i3lock"
        "tmux"
        "bat"
        "exa"
        "hub"
        "figlet"
    )
fi

# if [[ -z $NPM_ARR ]]; then
#     NPM_ARR=(
#     	"commitizen"
#     )
# fi

# nvim prerequisites
if [[ -z $NVIM_ARR ]]; then
    NVIM_ARR=(
        "ninja-build"
        "gettext"
        "libtool"
        "libtool-bin"
        "autoconf"
        "automake"
        "cmake"
        "g++"
        "pkg-config"
        "unzip"
        "curl"
        "doxygen"
    )
fi

# list of files to be "stowed"
if [[ -z $STOW_ARR ]]; then
    STOW_ARR=(
        "bin"
        "i3"
        "i3status"
        "iterm2"
        "nvim"
        "tmux"
        "zsh"
    )
fi
