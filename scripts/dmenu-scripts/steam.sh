#!/bin/bash

games="dota\nCeleste\nMuse Dash\nCuphead\nHollow Knight\nDark Souls: Remastered"
op=$(echo -e "$games" | dmenu -i -p "GabeN Clap: ")

case $op in
  "dota") steam steam://rungameid/570 & ;;
  "Celeste") steam steam://rungameid/504230 & ;;
  "Muse Dash") steam steam://rungameid/774171 & ;;
  "Cuphead") steam steam://rungameid/268910 & ;;
  "Hollow Knight") steam steam://rungameid/367520 & ;;
  "Dark Souls: Remastered") steam steam://rungameid/570940 & ;;
esac
case $op in
