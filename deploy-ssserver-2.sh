#!/bin/bash

#Add BBR
uname -r
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

#Check BBR configuration
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod |grep bbr

#Install Shadowsocks Server(SSServer)
yum update -y
yum install epel-release -y
yum install python-pip m2crypto -y
pip install --upgrade pip
pip install shadowsocks

#Configure SSServer
mv ./deploy-shadowsocks.json /etc/shadowsocks.json

#Start Service
ssserver -c /etc/shadowsocks.json -d start
