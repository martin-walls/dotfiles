#!/bin/bash

vol=$(amixer -D pulse get Master | awk -F '[][]' '/Left:/ { print $2 }')

notify-send -t 500 -- "Volume ${vol}"

