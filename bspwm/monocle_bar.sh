#!/bin/sh

kill_bar() {
    echo kill;
    pkill tint2;
    bspc config -m eDP1 right_padding 0
}

start_bar() {
    echo start;
    tint2 &
}

[ $# -eq 1 ] && kill_bar && exit 1

if [ $(pgrep tint2 | wc -l) -eq 0 ]
then
    echo yo
    start_bar
else
    kill_bar
fi
