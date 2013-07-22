#!/bin/bash

function alarme
{
  [ "$1" ] || { echo 'uso: alarme [hh:mm:ss]'; return;}
    while(true)
    do
      if( date | grep $1 >/dev/null)
      then
       mplayer -shuffle $HOME/.alarme/* &> /dev/null
	break
      else
	sleep 20
      fi
    done
}

alarme $* &
