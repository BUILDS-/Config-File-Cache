#!/bin/sh

# "##" escaped by mpc to "#"

while true; do
  nice -n 19 mpc --host /home/frozencemetery/.mpd/socket current --wait -f "<fc=##71BEBE>%artist%</fc> - \"<fc=##FFF796>%title%</fc>\" #[<fc=##CF6171>%album%</fc>#]"
  mpc --host /home/frozencemetery/.mpd/socket idle
  if [ -z "$(mpc --host /home/frozencemetery/.mpd/socket playlist)" ]; then
      echo "queueing"
      cd /home/frozencemetery/Music; find "$(find -maxdepth 1 -mindepth 1 -type d  | shuf | head -n1)" -maxdepth 1 -mindepth 1 -type d | cut -b 1-2 --complement | shuf | head -n1 | mpc --host /home/frozencemetery/.mpd/socket add
      mpc --host /home/frozencemetery/.mpd/socket play
  fi
done
