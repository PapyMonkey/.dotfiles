#!/usr/bin/env bash

# ____________________________________________________________________________
#  ___                            _       
# |_ _|_ __ ___  _ __   ___  _ __| |_ ___ 
#  | || '_ ` _ \| '_ \ / _ \| '__| __/ __|
#  | || | | | | | |_) | (_) | |  | |_\__ \
# |___|_| |_| |_| .__/ \___/|_|   \__|___/
#               |_|                       
# ____________________________________________________________________________

# Current directory
if [[ -z $MY_DIR ]]
then
	MY_DIR="$(dirname "$0")"
fi

# shellcheck source=/dev/null
source ./colors.sh
# shellcheck source=/dev/null
source ./variables.sh
# shellcheck source=/dev/null
source ./functions.sh

# ____________________________________________________________________________
#  ____            _       _   
# / ___|  ___ _ __(_)_ __ | |_ 
# \___ \ / __| '__| | '_ \| __|
#  ___) | (__| |  | | |_) | |_ 
# |____/ \___|_|  |_| .__/ \__|
#                   |_|        
# ____________________________________________________________________________

# {package-manager} installations
set_package_manager
sudo "$PKG_MANAGER" update
sudo "$PKG_MANAGER" upgrade -y
for N in "${ARR_PKG[@]}"
do
	do_install "$N"\
		"sudo $PKG_MANAGER -y install $N"
done

# snap installations
for N in "${ARR_SNAP[@]}"
do
	do_install "$N"\
		"sudo snap -y install $N"
done

# custom installations
for N in "${ARR_CUSTOM[@]}"
do
	# shellcheck source=/dev/null
	source "$N"
done

# ____________________________________________________________________________

echo ; column -t "$LOG_FILE"
rm "$LOG_FILE"
