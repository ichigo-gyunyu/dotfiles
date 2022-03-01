#!/bin/sh

cat ~/.cache/weatherreport

# Query the API
response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?zip=333031,in&appid=e0e8c371e231c18f128cca649211c7bd" | jq '.weather[0].icon, .main.temp')
if [[ -z "$response" ]]; then
	exit 1
fi
# Remove quotes
response=$(echo "$response" | sed s/\"//g)
# The things we care about
# icon=$(echo "$response" | head -n 1)
# temp=$(echo "$response" | tail -n 1)
icon=$(echo ${response%%[^\x00-\x7F]*}) # Match all non ascii
temp=$(echo ${response#*[^\x00-\x7F]})
# Temperature formatting
temp=$(echo "$temp-273.15" | bc)
printf -v temp "%.0f" "$temp"

# Icon formatting
icon=$(
	case "$icon" in
	"01d") echo "  " ;;
	"01n") echo "  " ;;
	"02d") echo "  " ;;
	"02n") echo "  " ;;
	"03d") echo "  " ;;
	"03n") echo "  " ;;
	"04d") echo "  " ;;
	"04n") echo "  " ;;
	"09d") echo "  " ;;
	"09n") echo "  " ;;
	"10d") echo "  " ;;
	"10n") echo "  " ;;
	"11d") echo "  " ;;
	"11n") echo "  " ;;
	"13d") echo "  " ;;
	"13n") echo "  " ;;
	"50d") echo "  " ;;
	"50n") echo "  " ;;
	*) echo "?" ;;
	esac
)

# Save weather report to cache
echo "$icon$temp°C" >~/.cache/weatherreport
echo "$icon$temp°C"
