#!/usr/bin/env bash

get_distrib()
{
    if [[ -z $DISTRIB ]]; then
        DISTRIB=$(cat /etc/*-release |\
            grep "DISTRIB_ID" |\
            cut -c12-)
    fi
}

set_package_manager()
{
	get_distrib
	if [[ "$DISTRIB" == "Ubuntu" ||\
		"$DISTRIB" == "Debian" ||\
		"$DISTRIB" == "Mint" ]]
	then
		if [[ -z $PKG_MANAGER ]]; then PKG_MANAGER="apt"; fi
	else
		printf "Unknow distribution : %s\n" "$DISTRIB"
		exit 42
	fi
}

print_success()
{
	printf "%s\t|\t%sSuccessfully installed%s\n"\
		"$1"\
		"$COLOR_GREEN"\
		"$COLOR_NORMAL"\
		>> "$LOG_FILE"
}

print_already()
{
	printf "%s\t|\t%sAlready installed%s\n"\
		"$1"\
		"$COLOR_MAGENTA"\
		"$COLOR_NORMAL"\
		>> "$LOG_FILE"
}

print_failure()
{
	printf "%s\t|\t%sFailed%s\n"\
		"$1"\
		"$COLOR_RED"\
		"$COLOR_NORMAL"\
		>> "$LOG_FILE"
}

do_install()
{
	printf "\nInstallation de %s\n" "$1"
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
	printf "\nInstallation de %s\n" "$1"
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

