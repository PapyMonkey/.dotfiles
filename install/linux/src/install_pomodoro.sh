#!/usr/bin/env bash

# Timer
do_install\
	"timer"\
	"echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list && sudo snap -y install timer"

# spd-say package installed in PKG_ARR
# sudo apt install -y speech-dispatcher

