#!/bin/bash
# create at 20171031 by Sugare
#

if [ $# -eq 0 ]; then
    echo "Usage: $0 ip1 ip2 ip3..."
    exit 1
fi

echo 'CHANGE IMAGE REPO*******************************************************************************************'
sh changeY.sh

echo 'GENERATE SSH ID_RSA*****************************************************************************************'

if [ ! -f "/root/.ssh/id_rsa" ];then
	ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa
fi


echo 'CLOSE SWAP *************************************************************************************************'
for ip in $@
do
        ssh-copy-id -i /root/.ssh/id_rsa.pub $ip
	sleep 1
	ssh root@$ip swapoff -a
done

echo 'INSTALL PACKAGE ********************************************************************************************'
yum install -y epel-release
yum install -y python-pip python34 python-netaddr python34-pip ansible
pip install --upgrade Jinja2

echo 'GENERATE CONFIG_FILE ***************************************************************************************'
CONFIG_FILE=inventory/inventory.cfg python3 contrib/inventory_builder/inventory.py $@

echo 'START INSTALL **********************************************************************************************'
ansible-playbook -i inventory/inventory.cfg cluster.yml -b -v --private-key=~/.ssh/id_rsa

