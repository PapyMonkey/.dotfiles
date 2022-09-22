#!/bin/bash

# ***************************** V A R I A B L E S ******************************

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  # if $SOURCE was a relative symlink, we need to resolve it relative to the
  # path where the symlink file was located :
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE 
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

echo "$DIR"
REPO_DIR=${DIR%/*/*}
echo "$REPO_DIR"

CONFIG_ARR=(
    "filezilla"
    "i3"
    "i3status"
    "nvim"
    "tmux"
)

SIMPLE_ARR=(
    "gitconfig"
    "zshrc"
)

# ******************************** S C R I P T *********************************

# remove existing dotfiles
for A in "${CONFIG_ARR[@]}"
do
    sudo rm -rf "$HOME/.$A" > /dev/null 2>&1
    sudo rm -rf "$HOME/.config/$A" > /dev/null 2>&1
done
for B in "${SIMPLE_ARR[@]}"
do
    sudo rm -rf "$HOME/.$B" > /dev/null 2>&1
done

# create symlinks
mkdir -p "$HOME/.config"
for C in "${CONFIG_ARR[@]}"
do
    ln -sf "$REPO_DIR/.config/$C" "$HOME/.config/$C"
done
for D in "${SIMPLE_ARR[@]}"
do
    ln -sf "$REPO_DIR/.$D" "$HOME/.$D"
done

# tmux case
ln -sf "$REPO_DIR/.config/tmux/tmux.conf" "$HOME/.tmux.conf"

# set zsh as default
sudo chsh -s /bin/zsh
