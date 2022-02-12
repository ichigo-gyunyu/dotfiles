#!/bin/bash

dirs=("$HOME/stuff/4-2" "$HOME/stuff/docs/read" "$HOME/stuff/tcs")

for d in ${dirs[@]}; do
    docs+=$(find "$d" -name "*.pdf" -or -name "*.djvu")"\n"
done

op=$(echo -e "$docs" | dmenu -l 7 -i -p "Open a document: ")
if [ -z "$op" ]; then
    exit 1
fi

zt "$op" &
