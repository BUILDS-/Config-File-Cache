alias grep="grep --color=auto"
alias igrep="grep -i --color=auto"
alias egrep="grep -E --color=auto"
alias ls="ls -h --color=auto"
alias ll="ls -alFh"
alias la="ls -Ah"
alias l="ls -CFh"

alias al="sl -a"

alias p=proxychains
y="youtube-dl -t --prefer-free-formats" # don't think about it too hard
alias y="$y"
alias e="emacsclient -nw" # because it hates you that's why
alias a="aptitude"
alias z="zathura"
alias u="urxvtcd"
alias i="iceweasel"
alias m="mplayer -nolirc -cache-min 0.01"
alias mnv="mplayer -nolirc -novideo -cache-min 0.01"
alias mfb="mplayer -nolirc -cache-min 0.01 -xy 1920 -zoom -fs -vo fbdev2"
alias mbw="mplayer -nolirc -vf format=y8,scale"
alias mnc="mplayer -nolirc -nocache"
alias mncv="mplayer -nolirc -nocache -novideo"

alias RSYNC="rsync -avz -e ssh"

# Use CLUB.CC.CMU.EDU kr5bcc by default.
export KRB5CCNAME=/tmp/krb5cc_cmucc
alias krb-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc'
alias krb-admin='KRB5CCNAME=/tmp/krb5cc_admin'
alias krb-root='KRB5CCNAME=/tmp/krb5cc_root'
alias krb-cmu='KRB5CCNAME=/tmp/krb5cc_cmu'
alias kinit-cmu='KRB5CCNAME=/tmp/krb5cc_cmu kinit rharwood@ANDREW.CMU.EDU'
alias kinit-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc kinit rharwood@CLUB.CC.CMU.EDU'
alias kinit-root='KRB5CCNAME=/tmp/krb5cc_root kinit rharwood/root@CLUB.CC.CMU.EDU'
alias kinit-admin='KRB5CCNAME=/tmp/krb5cc_admin kinit rharwood/admin@CLUB.CC.CMU.EDU'

alias aklog-cmu='KRB5CCNAME=/tmp/krb5cc_cmu aklog andrew.cmu.edu'
alias aklog-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc aklog club.cc.cmu.edu'

alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv --one-file-system"
alias mkdir="mkdir -v"
alias cd="cd --"

alias gf="echo 'Your gf is Kit and that is wonderful.  Let me hit fg for you:' ; sleep 1; fg"
alias into="ssh"
