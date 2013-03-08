# setting history length and file size
export HISTSIZE=10000000

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
# export HISTCONTROL=$HISTCONTROL:ignoredups:ignoreboth
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
#fi

# enable bash completion in interactive shells
# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
# fi


export EDITOR="emacsclient -nw -a nano"

export PATH="/usr/local/sbin:/usr/sbin:/sbin:${PATH}"
export MPD_HOST=/var/run/mpd/socket
# export TERM="xterm-color"

export ATSHOME="/usr/local/share/ats-anairiats-0.2.9"
export ATSHOMERELOC="ATS-0.2.9"
