#!/bin/bash

CLIENT_ID=$(pass twitch/client_id)
CLIENT_SECRET=$(pass twitch/client_secret)

curl -X POST \
"https://id.twitch.tv/oauth2/token"\
"?client_id=$CLIENT_ID"\
"&client_secret=$CLIENT_SECRET"\
"&grant_type=client_credentials"
