#!/bin/bash

dbus-launch
export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/-0`
gnome-keyring-daemon --start

nm-applet &
xscreensaver -nosplash &
gnome-power-manager &

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --tint 0x000000 --height 12 --transparent true --alpha 0 &

exec ck-launch-session xmonad
