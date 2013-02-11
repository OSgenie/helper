#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Modifies bash history to increase size, ignoredups, and timestamp entries"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
sed -i 's/HISTSIZE=1000/HISTSIZE=10000/g' ~/.bashrc
sed -i 's/HISTFILESIZE=2000/HISTFILESIZE=20000/g' ~/.bashrc
sed -i 's/HISTCONTROL=ignoreboth/HISTCONTROL=ignoreboth/nHISTTIMEFORMAT="%h %d %H:%M:%S> "/g' ~/.bashrc