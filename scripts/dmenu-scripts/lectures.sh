#!/bin/bash

dirs="$HOME/hdd/recordings/"
clean_dirs=$(find $dirs -type d | sed "s|$dirs||g")
prompt="Untr00 Time: "

op=$(echo "$clean_dirs" | dmenu -l 7 -i -p "$prompt")
if [[ -z "$op" ]]; then
    exit 1
fi

path="$dirs${op}"
mpv "$path" &
