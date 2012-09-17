#!/bin/bash
~/.bash_profile &
gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
echo "" > ~/.xsession-errors &
iceweasel &
pidgin &
xfce4-power-manager &
xrdb -merge .Xresources &
xsetroot -solid black &
xscreensaver -no-splash &
/home/frozencemetery/.fehbg &
trayer --edge top --align right --expand true --width 5 --tint 0x000000 --heighttype pixel --height 8 --transparent true --alpha 0 &
setxkbmap -option compose:caps && xmodmap ~/.Xmodmap
#xset r rate 300 75
unclutter &
xsetroot -cursor_name X_cursor &
rm -f ~/.ssh/master* &
#gnome-keyring-daemon &
#dbus-launch
#export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/-0`
#gnome-keyring-daemon --start
#nm-applet &
wicd-gtk &
#thunar --daemon &
exec ck-launch-session xmonad
