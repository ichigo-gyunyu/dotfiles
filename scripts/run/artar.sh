#!/bin/sh
DIR="$1"
tar -c "$DIR" | pv -s$(du -sb ./"$DIR" | awk '{print $1}') >"$DIR".tar
