# I ran all shells as login shells.  I do not recommed this approach.

PATH="/Users/robbie/.cabal/bin:${PATH}"
PATH="/Applications/sage:${PATH}"
PATH="/usr/local/git/bin:${PATH}"
export PATH

CLICOLOR=1
export CLICOLOR

. ~/.bashrc

export ATSHOME="/Users/robbie/ats-lang-anairiats-0.2.3"
export ATSHOMERELOC="ATS-0.2.3"
export PATH="/Users/robbie/ats-lang-anairiats-0.2.3/bin:${PATH}"

#export DISPLAY=":0"
# I was having some trouble with the xQuartz interaction in Terminal vs. xterm vs. Terminal.app

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

