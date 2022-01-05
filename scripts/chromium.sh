#!/bin/sh
desktopName=$(bspc query -D -d focused --names)

# for twitch
if [ "$desktopName" = "IV" ]; then
	bspc node -p west
	bspc node -o 0.83
  hour=$(date +%H)
  if [ "$hour" -gt "08" ]  && [ "$hour" -lt "21" ]
  then
    chromium --app="https://twitch.tv/admiralbulldog" &
  else
    chromium --app="https://twitch.tv/forsen" &
  fi

else
	chromium &
fi
exit
