#!/bin/bash
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; fi
mkdir -p $HOME/logs; logfile=$HOME/logs/$(basename $BASH_SOURCE).log
{
printf '=%.0s' {1..80};printf "\n  Starting execution \t:\t $(date)\n";printf '=%.0s' {1..80};echo
#
####################################### Code : Begin ######################################################
#
#detect os release for setting up Netbios access and SAMBA
if hostnamectl | grep -q CentOS; then 
    echo "Centos detected"
    #centos
    sudo yum install -y git
    sudo yum install -y ansible
    sudo yum install -y sshpass
else 
    echo "Ubuntu detected"
    sudo apt-get -y install ansible
    sudo apt-get -y install sshpass
fi
#disable prompt for ssh key accept when connecting with Ansible
export ANSIBLE_HOST_KEY_CHECKING=False
#
####################################### Code :  End  ######################################################
#
printf '*%.0s' {1..80};printf "\n  Ending execution \t:\t $(date)\n";printf '*%.0s' {1..80};printf "\n"
} 2>&1 | tee -a $logfile