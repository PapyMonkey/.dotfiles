#!/bin/bash

# ***************************** V A R I A B L E S ******************************

COLOR_BLACK=$(tput setaf 0)
COLOR_RED=$(tput setaf 1)
COLOR_GREEN=$(tput setaf 2)
COLOR_YELLOW=$(tput setaf 3)
COLOR_LIME_YELLOW=$(tput setaf 190)
COLOR_POWDER_BLUE=$(tput setaf 153)
COLOR_BLUE=$(tput setaf 4)
COLOR_MAGENTA=$(tput setaf 5)
COLOR_CYAN=$(tput setaf 6)
COLOR_WHITE=$(tput setaf 7)
COLOR_BRIGHT=$(tput bold)
COLOR_NORMAL=$(tput sgr0)
COLOR_BLINK=$(tput blink)
COLOR_REVERSE=$(tput smso)
COLOR_UNDERLINE=$(tput smul)

LOG_FILE=/tmp/install_progress_log.txt

APT_ARR=(
	"zsh"
	"git"
	"curl"
	"i3"
	"i3lock"
	"feh"
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

# ***************************** F U N C T I O N S ******************************

print_success()
{
	printf "%s\t|\t%sSuccessfully installed%s\n"\
		"$1"\
		"$COLOR_GREEN"\
		"$COLOR_NORMAL"\
		>> $LOG_FILE
}

print_already()
{
	printf "%s\t|\t%sAlready installed%s\n"\
		"$1"\
		"$COLOR_MAGENTA"\
		"$COLOR_NORMAL"\
		>> $LOG_FILE
}

print_failure()
{
	printf "%s\t|\t%sFailed%s\n"\
		"$1"\
		"$COLOR_RED"\
		"$COLOR_NORMAL"\
		>> $LOG_FILE
}

do_install()
{
	if type -p "$1" > /dev/null
	then
		print_already "$1"
	else
		$2
		if type -p "$1" > /dev/null
		then
			print_success "$1"
		else
			print_failure "$1"
		fi
	fi
}

do_install_custom()
{
	if $3
	then
		print_already "$1"
	else
		$2
		if $3
		then
			print_success "$1"
		else
			print_failure "$1"
		fi
	fi
}

# ******************************** S C R I P T *********************************

sudo apt update && apt upgrade -y

# apt installations
for N in "${APT_ARR[@]}"
do
	do_install "$N"\
		"sudo apt -y install $N"
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
	"git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z"\
	"[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-z ]"

# nvm (Node Version Manager)
do_install_custom "nvm"\
	"sh -c $(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)"\
	# bash ;\
	# nvm install node"\
	"[ -s $HOME/.nvm/nvm.sh ]"


# ******************************************************************************

column -t $LOG_FILE
rm $LOG_FILE
