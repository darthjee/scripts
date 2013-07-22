#!/bin/bash

function gerando
{
  for FILE in $(ls *.$1);
  do
#echo  "<img src="$FILE"><br>" >> index.html
    echo  "<img src="$FILE" width=80%><br>" >> index.html
  done
}

rm index.html -f
echo "<html><body>" > index.html
gerando JPG
gerando jpg
gerando jpeg
gerando gif
echo "</body></html>" >> index.html
