#!/bin/bash
if [ "$1" == "-h" ]; then
    echo "Description: Add license files to all subfolders that are git repositories and commit"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
for i in *; do
    if [ -d $i ]; then
        if [[ ! -z $(grep OSgenie $i/.git/*) || ! -z $(grep kirtley $i/.git/*) ]]; then
            echo $i
            cd $i
            cp ../LICENSE .
            cp ../gpl.txt .
            git add LICENSE
            git add gpl.txt
            git commit -m "Uploading License"
            git push
            cd ..        
        fi
    fi
done