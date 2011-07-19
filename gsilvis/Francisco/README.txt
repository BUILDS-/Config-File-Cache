Welcome to Francisco. I finally reinstalled this machine. There is no longer a
Windows partition, nor an Ubuntu one, nor the ridiculous setup I had with two
separate storage partitions. Added this time is the fact that my root
partition is encrypted, using LVM/dm-crypt/LUKS. Doing this with the installer
is not too difficult, if you just have it do it all for you. It boots a little
more slowly, though.

Also different, I have decided to only install things with aptitude, this time.
So, no crazy up-to-date xmobar or xmonad or anything for me. Things appear to
work, though. [exception: I installed mutt-notmuch manually, because it's just
that awesome]

I now do all my email on Francisco. I am using mutt with offlineimap and msmtp,
and additionally using notmuch for fast text search of all my email. The
relevant config files are:
.muttrc
.offlineimaprc
.msmtprc
Also in use here is mutt-notmuch, which can be found in the usrlocal directory
one level up. note for those who care! This setup does PGP, with no fiddling
around! I will be writing a short guide for that... later.

Finally, I have an interesting net setup that involves only wpa_supplicant and
ifplugd. To duplicate this setup:
- Install the two things in question.
- dpkg-reconfigure ifplugd, and set it to deal only with eth0.
- put the file here called 'interfaces' in /etc/network/interfaces . (you may
need to modify it for your particular interface names.)
- put the file here called wpa_supplicant.conf in /etc/wpa_supplicant/. .

Then you can use wpa_cli or wpa_gui to configure networks, and that information
will be saved in the wpa_supplicant configuration.


Other stuff I have here:

.emacs: Notably contains stuff for notmuch.el

.xinitrc is run when my X session starts. Note the first part especially,
which deals with a nasty nm-applet bug where it fails to save any wireless
keys.

.xmobarrc is for xmobar

xmonad.hs belongs at ~/.xmonad/xmonad.hs


.bashrc, .bash_aliases. Nothing complicated here.
