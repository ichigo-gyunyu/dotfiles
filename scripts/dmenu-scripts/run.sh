#!/bin/bash

dir="$HOME/scripts/run/"
prompt="FatHack Shell Scripts: "
logfile="$HOME/stuff/logs/run.log"

op=$(ls "$dir" | dmenu -p "$prompt")
if [ -z "$op" ]; then
    exit 1
fi

"$dir$op" 2>$logfile &
