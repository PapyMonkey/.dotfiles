#!/usr/bin/env bash

# ____________________________________________________________________________
# __     __         _       _     _           
# \ \   / /_ _ _ __(_) __ _| |__ | | ___  ___ 
#  \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#   \ V / (_| | |  | | (_| | |_) | |  __/\__ \
#	 \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
# ____________________________________________________________________________

ARR_BACKGROUND=(
	"redshift"
	"nm-applet"
	"lxpolkit" # Authorization prompt (essentially for 1password-cli)
)


ARR_PROGRAMS=(
	"brave"
	"thunderbird"
	"teams"
	"1password"
	"cisco"
)

ARRAY=(${ARR_BACKGROUND[@]} ${ARR_PROGRAMS[@]})

# ____________________________________________________________________________
#  ____            _       _   
# / ___|  ___ _ __(_)_ __ | |_ 
# \___ \ / __| '__| | '_ \| __|
#  ___) | (__| |  | | |_) | |_ 
# |____/ \___|_|  |_| .__/ \__|
#                   |_|        
# ____________________________________________________________________________

# i3_resurrect
i3_resurrect restore -w 1 --layout-only &
i3_resurrect restore -w 2 --layout-only &
i3_resurrect restore -w 5 --layout-only &
i3_resurrect restore -w 9 --layout-only &

# Spiral layout - Needs i3ipc (`$>pip3 install i3ipc`)
$HOME/.local/scripts/alternating_layouts.py &

# Programs
for N in "${ARRAY[@]}"
do
	"$N" &
done
