#!/usr/bin/env bash

# ____________________________________________________________________________
#  ____       _   _         
# |  _ \ __ _| |_| |__  ___ 
# | |_) / _` | __| '_ \/ __|
# |  __/ (_| | |_| | | \__ \
# |_|   \__,_|\__|_| |_|___/
# ____________________________________________________________________________

# Current directory
if [[ -z $MY_DIR ]]
then
	MY_DIR="$(dirname "$0")"
fi

# Logs
if [[ -z $LOG_FILE ]]
then
    LOG_FILE=/tmp/install_progress_log.txt
fi

# Dotfiles repo
if [[ -z $DOTFILES ]]
then
    DOTFILES=$HOME/.dotfiles
fi

# ____________________________________________________________________________
#     _                             
#    / \   _ __ _ __ __ _ _   _ ___ 
#   / _ \ | '__| '__/ _` | | | / __|
#  / ___ \| |  | | | (_| | |_| \__ \
# /_/   \_\_|  |_|  \__,_|\__, |___/
#                         |___/     
# ____________________________________________________________________________

# Packages list
if [[ -z $ARR_PKG ]]
then
	mapfile -t ARR_PKG < "$MY_DIR/data/list_packages"
fi

# Snaps list
if [[ -z $ARR_SNAP ]]
then
	mapfile -t ARR_SNAP < "$MY_DIR/data/list_snaps"
fi

# Nvim (prerequisites) list
if [[ -z $ARR_NVIM ]]
then
	mapfile -t ARR_NVIM < "$MY_DIR/data/list_nvim_prerequisites"
fi

# Custom installation scripts list
if [[ -z $ARR_CUSTOM ]]
then
	ARR_CUSTOM=(./src/*.sh)
fi
