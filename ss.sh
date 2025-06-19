#!/usr/bin/bash
# wayfreeze &
# PID=$!
# sleep .1

shopt -s lastpipe
echo geom | nc -U /tmp/quickshell_zephyr.sock | read -d '' -r res
readarray -t y <<<"$res"

# grim -g "${y[1]}" -t png "aaa.png"
grim -g "${y[1]}" -t png - | wl-copy
# kill $PID
wl-paste | satty --filename - --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png
