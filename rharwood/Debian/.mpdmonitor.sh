#!/bin/bash

# "##" escaped by mpc to "#"

while [ 1 ]
do
  nice -n 19 mpc current --wait -f "%artist% - \"%title%\" #[%album%#]";
  mpc idle;
done
