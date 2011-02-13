#!/bin/bash

# "##" escaped by mpc to "#"

mpc current -f "[<fc=##06989A>%composer%</fc> - ]|[<fc=##06989A>%artist%</fc> - ]<fc=##C4A000>%title%</fc> - <fc=##CC0000>%album%</fc>"

while [ 1 ]
do
  mpc current --wait -f "[<fc=##06989A>%composer%</fc> - ]|[<fc=##06989A>%artist%</fc> - ]<fc=##C4A000>%title%</fc> - <fc=##CC0000>%album%</fc>"
done
