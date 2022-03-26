#!/bin/bash

function check_sudo_user(){
    if [ "$(id -u)" -ne 0 ]
    then
        echo "This script needs to run as sudo. Please run like this:"
        echo "sudo ./installDevEnv.sh"
        exit 1
    fi
}

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

check_sudo_user
check_ansible

ansible-playbook installDevEnv.yml
