#!/bin/bash

# dmenu script to launch other dmenu scripts
dirs="$HOME/scripts/dmenu-scripts/"
prompt="Choose a dmenu script: "

op=$(ls "$dirs" | dmenu -p "$prompt")
if [[ -z "$op" ]]; then
    exit 1
fi

"$op" &
