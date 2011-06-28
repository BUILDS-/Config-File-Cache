Welcome to Francisco. I finally reinstalled this machine. There is no longer a
Windows partition, nor an Ubuntu one, nor the ridiculous setup I had with two
separate storage partitions. Added this time is the fact that my root
partition is encrypted, using LVM/dm-crypt/LUKS. Doing this with the installer
is not too difficult, if you just have it do it all for you. It boots a little
more slowly, though.

Also different, I have decided to only install things with aptitude, this time.
So, no crazy up-to-date xmobar or xmonad or anything for me. Things appear to
work, though.

What I have here:


.emacs: Uh, what do you THINK this is?

.xinitrc is run when my X session starts. Note the first part especially,
which deals with a nasty nm-applet bug where it fails to save any wireless
keys.

.xmobarrc is for xmobar

xmonad.hs belongs at ~/.xmonad/xmonad.hs


.bashrc, .bash_aliases. Nothing complicated here.
