#!/bin/sh

# "##" escaped by mpc to "#"

while [ 1 ]
do
  nice -n 19 mpc --host /home/frozencemetery/.mpd/socket current --wait -f "%artist% - \"%title%\" #[%album%#]";
  mpc --host /home/frozencemetery/.mpd/socket idle;
  if [ -z "$(mpc --host /home/frozencemetery/.mpd/socket playlist)" ]; then
      echo "queueing";
      mpc -h /home/frozencemetery/.mpd/socket add "$(cd /home/frozencemetery/Music; find -follow -mindepth 1 -type d | shuf | head -n1 | cut -b3- ; cd ->/dev/null)";
      ncmpcpp play;
  fi;
done
