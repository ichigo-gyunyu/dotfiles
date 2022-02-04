#!/bin/bash

TOKEN=$(pass twitch/access_token)
CLIENT_ID=$(pass twitch/client_id)
USER_ID=$(~/scripts/twitch/user_id.sh)

curl -s \
    -X GET "https://api.twitch.tv/helix/users/follows?from_id=$USER_ID&first=100" \
	-H "Authorization: Bearer $TOKEN" \
	-H "Client-Id: $CLIENT_ID" | jq -r '.data[].to_name' | \
    tac >$HOME/.cache/twitchfollowers.txt
