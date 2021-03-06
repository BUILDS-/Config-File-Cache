# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000000
SAVEHIST=10000000000
setopt appendhistory autocd beep hist_ignore_space notify
unsetopt extendedglob nomatch
bindkey -e

zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit colors promptinit
compinit
colors
promptinit

# on single tab, fill as much as possible and show completion
unsetopt LIST_AMBIGUOUS

# when completing, include files that start with a .
setopt GLOB_DOTS

# disable this prompt as best I can
LISTMAX=9999

function am_git {
    git log HEAD.. >/dev/null 2>/dev/null
}

# this crap is for automatically timing commands
zmodload zsh/datetime
cmd_timestamp='invalid'
cmd_exec_time=0

preexec() {
    cmd_timestamp=$EPOCHSECONDS
}

precmd() {
    # 'invalid' prevents erroneous updates
    if [[ $cmd_timestamp != 'invalid' ]]; then
        integer elapsed
        (( elapsed = EPOCHSECONDS - $cmd_timestamp ))
        cmd_exec_time=$elapsed

        cmd_timestamp='invalid'
    fi

    # trigger an alert
    printf "\a"
}

# welcome to my nightmare
setopt PROMPT_SUBST
PROMPT=""
PROMPT+="%(?..%{$fg_bold[red]%}{%?}%{$reset_color%} )" # exit status
PROMPT+="%(1j.%{$fg_bold[cyan]%}[%j]%{$reset_color%} .)" # jobs
PROMPT+="(\${cmd_exec_time}) " # timing commands
PROMPT+="%{$fg_bold[green]%}%n@%m%{$reset_color%}:" # user@host:
PROMPT+="%{$fg_bold[blue]%}%~%{$reset_color%}" # path
#PROMPT+="\$(am_git && echo ' <'\$(git status | head -n1 | awk '{print \$NF}')'>')"
PROMPT+="%(!.#.%\\\\$) " # this is just for the dollar sign

function y {
    youtube-dl -f 'bestvideo[height<=1080][width<=1920]+bestaudio/best' "$@"
}
function ya {
    youtube-dl -x -f 'vorbis/best[asr=44100]/best' "$@"
}

function u {
    urxvtcd
    fg 2>/dev/null || true
}

alias grep="grep --color=auto"
alias igrep="grep -i --color=auto"
alias egrep="grep -E --color=auto"
alias ls="ls -hN --color=auto"
alias ll="ls -alFhN"
alias la="ls -AhN"
alias l="ls -CFhN"
alias l1="ls -1N"
alias lr="ls -R"
alias al="sl -a"
alias p=proxychains
alias t=torify
alias e="emacsclient -nw -a emacs" # because it hates you that's why
alias a="aptitude"
alias i="firefox-esr --new-window"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv --one-file-system"
alias mkdir="mkdir -v"
alias cd="cd --"
alias gf="echo 'Your gf is Kit and that is wonderful.  Let me hit fg for you:' ; sleep 1; fg"
alias into="ssh"
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias man="man --nj"

alias vpn="tmux new-session sudo openvpn --config /etc/openvpn/client/rdu2"
alias weechat="mosh -a ihatethat"
alias w="mosh -a ihatethat"

alias n="emacsclient -nw -e '(notmuch)'"

function c {
    chromium --enable-remote-extensions $@ &
    disown
}

function g {
    if (am_git); then
        git grep -I "$@"
    else
        grep -r --binary-files=without-match "$@"
    fi
}
function f {
    if (am_git); then
        git grep -l '' -- \*"${@}"\*
    else
        find . -name \*"${@}"\*
    fi
}
function ef {
    e $(f $@)
}

setopt COMPLETE_ALIASES

# hook directory change to list files
function chpwd {
    la
}

# pretend to be a real shell
autoload select-word-style
select-word-style bash

# the hell is wrong with zsh developers?
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
#unalias run-help
alias help=run-help

eval "$(thefuck --alias)"

# must be last otherwise problems
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="emacsclient -nw -a emacs"

export PATH="/usr/lib/ccache:/usr/local/sbin:/usr/sbin:/sbin:${PATH}"
export MPD_HOST=/run/mpd/socket

export DEBEMAIL="Robbie Harwood (frozencemetery) <rharwood@club.cc.cmu.edu>"

export GTK_OVERLAY_SCROLLING=0

export QT_STYLE_OVERRIDE=gtk2
