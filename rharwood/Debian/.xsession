#!/bin/bash

xrdb -merge .Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

xsetroot -solid black

gnome-screensaver &

nm-applet --sm-disable &

gnome-power-manager &

xmodmap ~/.Xmodmap

~robbie/.fehbg

exec xmonad
