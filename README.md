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
