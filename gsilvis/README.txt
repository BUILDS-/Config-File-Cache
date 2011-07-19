So! I have multiple computers, and they don't all have the same config files,
oddly enough. There is one folder for each computer, and a folder for shared
config files.

My machines are:
 Ellis: My trustworth piece-of-crap headless-desktop/pretend-server. Gentoo!
 Francisco: My MSI Wind. Debian Wheezy (testing branch)
 Hugh: My actual desktop. Now running Gentoo.
 all: uh, this isn't a computer.

Secondly, I have the folder 'usrlocal,' which represents what I've installed
manually on my machines. In this case, all that's there is a short perl
script called 'mutt-notmuch.' See Francisco for more on that.

Thirdly, I have here the file custom.desktop . In Ubuntu 10.4, they removed
the ability to use an .xsession file when starting X from gdm. If you put this
file in the proper location, likele /usr/share/xsessions, you will regain that
menu option.

Finally, I have a superposition of all the local portage overlays I have on my
machines. The things in there are: a (crappy) ebuild I wrote for the Gutenbach
client. The source is currently hosted on a box I have an account on in
California, because there isn't such a link anywhere else, as far as I know.
Second, a set of things for running an up-to-date install of sup.  These are
copied wholesale from the overlay 'xarthisius,' which is in Layman.  However,
xarthisius is entirely lacking any x86 keywords, so I added them myself. I may
pester him at some point to add those keywords: this setup runs fine. Third, a
slightly modified ebuild for dev-texlive/texlive-latex. Because of bug
#369883, as of a week or two ago, texlive fails to build. This modification,
as taken from a very helpful comment
(http://bugs.gentoo.org/show_bug.cgi?id=369883#c15) fixes that problem.
Fourth, I have a very simple ebuild for the ATS/Anairiats compiler. It's only
a binary package, because I don't want to figure out how to write an ebuild
for a compiler. But if you're a nut like me who must do EVERYTHING through the
system's package manager, you may find this nice.


Enjoy
- George Silvis, III
