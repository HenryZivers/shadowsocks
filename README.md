# shadowsocks

## Environment

* CentOS 7

## Installation

```
yum install epel-release
yum install python-setuptools m2crypto supervisor
easy_install pip
pip install shadowsocks
```

## Configuration

```
vim /etc/shadowsocks.json
vim /etc/systemd/system/shadowsocks.service
vim /etc/supervisord.conf
```

## Enable shadowsocks service

```
systemctl enable shadowsocks
systemctl start shadowsocks
```

## Check

`systemctl status shadowsocks -l`

