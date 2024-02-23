#!/bin/bash

blueblack="282c34"
white="abb2bf"

swaylock -f \
  --screenshots \
  --effect-scale 0.25 \
  --effect-blur 15x2 \
  --effect-scale 4 \
  --clock \
  --timestr "%H:%M" \
  --datestr "%a %d %b" \
  --indicator \
  --font "InputSerifNarrow Light" \
  --inside-color "$blueblack" \
  --text-color "$white" \
  --ignore-empty-password
