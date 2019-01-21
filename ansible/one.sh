export ANSIBLE_HOST_KEY_CHECKING=False
ansible linBox1 -i inventory -m ping -k

ansible linuxBoxes -i inventory -a 'hostnamectl'

#update ubuntu machines
ansible ubuntu -i inventory -a 'apt-get update'

#install docker on ubuntu
ansible linuxBoxes -i inventory -b -a 'apt-get --yes --force-yes install docker.io'

#change permission
ansible cent -i labAzureSystems -b -a 'chmod 755 /var/lib/rpm' --ask-become-pass
