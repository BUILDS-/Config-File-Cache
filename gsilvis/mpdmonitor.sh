#!/bin/bash

# "##" escaped by mpc to "#"

# NOTE. This does *not* work in mpc version 0.19, as --idle was not yet
# implemented. Or rather, it'll work, but it'll also eat your processor.
# It works 0.21~git. To find your version, do something like
# "strings /usr/bin/mpc | grep version" Thanks to robbie for finding this bug.

mpc current -f "[[<fc=##06989A>%composer%</fc> - ]|[<fc=##06989A>%artist%</fc> - ]]<fc=##C4A000>%title%</fc> - <fc=##CC0000>%album%</fc>"

while [ 1 ]
do
  mpc current --wait -f "[[<fc=##06989A>%composer%</fc> - ]|[<fc=##06989A>%artist%</fc> - ]]<fc=##C4A000>%title%</fc> - <fc=##CC0000>%album%</fc>"
done
