#!/bin/sh

pkill pulseaudio
pkill pa-applet
pulseaudio --start
#pa-applet
