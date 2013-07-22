#!/bin/bash

function convertendo
{
  for FILE in $(ls *.JPG);
  do
    convert -size 648x486 ../JediCon*/$FILE $FILE
  done
}

convertendo
