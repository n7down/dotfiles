#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar bar &

SECONDARY_MONITOR_1="DP-1-1"
SECONDARY_MONITOR_2="DP-1-2"

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		if [[ $m == $SECONDARY_MONITOR_1 || $m == $SECONDARY_MONITOR_2 ]]; then 
			MONITOR=$m polybar --reload bar-sec &
		else
			MONITOR=$m polybar --reload bar &
		fi
	done
else
	polybar --reload bar &
fi

echo "Polybar launched..."
