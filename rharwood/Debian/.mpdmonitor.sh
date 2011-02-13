#!/bin/bash

# "##" escaped by mpc to "#"

while [ 1 ]
do
  nice -n 19 mpc current --wait -f "<fc=##06989A>%artist%</fc> - <fc=##C4A000>\"%title%\"</fc> <fc=##CC0000>#[%album%#]</fc>";
  mpc idle;
done
