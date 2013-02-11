#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: git pulls the latest version for all subdirectories"
    echo "Usage: ./`basename $0`"
    exit 0
fi
for i in *; do
    if [ -d $i ]; then
        echo $i
        cd $i
        git pull
        cd ..
    fi
done