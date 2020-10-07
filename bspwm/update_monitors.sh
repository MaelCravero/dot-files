#!/bin/sh

# based on https://www.reddit.com/r/bspwm/comments/au6ody/update_desktops_on_monitor_change

[ $# -lt 3 ] && exit 1

INTERNAL_MONITOR="$1"
EXTERNAL_MONITOR="$2"

shift 2

monitor_add() {
    ~/.screenlayout/dual.sh
    for i in $@; do
        echo $i
        bspc desktop "$i" --to-monitor "$EXTERNAL_MONITOR"
    done
    bspc desktop Desktop --remove > /dev/null
    notify-send "dual screen"
}

monitor_remove() {
    bspc monitor "$EXTERNAL_MONITOR" -a Desktop > /dev/null
    ~/.screenlayout/single.sh
    for i in $@; do
        echo $i
        bspc desktop "$i" --to-monitor "$INTERNAL_MONITOR"
    done
    bspc monitor "$EXTERNAL_MONITOR" --remove > /dev/null
    notify-send "single screen"
}

if xrandr | grep -o "$EXTERNAL_MONITOR connected" > /dev/null; then
    monitor_add $@
else
    monitor_remove $@
fi
