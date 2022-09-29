#!/usr/bin/env bash

# oh-my-zsh
do_install_custom "oh-my-zsh"\
	"sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\
	"[ -d $HOME/.oh-my-zsh ]"
