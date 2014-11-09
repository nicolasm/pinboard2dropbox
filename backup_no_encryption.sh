#!/bin/bash -
JSONFILE=Pinboard_$(date +%Y%m%d_%H%M%S).json

# Get Pinboard.in API token from .netrc.
NETRC=($(/Users/$USER/Library/Scripts/Applications/get_netrc.py "pinboard.in"))
USERNAME=${NETRC[0]}
TOKEN=${NETRC[1]}

curl "https://api.pinboard.in/v1/posts/all?format=json&auth_token=$USERNAME:$TOKEN" | python -mjson.tool > /tmp/${JSONFILE}

mv /tmp/${JSONFILE} ~/"SpiderOak Hive"/Backups/Pinboard/