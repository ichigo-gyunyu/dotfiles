#!/bin/bash

dirs="$HOME/hdd/anime/"
clean_dirs=$(find $dirs -type d | sed "s|$dirs||g")

op=$(echo "$clean_dirs" | dmenu -l 7 -g 3 -i -p "Filthy Weeb: ")
if [[ -z "$op" ]]; then
    exit 1
fi

path="$dirs${op}"
mpv "$path"
