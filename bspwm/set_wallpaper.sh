#!/bin/sh

WALLPAPER_PATH=~/.config/bspwm/wallpapers

export WALLPAPER="$WALLPAPER_PATH/$(ls $WALLPAPER_PATH | shuf -n 1)"
