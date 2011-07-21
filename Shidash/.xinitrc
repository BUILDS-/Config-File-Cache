#!/bin/bash

xrdb -merge .Xresources
nm-applet &
firefox &
pidgin &
xscreensaver &
xfce4-power-manager &
./allmydata-tahoe-1.8.2/bin/tahoe start &
proxychains &
offlineimap &
mutt
emacs Documents/todo.org
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

exec xmonad
