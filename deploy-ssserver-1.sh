#!/bin/bash

#Add new kernel
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y

#Configure Grub2
grub2-mkconfig -o /boot/grub2/grub.cfg
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0

#Reboot
echo "SHUTDOWN AFTER 5s"
shutdown now
