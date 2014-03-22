#/bin/bash

LISTA=lista.m3u

if [ "$1" ]; then
  echo "" > $LISTA
  while [ "$1" ]; do
    find "$1" -type f >> $LISTA;
    shift 1
  done
fi

if [ -f $LISTA ]; then
  mplayer -shuffle -fs -zoom -loop 0 -playlist lista.m3u
else
  echo "Lista $LISTA nao encontrada"
fi
