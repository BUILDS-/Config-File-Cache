alias grep="grep --color=auto"
alias igrep="grep -i --color=auto"
alias egrep="grep -E --color=auto"

function am_git {
  git log HEAD.. >/dev/null 2>/dev/null
}

function g {
  if [ -d .git ]; then
    git grep -iI $@
  else
    grep -ir --binary-files=without-match $@
  fi
}
function f {
  if [ -d .git ]; then
    git grep --full-name -l '' -- \*${@}\*
  else
    find . -name \*${@}\*
  fi
}

alias ls="ls -h --color=auto"
alias ll="ls -alFh"
alias la="ls -Ah"
alias l="ls -CFh"
alias l1="ls -1"

alias al="sl -a"

function cd {
  pushd "$@" && ls
}

alias p=proxychains
alias t=torify

alias m="mplayer -softvol -softvol-max 1000 -nolirc -cache-min 0.01"
alias mnv="mplayer -softvol -softvol-max 1000 -nolirc -novideo -cache-min 0.01"
alias mfb="mplayer -softvol -softvol-max 1000 -nolirc -cache-min 0.01 -xy 1920 -zoom -fs -vo fbdev2"
alias mbw="mplayer -softvol -softvol-max 1000 -nolirc -vf format=y8,scale"
alias mnc="mplayer -softvol -softvol-max 1000 -nolirc -nocache"
alias mncv="mplayer -softvol -softvol-max 1000 -nolirc -nocache -novideo"

y="\$([ -f proxychains.conf ] && echo proxychains) youtube-dl --prefer-free-formats -t" # don't think about it too hard
alias y="$y"
function q {
  youtube-dl --prefer-free-formats -o - "$@" | m -
}

alias e="emacsclient -nw" # because it hates you that's why
alias a="aptitude"
alias u="urxvtcd"
alias i="iceweasel --new-window"

alias RSYNC="rsync -avz -e ssh"

# Use REDHAT.COM kr5bcc by default.
export KRB5CCNAME=/tmp/krb5cc_rht
alias krb-rht='KRB5CCNAME=/tmp/krb5cc_rht'
alias krb-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc'
alias krb-admin='KRB5CCNAME=/tmp/krb5cc_admin'
alias krb-root='KRB5CCNAME=/tmp/krb5cc_root'
alias krb-cmu='KRB5CCNAME=/tmp/krb5cc_cmu'
alias kinit-rht='KRB5CCNAME=/tmp/krb5cc_rht kinit rharwood@REDHAT.COM'
alias kinit-cmu='KRB5CCNAME=/tmp/krb5cc_cmu kinit rharwood@ANDREW.CMU.EDU'
alias kinit-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc kinit rharwood@CLUB.CC.CMU.EDU'
alias kinit-root='KRB5CCNAME=/tmp/krb5cc_root kinit rharwood/root@CLUB.CC.CMU.EDU'
alias kinit-admin='KRB5CCNAME=/tmp/krb5cc_admin kinit rharwood/admin@CLUB.CC.CMU.EDU'

alias aklog-cmu='KRB5CCNAME=/tmp/krb5cc_cmu aklog andrew.cmu.edu'
alias aklog-cmucc='KRB5CCNAME=/tmp/krb5cc_cmucc aklog club.cc.cmu.edu'
alias aklog-cs='KRB5CCNAME=/tmp/krb5cc_cmu aklog -c cs.cmu.edu -k CS.CMU.EDU'

alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv --one-file-system"
alias mkdir="mkdir -v"
alias cd="cd --"

alias gf="echo 'Your gf is Kit and that is wonderful.  Let me hit fg for you:' ; sleep 1; fg"
alias into="ssh"
