#!/bin/bash

function plotando
{
  for FILE in $(ls *.gnu);
  do
    gnuplot $FILE
  done
}

plotando
