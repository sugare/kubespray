#!/bin/bash
# create at 2017/10/30 by Sugare 
# mail: sugare.zhang@daocloud.io

# git clone https://github.com/kubernetes-incubator/kubespray.git
# cd kubespray
# sh changY.sh


## kubespray 2.1
# grc_image_files=(
# ./extra_playbooks/roles/dnsmasq/templates/dnsmasq-autoscaler.yml
# ./extra_playbooks/roles/download/defaults/main.yml
# ./extra_playbooks/roles/kubernetes-apps/ansible/defaults/main.yml
# ./roles/download/defaults/main.yml
# ./roles/dnsmasq/templates/dnsmasq-autoscaler.yml
# ./roles/kubernetes-apps/ansible/defaults/main.yml
# )

## kubespray 2.3
grc_image_files=(
./extra_playbooks/roles/dnsmasq/templates/dnsmasq-autoscaler.yml.j2
./extra_playbooks/roles/download/defaults/main.yml
./extra_playbooks/roles/kubernetes-apps/ansible/defaults/main.yml
./roles/download/defaults/main.yml
./roles/dnsmasq/templates/dnsmasq-autoscaler.yml.j2 
./roles/kubernetes-apps/ansible/defaults/main.yml
)

for file in ${grc_image_files[@]} ; do
	# echo $file $file.bak
	/bin/cp $file $file.bak
	sed -i 's#gcr.io/google_containers#sugare#g' $file
	sed -i 's#gcr.io/kubernetes-helm#sugare#g' $file
done
