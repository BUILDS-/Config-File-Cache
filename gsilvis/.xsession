#!/bin/sh

eval `cat ~/.fehbg` &
xsetroot -cursor_name left_ptr &

nm-applet &
#wicd-client & WHY NO WORK
#thunar --daemon &
gnome-power-manager &
gnome-screensaver &
dropbox start &
skype &

#mpd &
#mpdscribble --conf ~/.mpdscribble/mpdscribble.conf &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 7 --transparent true --tint 0x000000 --height 12 &

gnome-terminal &

exec xmonad
