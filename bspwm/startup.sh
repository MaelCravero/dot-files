#!/bin/sh

# Startup programs
setxkbmap -option "caps:escape"
redshift-gtk -g 0.9:0.9:0.7 &
nm-applet &

pulseaudio --start
picom -b

discord --start-minimized &
slack -u &
thunderbird &

xautolock -time 10 -locker "betterlockscreen -l" &

# Alt-Tab switcher
# alttab -bg '#282828' -fg '#fbf1c7' -frame '#d79921' -i '64x64' &
