#!/bin/bash
# kirtley wienbroer
# kirtley@osgenie.com
if [ $1 == "-h" ]; then
    echo "Description: Installs the basic programs for administering servers and virtual hosts and creates a new ssh key for the console if one doesn't exist. You will still need to ssh-copy-id the key to any servers you want to manage"
    echo ""
    echo "Usage: ./`basename $0`"
    exit 0
fi
function install_packages()
{
sudo apt-get install -y build-essential make
sudo apt-get install -y virt-manager bluefish vim
}

function check_for_ssh_keys ()
{
array=$( ls ~/.ssh/ )
i=1
for option in $array
do
    extension=${option##*.}
    if [ $extension == "pub" ]; then
        num=$((i++))
        list[$num]=$option
        echo "    $num) ${list[$num]}"
        key_exists=true
    fi
done
if [ $key_exists == true ]; then
    echo ""
    read -p "Enter the number for your choice: " choice
    distro=${list[$choice]}
else
    create_ssh_keys
fi
}

function create_ssh_keys ()
{
echo "Creating key for $USER@$(hostname -s)"
ssh-keygen -t rsa -C "$USER@$(hostname -s)"
}

install_packages
check_for_ssh_keys