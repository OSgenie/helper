#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Performs the steps to initialize a git repository and initial commit"
    echo ""
    echo "Usage: ./`basename $0` <directory to become a git repository>"
    exit 0
fi
gituser=OSgenie
if [ -z "$1" ]; then
    echo "enter directory to be pushed to git"
else
    cd $1
    touch README.md
    git init
    git add *
    git commit -m "first commit"
    git remote add origin git@github.com:$gituser/$1.git
    git push -u origin master
fi