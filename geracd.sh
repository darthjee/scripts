#!/bin/bash

if [ "$3" ]; then
  if [ -a "$2" ]; then
    echo "iso ja existe"
  else
    if [ $4 ]; then
      CMD=$4
    else
      CMD=echo
    fi
    cd "$1"; opensfv -r -d ./ > hash.sfv; cd ..
    mkisofs -R -J -l -V "$3" -o "$2" "$1" && $CMD -rf $1
  fi
else
  echo "$0" DIR ISO VOLUME RM/ECHO
fi
