#!/bin/bash

dir="$HOME/scripts/run/"
prompt="FatHack Shell Scripts: "

op=$(ls "$dir" | dmenu -p "$prompt")
if [ -z "$op" ]; then
    exit 1
fi

"$op" &
