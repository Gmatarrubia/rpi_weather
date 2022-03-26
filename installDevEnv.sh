#!/bin/bash

function check_ansible(){
    if [ -n "$(which ansible-playbook)" ]
    then
        echo "Ansible already installed"
    else
        echo "Installing ansible..."
        apt install -y ansible
    fi
}

## Script entry
check_ansible

sudo ansible-playbook installDevEnv.yml
ansible-playbook installFlutter.yml
