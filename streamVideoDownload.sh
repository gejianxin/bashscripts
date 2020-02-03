#!/bin/bash

# This script is to download m3u8 format stream video
# How to run?
# ./streamVideoDownload.sh [linkfile]
# Each line in link file should be like "link [TAB] output"
# link is the url of the m3u8 file
# output is the file name of the download file, no extention needed.
OLDIFS=$IFS
IFS=$'\n'
ADDR=`cat $1`
for LINE in $ADDR
do
#echo $LINE | awk -F'\t' '{print $2}'
ffmpeg -i `echo $LINE | cut -d$'\t' -f1` -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 `echo $LINE | cut -d$'\t' -f2`.mp4
done
IFS=$OLDIFS
