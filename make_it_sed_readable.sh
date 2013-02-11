#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Rewrites a string adding escape characters in front of characters that need escaping to be used with sed"
    echo ""
    echo "Usage: ./`basename $0` 'string to be rewritten'"
    exit 0
fi
function make_it_sed_readable ()
{
string=$1
i=0
while [ $i -lt ${#string} ]; 
do
    array[$i]=${string:$i:1}
    i=$((i+1))
done
newstring=""
i=0
while [ $i -lt ${#string} ]; 
do
    if [[ ${array[$i]} == '"' || ${array[$i]} == "/" ]]; then
        newstring+=\\${array[$i]}
    else
        newstring+=${array[$i]}
    fi
    i=$((i+1))
done
string=$newstring
echo $string
}

input=$1
sed_readable=$(make_it_sed_readable $input)
echo $sed_readable 