#!/bin/bash

# New version to work with sworkstyle's dynamic workspace names.
# Works with workspace numbers rather than names.

i=1

for w in $(swaymsg -t get_tree | jq '.nodes[].nodes[] | select(.type == "workspace") | select(has("num")) | .num'); do
  if [ $i != $w ]; then
    # found a gap in consecutive workspaces
    # so use the number we got to as the new workspace
    break
  fi
  i=$(($i+1))
done

echo $i
