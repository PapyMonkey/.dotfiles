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

source "$DIR/../colors.sh"
source "$DIR/../variables.sh"
source "$DIR/../functions.sh"

# ******************************** S C R I P T *********************************

set_package_manager

sudo "$PKG_MANAGER" update
sudo "$PKG_MANAGER" upgrade -y

# apt installations
for N in "${PKG_ARR[@]}"
do
	do_install "$N"\
		"sudo $PKG_MANAGER -y install $N"
done

# snap installations
for N in "${SNAP_ARR[@]}"
do
	do_install "$N"\
		"sudo snap -y install $N"
done

# npm installations
for N in "${NPM_ARR[@]}"
do
	do_install "$N"\
		"sudo npm -g install $N"
done

# oh-my-zsh
do_install_custom "oh-my-zsh"\
	"sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\
	"[ -d $HOME/.oh-my-zsh ]"

# z (plugin)
do_install_custom "z"\
	"git clone https://github.com/agkozak/zsh-z\
	${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z"\
	"[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-z ]"

# nvm (Node Version Manager)
do_install_custom "nvm"\
	"sh -c $(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)\
	bash ; nvm install node > /dev/null"
	"[ -f $HOME/.nvm/nvm.sh ]"

# (neo)Vim
source "$DIR/../nvim.sh"

# ******************************************************************************

echo ; column -t "$LOG_FILE"
rm "$LOG_FILE"
