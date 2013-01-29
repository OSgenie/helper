#!/bin/bash
wget_proxy=192.168.11.3:3128

function configure_wget_proxy ()
{
sudo cp /etc/wgetrc /etc/wgetrc.orig
sudo chmod a-w /etc/wgetrc.orig
sudo sed -i "s/#http_proxy = http:\/\/proxy.yoyodyne.com:18023\//http_proxy = http:\/\/$wget_proxy\//g" /etc/wgetrc
sudo sed -i "s/#ftp_proxy = http:\/\/proxy.yoyodyne.com:18023\//ftp_proxy = http:\/\/$wget_proxy\//g"  /etc/wgetrc
sudo sed -i "s/#use_proxy = on/use_proxy = on/g" /etc/wgetrc
}
configure_wget_proxy