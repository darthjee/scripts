#!/bin/bash

aux=""

function replace
{
  saida=$1;
  shift 1;
  while [ $1 ]; do
    saida="$saida?$1";
  shift 1
  done
  aux=$saida
}

function replace3
{
  aux='"'$*'"'
  echo $aux;
}

if [ "$2" ]; then
  lista=""
  while [ "$2" ]; do
    replace $1
    lista="$lista $aux"
    shift 1
  done
  if [ -a "$1" ]; then
    echo "Arquivo $1 ja existe";
  else
    echo gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$1 -dBATCH $lista
    gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$1 -dBATCH $lista
  fi
else
  { echo "Modo de uso: $0 lista saida" ; return ;}
fi
