#!/usr/bin/env bash

# oh-my-zsh
do_install_custom "oh-my-zsh"\
	"sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\
	"[ -d $HOME/.oh-my-zsh ]"
do_install_custom "zsh-autosuggestions"\
	"git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"\
	"[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]"
do_install_custom "zsh-syntax-highlighting"\
	"git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"\
	"[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]"
