#!/bin/bash

# https://askubuntu.com/a/1284966
index=$(pacmd list-sources | egrep 'index|ports|analog-input-headset-mic' | egrep '\*\sindex:\s+[0-9]'  | cut -d':' -f2);

acpi_listen | while IFS= read -r line;
do
    if [ "$line" = "jack/headphone HEADPHONE plug" ]
    then
       pacmd set-source-port $index analog-input-headset-mic;
    elif [ "$line" = "jack/headphone HEADPHONE unplug" ]
    then
       pacmd set-source-port $index analog-input-internal-mic;
    fi
done
