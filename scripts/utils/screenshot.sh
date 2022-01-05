#!/bin/sh
if [ "$1" = "-f" ]; then
	import -window root $HOME/.cache/s.png
else
	import $HOME/.cache/s.png
fi
xclip -t image/png -selection clipboard -i $HOME/.cache/s.png
dunstify -t 3000 -i $HOME/.cache/s.png "Copied to Clipboard"
