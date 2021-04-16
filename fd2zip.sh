#!/bin/bash

# compress all current directory subfolders into zip file
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
list=`pwd | ls -h`

for dir in ${list}
do
    if [ -d "${dir}" ]; then
        cd ${dir}
        echo ${PWD}
        zip "../${dir}.zip" *
        cd ../
        rm -rf ${dir}
        echo ${PWD}
    fi
done
IFS=$SAVEIFS