#!/bin/sh

# Startup programs
setxkbmap -option "ctrl:nocaps"
xcape -e "Control_L=Escape;Alt_L=BackSpace;ISO_Level3_Shift=Return"
redshift-gtk -g 0.9:0.9:0.7 -l 48.853:2.35 &
nm-applet &

pulseaudio --start

nitrogen --restore &

#discord --start-minimized &
#slack -u &
#thunderbird &

xautolock -time 10 -locker "betterlockscreen -l" &

# Alt-Tab switcher
# alttab -bg '#282828' -fg '#fbf1c7' -frame '#d79921' -i '64x64' &

ulauncher --hide-window --no-window-shadow &
