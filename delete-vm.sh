#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Unregisters and deletes all files for a vm on a kvm host with a default path"
    echo ""
    echo "Usage: ./`basename $0` (You'll be presented with a list of all vms on the machine to choose from)"
    exit 0
fi
function application_header ()
{
clear
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+ OSgenie delete VM program                        +"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
}

function list_vms ()
{
sudo virsh list --all
read -p "Which VM do you want to delete? " vm2delete
read -p "You have selected $vm2delete: Is this correct (yes/no) " correct
}

function remove_vm ()
{
sudo virsh destroy $vm2delete
sudo virsh undefine $vm2delete
sudo rm -rfv /var/lib/libvirt/images/$vm2delete*
}

application_header
list_vms
if [ "$correct" = "yes" ]; then
    remove_vm
    echo "$vm2delete has been deleted."
else
    echo "$vm2delete was not deleted."
fi