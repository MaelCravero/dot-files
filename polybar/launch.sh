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
        #MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
        MONITOR=$m polybar -c ~/.config/polybar/config.ini top &
        MONITOR=$m polybar -c ~/.config/polybar/config.ini left &
        MONITOR=$m polybar -c ~/.config/polybar/config.ini right &
    done
fi

pkill tint2
tint2 -c ~/.config/tint2/central_module.tint2rc &

xdo lower -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" $(xdo id -n tint2)
