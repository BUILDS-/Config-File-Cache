#!/bin/sh

emacs --daemon >> .xsession-errors &

xrdb -merge .Xresources

xsetroot -solid black

xscreensaver -no-splash &

nm-applet &

xfce4-power-manager &

/home/frozencemetery/.fehbg

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --tint 0x000000 --height 12 --transparent true --alpha 0 &

setxkbmap -option compose:caps

xmodmap ~/.Xmodmap

#xset r rate 300 75

unclutter &

exec ck-launch-session xmonad

