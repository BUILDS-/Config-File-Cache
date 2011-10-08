#!/bin/sh

# "##" escaped by mpc to "#"

while [ 1 ]
do
  nice -n 19 mpc --host /home/frozencemetery/.mpd/socket current --wait -f "%artist% - \"%title%\" #[%album%#]";
  mpc --host /home/frozencemetery/.mpd/socket idle;
  if [ -z "$(mpc --host /home/frozencemetery/.mpd/socket playlist)" ]; then
      echo "queueing";
      cd /home/frozencemetery/Music; find "$(find -maxdepth 1 -mindepth 1 -type d  | shuf | head -n1)" -maxdepth 1 -mindepth 1 -type d | cut -b 1-2 --complement | shuf | head -n1 | mpc --host /home/frozencemetery/.mpd/socket add;
      ncmpcpp play;
  fi;
done
