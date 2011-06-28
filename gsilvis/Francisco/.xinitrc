#!/bin/bash

## Workaround to Debian bug #578587
dbus-launch
export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/*-0`
gnome-keyring-daemon --start

~/.fehbg &
xsetroot -cursor_name left_ptr &

gnome-screensaver &
gnome-power-manager &
nm-applet &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 7 --transparent true --tint 0x000000 --height 12 &

exec xmonad
