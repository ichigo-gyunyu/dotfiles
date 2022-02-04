#!/bin/bash

CLIENT_ID=$(pass twitch/client_id)
TOKEN=$(pass twitch/access_token)
my_username="ichigo__gyuunyuu"

curl -s \
    -H "Client-Id: $CLIENT_ID" \
    -H "Authorization: Bearer $TOKEN" \
    -X GET "https://api.twitch.tv/helix/users?login=$my_username" | jq -r ".data[].id"
