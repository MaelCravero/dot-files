#!/bin/sh

# Startup programs
setxkbmap -option "caps:escape"
redshift-gtk -g 0.9:0.9:0.7 &

pulseaudio
picom -b

discord --start-minimized
slack -u
thunderbird
