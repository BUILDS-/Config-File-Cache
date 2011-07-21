#!/bin/bash

xrdb -merge .Xresources
nm-applet &
firefox &
pidgin &
xscreensaver &
xfce4-power-manager &
proxychains &
offlineimap &
xfce4-terminal -x 'mutt' &
xfce4-terminal -x 'emacs Documents/todo.org' &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

exec xmonad
