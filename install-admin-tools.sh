#!/bin/bash
# kirtley wienbroer
# kirtley@osgenie.com

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

function copy_ssh_id_to_servers ()
{
echo "Assuming that the logged in user is the same name as the server user"
echo "Type yes when prompted"
servers=(
193.168.11.7
192.168.11.8
192.168.11.10
)
for server in $servers; do
    ssh-copy-id $server
done
}

install_packages
check_for_ssh_keys
copy_ssh_id_to_servers