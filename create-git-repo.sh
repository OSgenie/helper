#!/bin/bash
git_server=192.168.11.125
git_repo=$1

mkdir $git_repo
cd $git_repo
git init
touch README.md
git add README.md
git commit -m 'first commit'
git remote add origin git@$git_server:$git_repo.git
git push -u origin master