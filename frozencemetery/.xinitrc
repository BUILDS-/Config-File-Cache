#!/bin/bash
~/.bash_profile &
gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info" &
iceweasel &
pidgin &
(xrdb -merge .Xresources ; urxvtd -q -f -o) &
xsetroot -solid black &
xscreensaver -no-splash &
# xcompmgr &
/home/frozencemetery/.fehbg &
(setxkbmap -option compose:caps ; xmodmap ~/.Xmodmap ; xset r rate 200 30) &
unclutter -not QEMU &
xsetroot -cursor_name X_cursor &
rm -f ~/.ssh/master* &
# thunar --daemon &
exec dbus-launch ck-launch-session xmonad
