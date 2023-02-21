#!/usr/bin/env bash

# z (plugin)
do_install_custom "z"\
	"git clone https://github.com/agkozak/zsh-z\
	${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z"\
	"[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-z ]"
