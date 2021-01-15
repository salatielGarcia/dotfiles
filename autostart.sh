#!/bin/bash

lxsession &
picom &
nitrogen --restore &
xautolock -detectsleep -time 5 -locker "/usr/local/bin/lock_and_blur.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'locking screen in 30 seconds'"
