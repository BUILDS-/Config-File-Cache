#!/bin/sh

emacs --daemon >> .xsession-errors &

xrdb -merge .Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

xsetroot -solid black

gnome-screensaver &

nm-applet &

xfce4-power-manager &

~robbie/.fehbg

setxkbmap -option compose:caps

xmodmap ~/.Xmodmap

xset r rate 300 75

exec xmonad

