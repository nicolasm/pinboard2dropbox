#!/bin/bash -
jq ".[] | select((.description | contains(\"$1\")) or (.tags | contains(\"$1\")) or (.href | contains(\"$1\")) or (.extended | contains(\"$1\"))) | .description, .href" ~/Dropbox/Backups/Pinboard/Pinboard.json
