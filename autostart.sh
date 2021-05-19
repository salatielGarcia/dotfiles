#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

## Desktop notification
/usr/lib/xfce4/notifyd/xfce4-notifyd &

## XFCE4 Settings
xfsettingsd &

## Volume control for systray
(volumeicon) &


## Turn off/on System Beep
xset b off

## Enable power management
xfce4-power-manager &

## XFCE4 Settings
xfsettingsd &

(nm-applet) &
# lxsession &
picom &
nitrogen --restore &
xautolock -detectsleep -time 5 -locker "/usr/local/bin/lock_and_blur.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'locking screen in 30 seconds'"
