# Shadowsocks服务器部署脚本

## 简介
本脚本用于快速部署Shadowsocks Server服务(SSServer)，并使用TCP-BBR算法优化连接。

适用环境：CentOS 7.x

本脚本包含三个文件：
1. deploy-ssserver-1.sh #脚本1，安装支持BBR的Linux内核(使用官方镜像)
2. deploy-ssserver-2.sh #脚本2，配置BBR及SSServer的安装和配置
3. deploy-shadowsocks.json #SSServer配置文件

## 使用方法
安装git服务
```
yum install git
```
拉取脚本
```
git clone https://github.com/cnzh/shadowsocks deploy-ssserver
cd deploy-ssserver/
```
执行脚本1
```
sh deploy-ssserver-1.sh
```
脚本1执行完后，系统将会关闭。此时新的内核已经安装成功，并添加Grub2引导。此时，需要用户手动将引导方式切换为Grub2方式。

以Linode为例，需要在Dashboard->Configuration Profiles->Edit->Boot Settings->Kernel中，选中Grub2方式
重新开机，进入脚本目录
```
cd deploy-ssserver/
```
修改ssserver配置文件`deploy-shadowsocks.json`。将其中的`port_password`端口密钥对按自己的习惯配置。例如
```
"port_password": {
    "8381": "foobar1",
    "8382": "foobar2",
    "8383": "foobar3",
    "8384": "foobar4"
},
```
执行脚本2
```
sh deploy-ssserver-2.sh
```
当输出如下时，SSServer启动成功
```
INFO: loading config from /etc/shadowsocks.json
2018-01-17 11:25:47 INFO     loading libcrypto from libcrypto.so.10
started
```

## 链接
* [Shadowsocks Wiki](https://github.com/shadowsocks/shadowsocks/wiki)
* [Shadowsocks Client](https://github.com/shadowsocks/shadowsocks-windows/releases)
