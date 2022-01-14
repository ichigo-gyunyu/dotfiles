#!/usr/bin/bash

# If the daemon is not running, start it
pgrep -x transmission-daemon > /dev/null || transmission-daemon &

# Add the magnet link and send a notification
transmission-remote --add "$@"
dunstify -t 3000 "Torrent Added"
