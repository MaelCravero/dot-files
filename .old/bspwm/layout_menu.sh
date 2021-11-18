#!/bin/bash

LAYOUTS="$(bsp-layout layouts)"

MENU="$(rofi -no-lazy-grab -sep "\n" -dmenu -i -p 'Layout:' \
-theme gruvbox-menu \
-hide-scrollbar true \
-bw 0 \
-fixed-num-lines 9 \
-lines 9 \
-columns 1 \
-color-enabled true \
<<< "$LAYOUTS")"

[ ! -z "$MENU" ] && bsp-layout set "$MENU"
