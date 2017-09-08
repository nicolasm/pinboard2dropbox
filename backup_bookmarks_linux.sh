#!/bin/bash -
HTMLFILE=Pinboard_$(date +%Y%m%d_%H%M%S).json

# Get Pinboard.in API token from .netrc.
NETRC=($(/home/$USER/Scripts/Applications/get_netrc.py "pinboard.in"))
USERNAME=${NETRC[0]}
TOKEN=${NETRC[1]}

cd /Users/$USER/

# Call Pinboard API and create a formatted json file in /tmp.
curl "https://api.pinboard.in/v1/posts/all?format=html&auth_token=$USERNAME:$TOKEN" | python -mjson.tool > /tmp/${HTMLFILE}

rm -f /tmp/${JSONFILE}
