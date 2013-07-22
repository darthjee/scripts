#!/bin/bash
function timed
{
  while(true)
  do
    if( ps -U darthjee | grep wget >/dev/null)
    then
      sleep 2
    else
      $* &> /dev/null &
      break
    fi
  done
}

cd /mnt/hd/hdb/videos/animes/onegai

#timed wget http://www.durox.com.br/teacher/teacher01.rm
#timed wget http://www.durox.com.br/teacher/teacher02.rm
#timed wget http://www.durox.com.br/teacher/teacher03.rm
#timed wget http://www.durox.com.br/teacher/teacher04.rm
#timed wget http://www.durox.com.br/teacher/teacher05.rm
#timed wget http://www.durox.com.br/teacher/teacher06.rm
#timed wget http://www.durox.com.br/teacher/teacher07.rm
#timed wget http://www.durox.com.br/teacher/teacher08.rm
#timed wget http://www.durox.com.br/teacher/teacher09.rm
#timed wget http://www.durox.com.br/teacher/teacher10.rm
#timed wget http://www.durox.com.br/teacher/teacher11.rm
#timed wget http://www.durox.com.br/teacher/teacher12.rm
