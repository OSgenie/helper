#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: displays the git status of all subdirectories"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
for i in *; do
    if [ -d $i ]; then
        echo $i
        cd $i
        git status
        cd ..
    fi
done