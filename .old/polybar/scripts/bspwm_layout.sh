#!/bin/bash

MODE=$(bsp-layout get $(bspc query -D -d focused --names))

MONOCLE=' '
TILED=' '
EVEN=' '
GRID=' '
TALL='ﱨ '
#TALL=' '
WIDE=' '

case "$MODE" in
    -) echo "$TILED";;
    tiled) echo "$TILED";;
    monocle) echo "$MONOCLE";;
    even) echo "$EVEN";;
    grid) echo "$GRID";;
    rgrid) echo "$GRID";;
    tall) echo "$TALL";;
    rtall) echo "$TALL";;
    wide) echo "$WIDE";;
    rwide) echo "$WIDE";;
    *) echo "error";;
esac
