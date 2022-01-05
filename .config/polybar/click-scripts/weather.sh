#!/bin/sh
bspc rule -a Alacritty -o state=floating center=true rectangle=1200x900+0+0
alacritty --hold -o "background_opacity=1" -e curl wttr.in &
