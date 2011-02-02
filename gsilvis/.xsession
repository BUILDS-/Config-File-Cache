#!/bin/sh

nm-applet &
thunar --daemon &
gnome-power-manager &
gnome-screensaver &
dropbox start &
skype &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 8 --transparent true --tint 0x000000 --height 12 &

eval `cat ~/.fehbg` &

exec xmonad
