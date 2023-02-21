#!/usr/bin/env bash

do_install_custom "tpm"\
	"git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
	[ -b "$HOME/.tmux/plugins/tpm" ]
