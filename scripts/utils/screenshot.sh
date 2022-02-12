#!/bin/sh

SCREENSHOT_DIR="$HOME/pictures/screenshots"
mkdir -p $SCREENSHOT_DIR
PIC="$SCREENSHOT_DIR/$(date +%F_%T).png"

if [ "$1" = "-f" ]; then
	import -window root $PIC
else
	import $PIC
fi
xclip -t image/png -selection clipboard -i $PIC
dunstify -t 3000 -i $PIC "TTours" "Copied to Clipboard"
