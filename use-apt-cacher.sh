#!/bin/bash
# Kirtley Wienbroer
# kirtley@osgenie.com
if [ $1 != "" ]; then
    apt_cacher_server=$1
else
    read -p "What is the IP or FQDN for the Apt-cacher server? " apt_cacher_server
    echo ""
fi
echo 'Acquire::http { Proxy "http://'$apt_cacher_server':3142"; };' | sudo tee /etc/apt/apt.conf
sudo apt-get update