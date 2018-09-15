#!/bin/bash -
# Get path to Dropbox.
DROPBOXPATH=$(cat "/home/$USER/.dropbox/host.db" | head -2 | tail -1 | base64 -d)

JSONFILE=Pinboard_$(date +%Y%m%d_%H%M%S).json

# Get Pinboard.in API token from .netrc.
NETRC=($(/home/$USER/Scripts/Applications/get_netrc.py "pinboard.in"))
USERNAME=${NETRC[0]}
TOKEN=${NETRC[1]}

cd /home/$USER/

# Call Pinboard API and create a formatted json file in /tmp.
curl "https://api.pinboard.in/v1/posts/all?format=json&auth_token=$USERNAME:$TOKEN" | python -mjson.tool > /tmp/${JSONFILE}

# Encrypt json file to Dropbox.
./Scripts/Applications/openssl_encrypt.sh /tmp/${JSONFILE} ${DROPBOXPATH}/Private/Backups/Pinboard/${JSONFILE}.enc

rm -f /tmp/${JSONFILE}
