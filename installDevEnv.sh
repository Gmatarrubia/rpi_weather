#!/bin/bash

set -e
currentPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ./checkFunctions.sh

## Script entry
check_ansible

sudo ansible-playbook installDevEnv.yml

flutter_dir_owner=$(stat -c "%U" /opt/flutter/)
if [ "${flutter_dir_owner}" != "${USER}" ]
then
    sudo chown "${USER}" /opt/flutter
fi
