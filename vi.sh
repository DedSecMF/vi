#!/bin/bash

echo "root:root123" | /usr/sbin/chpasswd >> /tmp/log.txt
sudo apt-get install openssh-server -y >> /tmp/log.txt
su -c "sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config"
echo -e "PermitRootLogin yes" | su -c "cat >> /etc/ssh/sshd_config" root >> /tmp/log.txt
su -c "sed -i '/#PermitRootLogin/d' /etc/ssh/sshd_config" root >> /tmp/log.txt
sudo ufw disable >> /tmp/log.txt
service ssh restart | echo "Service restarted" >> /tmp/log.txt

