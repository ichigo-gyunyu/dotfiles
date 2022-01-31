#!/bin/bash

playerctl -p spotify metadata -F | while read line;
do
    echo $line
done
