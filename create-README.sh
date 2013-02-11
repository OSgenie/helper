#!/bin/bash
if [ "$1" == "-h" ]; then
    echo "Description: Generates a README.md from all the help methods in a given repository"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
gitdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
title=$(basename $gitdir)
scripts=()
scripts=(${scripts[@]} $(ls .))

function write_title ()
{
echo $title | tee README.md
echo "================" | tee -a README.md
}

function write_file_descriptions ()
{
for ((i=0;i<${#scripts[@]};i++)); do
    echo "" | tee -a README.md
    echo "##" ${scripts[$i]} | tee -a README.md
        get_help=$(./${scripts[$i]} -h)
    if [ ! -z "$(./${scripts[$i]} -h)" ]; then
        ./${scripts[$i]} -h | tee -a README.md
    else
        read -p "Enter a description for ${scripts[$i]}: " description
        echo "Description: $description" | tee -a README.md
        read -p "Enter usage scenerio for ${scripts[$i]}: " usage
        echo "Usage: $usage" | tee -a README.md
    fi
done
}

echo "This Script will create a new README.md file overwriting the existing one."
read -p "Do you wish to proceed? (yes/no) " proceed
if [ "$proceed" == "yes" ]; then
    write_title
    write_file_descriptions
else
    echo "Good Bye"
fi