#!/bin/bash

followers_file="$HOME/.cache/twitchfollowers.txt"
followers_script="$HOME/scripts/twitch/followers.sh"
prompt="Twitch Channel: "

if [ ! -f $followers_file ]; then
    $followers_script
fi

channel=$(cat $followers_file | dmenu -i -p "$prompt")
if [ -z "$channel" ]; then
    exit 1
fi

chromium --app="https://twitch.tv/$channel" &
