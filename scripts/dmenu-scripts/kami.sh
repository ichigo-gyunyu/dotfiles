#!/bin/bash

# dmenu script to launch other dmenu scripts
dir="$HOME/scripts/dmenu-scripts/"
prompt="Choose a dmenu script: "

op=$(ls "$dir" | dmenu -p "$prompt")
if [ -z "$op" ]; then
    exit 1
fi

"$op" &
