alias grep="grep --color=auto"
alias igrep="grep -i --color=auto"
alias ls="ls -h --color=auto"
alias ll="ls -alFh"
alias la="ls -Ah"
alias l="ls -CFh"

alias al="sl -a"

alias e="emacsclient -nw" # because it hates you that's why
alias a="aptitude"
alias m="mplayer -cache-min 0.01"
alias mnv="mplayer -novideo -cache-min 0.01"
alias mfp="mplayer -vo fbdev"
alias mbw="mplayer -vf format=y8,scale"
alias z="zathura"

alias RSYNC="rsync -avz -e ssh"

# Use CLUB.CC.CMU.EDU kr5bcc by default.
export KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cclub

alias krb-cclub='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cclub'
alias krb-cmu='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cmu'
alias kinit-cmu='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cmu kinit rharwood@ANDREW.CMU.EDU'
alias kinit-cclub='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cclub kinit rharwood@CLUB.CC.CMU.EDU'
alias kinit-root='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cclub kinit rharwood/root@CLUB.CC.CMU.EDU'
alias kinit-admin='KRB5CCNAME=/home/frozencemetery/tmp/krb5cc_cclub kinit rharwood/admin@CLUB.CC.CMU.EDU'

alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv --one-file-system"
alias mkdir="mkdir -v"
alias cd="cd --"
alias y="youtube-dl -t --prefer-free-formats --max-quality 45"

# please run the following export command to sync bash and emacs:
# alias | sed -e 's/mv /*mv /g' | sed -e 's/cp /*cp /g' | grep -v emacsclient  | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell-aliases; echo "alias su *su $*" >> ~/.emacs.d/eshell-aliases
# if not greping out emacsclient you will problem have
# if not fixing mv the error is bizarre
