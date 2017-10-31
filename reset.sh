#!/bin/bash
# create at 20171031 by Sugare
#
mv /etc/systemd/system/kubelet.service.d /etc/systemd/system/kubelet.service.d-bak
ansible-playbook -i inventory/inventory.cfg reset.yml -b -v --private-key=~/.ssh/id_rsa
