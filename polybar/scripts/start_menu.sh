#!/bin/bash

# Custom Rofi Script

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'System :' \
-theme gruvbox-menu \
-hide-scrollbar true \
-bw 0 \
-lines 4 \
-xoffset 12 -yoffset -48 \
-location 7 \
-columns 1 \
-color-enabled true \
<<< "  Lock|  Logout|  Reboot|  Shutdown")"
case "$MENU" in
  *Lock) betterlockscreen -l;;
  *Logout) bspc quit;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff
esac

# More Options
# -fullscreen \
