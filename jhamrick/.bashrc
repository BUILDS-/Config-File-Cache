# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# the athena use of this machine, necessary because jhamrick is a
# local account
export ATHENA_USER=jhamrick

# debian name and email, for debian packaging
export DEBEMAIL="jhamrick@mit.edu"
export DEBFULLNAME="Jessica Hamrick"

# java hack for xmonad
export AWT_TOOLKIT=MToolkit

# the hostname of this machine, used for cont-renew-notify
export HOST="$(hostname)"

# update path to look for sup binaries
export PATH=$HOME/project/bher-read-only:$HOME/project/sup/bin:$HOME/project/pystoch/bin:$PATH

# default editor should be emacsclient
export EDITOR="emacsclient -t"

# give us a nice pretty color prompt based on the hostname
export PS1="\[\e[1;$((31 + $(hostname | cksum | cut -c1-3) % 6))m\]\u@\h\[\e[0m\]:\w\$ "

# where the mail lives (overriding the default of /var/mail)
export MAIL="$HOME/store/mail/"

# update ruby include path to look for sup libraries
export RUBYLIB=$HOME/project/sup/lib

# update python path to look for cogphysics and pystoch and gutenbach
export PYTHONPATH="$HOME/project/cogphysics/code:$PYTHONPATH"
export PYTHONPATH="$HOME/project/gutenbach/server/lib:$PYTHONPATH"
export PYTHONPATH="$HOME/project/pystoch/src:$PYTHONPATH"

# where to look for the pylint config
export PYLINTRC="$HOME/.pylintrc"

# update texinputs to include blackships stuff
export TEXINPUTS=.:$HOME/activities/roleplaying/assassin/blackships/LaTeX/:$HOME/.texinputs:
export TEXMFCNF=$TEXINPUTS

# tell ikarus to look for mit-church
export IKARUS_LIBRARY_PATH=/home/jhamrick/project/mit-church:
#export IKARUS_LIBRARY_PATH=/home/jhamrick/project/bher-read-only:

# blackships environment variable
export blackships=$HOME/activities/roleplaying/assassin/blackships

# set the correct calibration for the touchscreen on pomegranate
# meringue
if [ $(hostname) = "pomegranate-meringue" ]; then
    xinput set-prop 8 273 250, 7900, 450, 7950 2&>1 >/dev/null
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
