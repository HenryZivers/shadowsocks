#!/bin/bash

uname -r
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control

lsmod |grep bbr

yum update -y

yum install epel-release -y

yum install python-pip m2crypto -y

pip install --upgrade pip
pip install shadowsocks

mv ./deploy-shadowsocks.json /etc/shadowsocks.json

ssserver -c /etc/shadowsocks.json -d start

