#!/bin/bash
if [ $1 == "-h" ]; then
    echo "Description: Configure wget to use a proxy"
    echo "Usage: ./`basename $0` <FQDN or IP of proxy server>:<port> "
    exit 0
fi
if [ -z $1 ]; then
    wget_proxy=$1
else
    read -p "What is the IP or FQDN for the proxy server? " wget_proxy_server
    read -p "What is the port for the proxy server? (default is 3128) " wget_proxy_port
    echo ""
fi
wget_proxy=$wget_proxy_server:$wget_proxy_port

function configure_wget_proxy ()
{
sudo cp /etc/wgetrc /etc/wgetrc.orig
sudo chmod a-w /etc/wgetrc.orig
sudo sed -i "s/#http_proxy = http:\/\/proxy.yoyodyne.com:18023\//http_proxy = http:\/\/$wget_proxy\//g" /etc/wgetrc
sudo sed -i "s/#ftp_proxy = http:\/\/proxy.yoyodyne.com:18023\//ftp_proxy = http:\/\/$wget_proxy\//g"  /etc/wgetrc
sudo sed -i "s/#use_proxy = on/use_proxy = on/g" /etc/wgetrc
}

configure_wget_proxy