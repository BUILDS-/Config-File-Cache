#!/bin/bash

emacs --daemon >> .xsession-errors &

xrdb -merge .Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

xsetroot -solid black

gnome-screensaver &

wicd-client &

xfce4-power-manager &

~robbie/.fehbg

xmodmap ~/.Xmodmap

exec xmonad
