#!/bin/bash

dbus-launch
export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/-0`
gnome-keyring-daemon --start
nm-applet &
trayer --edge bottom --align right --expand true --widthtype request --heighttype pixel --height 14 --alpha 0 &

iceweasel &
~/.bash_profile
gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info" &
# pidgin &
xrdb -merge .Xresources &
xsetroot -solid black &
xscreensaver -no-splash &
# xcompmgr &
/home/frozencemetery/.fehbg &
(setxkbmap -option compose:caps ; xmodmap ~/.Xmodmap ; xset r rate 200 30) &
unclutter -not QEMU &
xsetroot -cursor_name X_cursor &
rm -f ~/.ssh/master* &
# thunar --daemon &

exec ck-launch-session xmonad
