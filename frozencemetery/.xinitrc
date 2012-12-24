#!/bin/bash
~/.bash_profile &
gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
iceweasel &
torify pidgin &
xrdb -merge .Xresources
xsetroot -solid black &
xscreensaver -no-splash &
# xcompmgr &
/home/frozencemetery/.fehbg &
setxkbmap -option compose:caps && xmodmap ~/.Xmodmap
unclutter -not QEMU &
xsetroot -cursor_name X_cursor &
rm -f ~/.ssh/master* &
urxvtd -q -f -o &
# thunar --daemon &
xfce4-power-manager &
exec dbus-launch ck-launch-session xmonad
