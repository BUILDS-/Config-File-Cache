# sup alias
#alias sup=sup-mail

# emacsclient alias
alias emacs="emacsclient -t"

# git aliases
alias gpull="git pull --rebase"
alias gpush="git push"
alias gcommit="git commit -a"
alias gadd="git add"

# rsync
alias rsync="rsync -vrl --progress --partial"

# color aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
