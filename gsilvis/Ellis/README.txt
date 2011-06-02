Welcome to Ellis, round two: THIS TIME, WITH GENTOO! MWAHAHAHAHAHAHAHAHA!

There are only really two kinds of config files here, because it's a rather
minimal install. There are the Gentoo administration things, and the
sup/offlinimap/msmtp config.

  Gentoo:
make.conf
packages.accept_keywords
package.use

  Mail:
.sup/config.yaml -- sup!
.sup/sources.yaml -- also for sup
.offlineimaprc -- offlineimap
.msmtprc -- for sending mail with sup

All my email accounts redirect to my GMail account (george.iii.silvis).
Then, I run offlineIMAP on Ellis.
I run sup on Ellis through ssh.
I send mail from Ellis using msmtp.

These config files are edited from my actual use for personal reasons.
Such as not wanting you to read my email.

A note for people wanting to run msmtp on Gentoo: When you get to the
"installing necessary system tools" step, you will install a cron daemon and a
system logger. This will generally pull in a mail transfer agent (MTA), ssmtp
by defauly. HOWEVER, ssmtp BLOCKS msmtp! So, before you install either a cron
daemon or a system logger, install msmtp.
