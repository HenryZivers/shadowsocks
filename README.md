# shadowsocks

## Environment

* CentOS 7
* Ubuntu 16.04

## Installation

* CentOS 7
```
yum install epel-release
yum install python-setuptools m2crypto supervisor
easy_install pip
pip install shadowsocks
```

* Ubuntu 16.04
```
apt install python-pip
apt install python-m2crypto
pip2 install shadowsocks
```

## Configuration

* CentOS 7
```
vim /etc/shadowsocks.json
vim /etc/systemd/system/shadowsocks.service
vim /etc/supervisord.conf
```

* Ubuntu 16.04
```
vim /etc/shadowsocks.json
```

## Enable shadowsocks service

* CentOS 7
```
systemctl enable shadowsocks
systemctl start shadowsocks
```

* Ubuntu 16.04
```
ssserver -c /etc/shadowsocks.json -d start
ssserver -c /etc/shadowsocks.json -d stop
```

## Check

`systemctl status shadowsocks -l`

## Client
https://github.com/shadowsocks/shadowsocks-windows/releases

## Advance

### Step 1, increase the maximum number of open file descriptors
To handle thousands of concurrent TCP connections, we should increase the limit of file descriptors opened.
Edit the limits.conf

```
vi /etc/security/limits.conf
```

Add these two lines

```
* soft nofile 51200
* hard nofile 51200
```

Then, before you start the shadowsocks server, set the ulimit first

```
ulimit -n 51200
```

### Step 2, Tune the kernel parameters

The priciples of tuning parameters for shadowsocks are
Reuse ports and conections as soon as possible.
Enlarge the queues and buffers as large as possible.
Choose the TCP congestion algorithm for large latency and high throughput.

```
vim /etc/sysctl.conf
```

## Ref
https://github.com/shadowsocks/shadowsocks/wiki
