#!/bin/bash

percent=$(amixer sget Capture | sed -En 's/.*\[([0-9]+)%\].*/\1/p' | head -1)

# echo -e "{\"percentage\":\""$percent"\"}"
echo -e $percent
