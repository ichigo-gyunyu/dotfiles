#!/bin/bash

dirs="$HOME/hdd/anime/"
clean_dirs=$(find $dirs -type d | sed "s|$dirs||g")
prompt="Filthy Weeb: "

op=$(echo "$clean_dirs" | dmenu -l 7 -g 3 -i -p "$prompt")
if [ -z "$op" ]; then
    exit 1
fi

path="$dirs${op}"
mpv "$path" &
