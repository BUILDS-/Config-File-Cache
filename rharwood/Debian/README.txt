.: This folder contains my configurations for jeska (Apple Macbook 3,1) and kamahl (currently an Apple Mac Pro 4,1), both running Debian with xmonad and emacs as window managers.  I use mpd (ncmpcpp as frontend) bound to a socket to play music, xmonad and emacs for window management, wicd for networking, and various xfce components to round out the package.  I like building on xfce components because they don't tend to drag the entire rest of the desktop along with them, unlike those of certain other environments (gnome).
.bash_aliases: handy aliases for various things
.bash_profile: invoked on login.  There are a couple things (wireless kernel module that I have to manually load, for example) that need to be moved out of here and into actual startup scripts.
.bashrc: fairly standard fare.  Sets a magic variable to make mpd socketing work, and also calls .bash_aliases as suggested.
.cabal: xmonad packaging
.canto: the canto news reader (rss, etc.).  Won't track you but it might take all your processing power in an inexplicable pythony networking mess.
.emacs: hi I like emacs
|etc|pommed.conf: sits at /etc/pommed.conf where it acts as the configuration file for the Apple laptop key handler, pommed.
.getmail: currently deactivated, but was working as a backend to sup
.mpdconf: for mpd.  Magic socket code here.
.mpdmonitor.sh: script for my xmobar to display currently playing track.  Note that there is currently a bug in mpc that prevents wait from working correctly, so this is necessary.  The scheduling stuff isn't really necessary, but it helped with testing.
.mpdscribble: client for mpd that scrobbles to last.fm
.ncmpcpp: ncurses-based mpd client (custom compiled with tagging support)
README.txt: not actual config
.sup: files for the sup email client
|usr|share|X11|xorg.conf.d|50-synaptics.conf: sits at /usr/share/X11/xorg.conf.d/50-synaptics.conf and is my configuration file for my synaptics touchpad (which has a single button, as do all the 3,1s)
.xmobarrc: configuration for xmobar.  Calls my .mpdmonitor.sh script, which is not owned properly and thus during recompilations extra copies of said script may accumulate.
.Xmodmap: key remapping.  XMonad reads off mod4 for me, which is bound to left option.  Left control is control, left option is mod4, left command is Meta, right command is Meta, left option is control (on jeska there is no right control to bind).
.xmonad: various things to make xmonad go
.xsession: things I need for an x session.

./.cabal:
config

./.canto:
conf.py

./.getmail:
bu
earthlink
gmail
hotmail
script.sh

./.mpdscribble:
lastfm.journal
mpdscribble.conf

./.ncmpcpp:
config

./.sup:
config.yaml
sources.yaml

./.xmonad:
xmonad.hs
