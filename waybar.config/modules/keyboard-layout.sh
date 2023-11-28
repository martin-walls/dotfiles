#!/bin/bash

ACTIVE_LAYOUT=$(swaymsg -t get_inputs | jq -r '.[] | select(.name=="AT Translated Set 2 keyboard") | .xkb_active_layout_name')

ACTIVE_LAYOUT=$(echo $ACTIVE_LAYOUT | cut -d "(" -f2 | cut -d ")" -f1)

echo "$ACTIVE_LAYOUT"
