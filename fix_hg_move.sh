#!/bin/bash

function movePair(){
  if [ -a $1 ]; then
    V1=$1
    V2=$2
  else
    V1=$2
    V2=$1
  fi
  DIR=${V2%/*}
  if ! [ -a $DIR ]; then
    mkdir -p $DIR
  fi
  mv $V1 $V2
  hg mv $V2 $V1
}

function moveAll(){
  TYPE=$1
  DELETED=$(hg st -dn | grep $TYPE)
  NEW=$(hg st -un | grep $TYPE)

  for F1 in $DELETED; do
    FNAME=${F1##*/}
    for F2 in $NEW; do
      if [ $FNAME = ${F2##*/} ]; then
        movePair $F1 $F2
      fi
    done
  done
}


if [ $2 ]; then
  movePair $1 $2
elif [ ! $1 ]; then
  for TYPE in .java .php .css .js; do
    moveAll $TYPE
  done
else
  echo "uso: $0 arquivo1 arquivo2"
fi
