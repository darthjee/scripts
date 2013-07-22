#!/bin/bash

function anti
{
  for FILE in $(cat ~darthjee/arquivos/lista-virus.dat);
  do
    mv /mnt/hd/windows/windows/system32/$FILE ~darthjee/temp
    mv /mnt/hd/windows/windows/system32/dllcache/$FILE ~darthjee/temp/dllcache
  done
}

anti
