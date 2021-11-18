#!/bin/bash

LAYOUTS="single
dual
external
internal"

MENU="$(rofi -no-lazy-grab -sep "\n" -dmenu -i -p 'Screen Layout:' \
-theme gruvbox-menu \
-hide-scrollbar true \
-bw 0 \
-fixed-num-lines 9 \
-lines 9 \
-columns 1 \
-color-enabled true \
<<< "$LAYOUTS")"

[ ! -z "$MENU" ] &&
    ~/.config/bspwm/update_monitors.sh "eDP1" "HDMI1" "$MENU" '1' '2'

# Start polybar and tint2
~/.config/polybar/launch.sh
