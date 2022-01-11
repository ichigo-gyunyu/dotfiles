#!/bin/sh

pgrep spotify|mpv > /dev/null || exit
player="spotifyd,spotify,mpv"

case $1 in
  toggle)
    status=$(playerctl --player=$player status)
    [ "$status" = "Playing" ] && playerctl --player=$player pause || \
      playerctl --player=$player play
          ;;
  prev)
    playerctl --player=$player previous ;;
  next)
    playerctl --player=$player next ;;
esac
