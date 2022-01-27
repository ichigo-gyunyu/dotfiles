#!/bin/bash

PLAYER="spotifyd"
ART_CACHE_DIR="$HOME/.cache/spotify_album_art"
op=$(playerctl -p "$PLAYER" metadata &)

parse_op() {
    echo "$(echo "$op" | grep "$1" | awk '{for(i=3;i<=NF;i++){printf "%s ", $i}}')"
}

title=$(parse_op title)
artist=$(parse_op artist)
album=$(parse_op album[[:space:]])
echo $artist
albumart_url=$(parse_op artUrl)
albumart_id=$(echo "$albumart_url" | awk -F\/ '{print $NF}' | xargs) # xargs to trim whitespace

mkdir -p "$ART_CACHE_DIR"
albumart_png="$ART_CACHE_DIR/$albumart_id.png"
if [ ! -f "$albumart_png" ]; then
    curl $albumart_url --silent --output "$albumart_png"
fi

dunstify -t 3000 -r 412 -i "$albumart_png" "$title" "$album"
