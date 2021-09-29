#!/bin/bash
export PATH=$PATH:~/.zinit/plugins/stedolan---jq
resp="$(curl -s https://d10i.dev/api/spotify/np)"
if [[ $(echo "$resp" | jq '.isPlaying') == "true" ]]; then
  echo "$resp" | jq -r '"\(.artist) - \(.title)"'
else
  echo "Not playing"
fi
