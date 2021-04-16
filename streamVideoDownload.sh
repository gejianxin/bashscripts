#!/bin/bash
OLDIFS=$IFS
IFS=$'\n'
ADDR=`cat $1`
for LINE in $ADDR
do
#echo $LINE | awk -F'\t' '{print $2}'
ffmpeg -i `echo $LINE | cut -d$'\t' -f1` -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 `echo $LINE | cut -d$'\t' -f2`.mp4
done
IFS=$OLDIFS
