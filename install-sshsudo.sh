#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Installs the sshsudo command allowing for a command to be performed on multiple servers with only one password prompting"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
wget https://sshsudo.googlecode.com/files/sshsudo
sudo install sshsudo /usr/local/bin/sshsudo