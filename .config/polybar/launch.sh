#!/bin/env zsh

# Terminate already running bars
killall -q polybar

# Wait until bars have been terminated
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
# $POLYBAR --reload top bottom &
# $POLYBAR --reload bottom &
tee -a /tmp/polybar_top.log /tmp/polybar_bot.log
polybar top	2>&1 | tee -a /tmp/polybar_top.log & disown
polybar bottom	2>&1 | tee -a /tmp/polybar_bot.log & disown

#main Manage multiple monitors
# for m in $(~/polybar/build/bin/polybar --list-monitors | cut -d":" -f1); do
#     MONITOR=$m ~/polybar/build/bin/polybar --reload main &
# done
