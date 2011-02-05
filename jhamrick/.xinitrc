#!/bin/bash

/usr/bin/gnome-settings-daemon &
/usr/local/bin/xmobar /home/jhamrick/.xmobarrc &
/usr/bin/stalonetray &
/usr/bin/uptrack-manager &
/usr/sbin/NetworkManager &
/usr/bin/nm-applet &
conftool --type string --set /desktop/gnome/background/picture_filename "/home/jhamrick/media/pictures/misc/mountain-scene-at-dusk.jpg" &
gconftool --type string --set /desktop/gnome/background/picture_options "stretched" &
exec xmonad
