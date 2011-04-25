#!/bin/sh

emacs --daemon >> .xsession-errors &

xrdb -merge .Xresources

xsetroot -solid black

gnome-screensaver &

nm-applet &

xfce4-power-manager &

~robbie/.fehbg

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --transparent true --tint 0x000000 --height 12 &

setxkbmap -option compose:caps

xmodmap ~/.Xmodmap

#xset r rate 300 75

unclutter &

exec xmonad

