#!/bin/sh

# based on https://www.reddit.com/r/bspwm/comments/au6ody/update_desktops_on_monitor_change

[ $# -lt 3 ] && exit 1

INTERNAL_MONITOR="$1"
EXTERNAL_MONITOR="$2"

MODE="$3"

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

monitor_external() {
    ~/.screenlayout/external.sh
    bspc monitor "$EXTERNAL_MONITOR" -d $@ > /dev/null
    for i in $@; do
        echo $i
        bspc desktop "$i" -m "$EXTERNAL_MONITOR"
    done
    bspc monitor "$INTERNAL_MONITOR" --remove > /dev/null
    notify-send "external screen"
}

monitor_internal() {
    ~/.screenlayout/single.sh
    bspc monitor "$INTERNAL_MONITOR" -d $@ > /dev/null
    for i in $@; do
        echo $i
        bspc desktop "$i" -m "$INTERNAL_MONITOR"
    done
    bspc monitor "$EXTERNAL_MONITOR" --remove > /dev/null
    notify-send "internal screen"
}

case "$MODE" in
    single)   monitor_remove $@;;
    dual)     monitor_add $@;;
    external) monitor_external '1' '2' '3' '4' '5' '6';;
    internal) monitor_internal '1' '2' '3' '4' '5' '6';;
    *)
        if xrandr | grep -o "$EXTERNAL_MONITOR connected" > /dev/null; then
            monitor_add $@
        else
            monitor_remove $@
        fi
        ;;
esac

#feh --bg-max "$WALLPAPER" -B "#282828" &
pkill nitrogen
nitrogen --restore &
