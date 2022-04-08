#!/bin/bash
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
resp="$(curl -s https://d10i.dev/api/spotify/np)"
if [[ $(echo "$resp" | jq '.isPlaying') == "true" ]]; then
  echo "$resp" | jq -r '"\(.artist) - \(.title)"'
else
  echo "Not playing"
fi
