#!/bin/bash

xrdb -merge .Xresources
nm-applet &
dropbox start &
firefox &
banshee &
skype &
xfce4-power-manager &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 12 &


export XMODIFIERS='@im=SCIM'
export LC_CTYPE=ja_JP.utf8  
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
scim -d

exec xmonad