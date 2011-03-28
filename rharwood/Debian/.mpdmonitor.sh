#!/bin/sh

# "##" escaped by mpc to "#"

while [ 1 ]
do
  nice -n 19 mpc --host /home/robbie/.mpd/.socket current --wait -f "%artist% - \"%title%\" #[%album%#]";
  mpc --host /home/robbie/.mpd/.socket idle;
done
