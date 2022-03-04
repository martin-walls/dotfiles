#!/bin/bash

exec xautolock -detectsleep \
  -time 10 -locker "~/.config/awesome/lockscreen.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 30000 -- 'Locking screen in 30 seconds'"
