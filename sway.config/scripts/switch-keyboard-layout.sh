#!/bin/bash

# switch to next layout
swaymsg input type:keyboard xkb_switch_layout next

# show new active layout as a notification
ACTIVE_LAYOUT=$(swaymsg -t get_inputs | jq -r '.[] | select(.name=="AT Translated Set 2 keyboard") | .xkb_active_layout_name')

notify-send --category=quick "$ACTIVE_LAYOUT"
