#!/bin/bash

playing=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon="󰓇"
fulltrackinfo=""

if [[ $playing == "playing" ]]; then
  trackinfo=$(playerctl metadata --player=spotify --format '{{title}} - {{artist}}')
  fulltrackinfo=$trackinfo
  if [[ ${#trackinfo} > 25 ]]; then
    trackinfo=$(echo $trackinfo | cut -c1-22)"..."
  fi
  text=$icon" "$trackinfo
elif [[ $playing == "paused" ]]; then
  text=$icon
elif [[ $playing == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$playing"\", \"tooltip\":\""$fulltrackinfo"\"}"
