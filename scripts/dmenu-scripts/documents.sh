#!/bin/bash

dirs=("$HOME/stuff/4-2" "$HOME/stuff/docs")

for d in ${dirs[@]}; do
    docs+=$(find "$d" -name "*.pdf" -or -name "*.djvu")
done

op=$(echo "$docs" | dmenu -l 7 -i -p "Open a document: ")
if [[ -z "$op" ]]; then
    exit 1
fi

zt "$op" &
