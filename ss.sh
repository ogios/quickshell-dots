#!/usr/bin/bash
# echo 'geom' | socat - UNIX-CONNECT:/tmp/quickshell_zephyr.sock
shopt -s lastpipe
echo geom | nc -U /tmp/quickshell_zephyr.sock | read -d '' -r res
readarray -t y <<<"$res"

grim -g "${y[1]}" -t png "aaa.png"
