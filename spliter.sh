#!/bin/bash

function get_format()
{
  SIZE=$(get_size "$*")
  NDISK=$[($SIZE+$DISKSIZE-1)/$DISKSIZE]
  POT=1
  MAX=9
  while [ $MAX -lt $NDISK ]; do
    POT=$[$POT+1]
    MAX=$[$MAX*10+9]
  done
  echo "%0${POT}d"
}

function get_size(){
  echo $(du -sb "$*" | sed -e "s/\\([0-9]*\\).*/\\1/g")
}

function splitter(){
  PRE=$1
  FORMAT=$2
  shift 2
  DIR=$*
  
  find "$DIR" -type f -print0 | while read -d $'\0' FILE; do
    COUNT=1
    
    DEST=$(printf "$PRE$FORMAT" $COUNT)
    echo $FILE
    echo $DISKSIZE
    echo $[$(get_size "$DEST")+$(get_size "$FILE")]
    while [ -d "$DEST" ] && [ $DISKSIZE -le $[$(get_size "$DEST")+$(get_size "$FILE")] ]; do
      COUNT=$[$COUNT+1]
      DEST=$(printf "$PRE$FORMAT" $COUNT)
    done
    
    if ! [ -d "$DEST" ]; then
      mkdir "$DEST"
    fi
    
    mv "$FILE" "$DEST"
  done
}

MB=$[1024*1024]
DISKSIZE=$[4400*$MB]

if [ "$2" ]; then
  PRE=$1
  DIR=$2

  FORMAT=$(get_format "$DIR")

  splitter $PRE $FORMAT $DIR
else
  echo $0 "prefixo lista"
fi
