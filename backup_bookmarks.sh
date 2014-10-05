#!/bin/bash -
# Get path to Dropbox.
DROPBOXPATH=$(cat "/Users/$USER/.dropbox/host.db" | head -2 | tail -1 | base64 -D)

JSONFILE=Pinboard_$(date +%Y%m%d_%H%M%S).json

# Get Pinboard.in API token from .netrc.
NETRC=($(/Users/$USER/Library/Scripts/Applications/get_netrc.py "pinboard.in"))
USERNAME=${NETRC[0]}
PASSWORD=${NETRC[1]}

cd /Users/$USER/Library/

# Call Pinboard API and create a formatted json file in /tmp.
curl "https://api.pinboard.in/v1/posts/all?format=json&auth_token=$USERNAME:$PASSWORD" | python -mjson.tool > /tmp/${JSONFILE}

# Encrypt json file to Dropbox.
./Scripts/Applications/openssl_encrypt.sh /tmp/${JSONFILE} ${DROPBOXPATH}/Private/Backups/Pinboard/${JSONFILE}.enc

rm -f /tmp/${JSONFILE}