#!/bin/bash

## Workaround to Debian bug #578587
#
## (not needed, as I don't use nm-applet any more)
#
# dbus-launch
# export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/*-0`
# gnome-keyring-daemon --start

~/.fehbg &
xsetroot -cursor_name left_ptr &

xfce4-power-manager &
xscreensaver &


# <3 wpa_supplicant
/usr/sbin/wpa_gui -t &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 7 --transparent true --tint 0x000000 --height 12 &

exec xmonad
