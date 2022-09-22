#!/bin/bash

LOG_FILE=/tmp/install_progress_log.txt

PKG_ARR=(
	"zsh"
	"git"
	"curl"
	"i3"
	"i3lock"
	# "python3-pip"
	"tmux"
	"bat"
	"exa"
	"hub"
	"figlet"
)

SNAP_ARR=(
	"spt"
)

# NPM_ARR=(
# 	"commitizen"
# )

# nvim prerequisites
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
