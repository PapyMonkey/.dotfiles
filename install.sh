#!/usr/bin/env bash

# ***************************** V A R I A B L E S ******************************

source "$(dirname "$0")"/install/colors.sh
source "$(dirname "$0")"/install/variables.sh
source "$(dirname "$0")"/install/functions.sh

# ******************************** S C R I P T *********************************

set_package_manager

sudo "$PKG_MANAGER" update
sudo "$PKG_MANAGER" upgrade -y

# {package-manager} installations
for N in "${PKG_ARR[@]}"
do
	do_install "$N"\
		"sudo $PKG_MANAGER -y install $N"
done

# snap installations
# for N in "${SNAP_ARR[@]}"
# do
# 	do_install "$N"\
# 		"sudo snap -y install $N"
# done

# npm installations
# for N in "${NPM_ARR[@]}"
# do
# 	do_install "$N"\
# 		"sudo npm -g install $N"
# done

source "$(dirname "$0")"/../install_omz.sh
source "$(dirname "$0")"/../install_tmux_tpm.sh

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
../nvim.sh

# ******************************************************************************

echo ; column -t "$LOG_FILE"
rm "$LOG_FILE"
