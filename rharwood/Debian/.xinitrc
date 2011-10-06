#!/bin/bash

~/.bash_profile

xrdb -merge .Xresources

xsetroot -solid black

xscreensaver -no-splash &

nm-applet &

xfce4-power-manager &

/home/frozencemetery/.fehbg

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 5 --tint 0x000000 --height 17 --transparent true --alpha 0 &

setxkbmap -option compose:caps

xmodmap ~/.Xmodmap

#xset r rate 300 75

unclutter &

#if [ -z "`pgrep conky`"]; then bash -c 'conky | while read -r; do xsetroot -name "$REPLY"; done' & fi

#sh -c 'sleep 5; xsetroot -cursor_name X_cursor' &

xsetroot -cursor_name X_cursor

exec ck-launch-session xmonad
