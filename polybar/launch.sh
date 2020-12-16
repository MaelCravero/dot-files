#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
# Primary screen first to get the trail
#MONITOR="eDP1" polybar -c ~/.config/polybar/config.ini main &

# All remaining screens afterwards
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo $m;
        MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
    done
fi
