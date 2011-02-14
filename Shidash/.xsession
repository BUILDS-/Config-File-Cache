#!/bin/bash

xrdb -merge .Xresources

nm-applet &
dropbox start &
firefox &
banshee &
skype &
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

exec xmonad
