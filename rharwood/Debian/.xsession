#!/bin/bash

xrdb -merge .Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

xsetroot -solid black

xscreensaver -no-splash &

nm-applet --sm-disable &

xfce4-power-manager

bluetooth-applet &

xmodmap ~/.Xmodmap

~robbie/.fehbg

exec xmonad
