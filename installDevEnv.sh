#!/bin/bash

set -e
currentPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ./checkFunctions.sh

## Script entry

## Script entry
if [ -z "${INSIDE_DOCKER}" ]
then
    check_vscode
else
    echo "Not needed vscode inside docker. Skiping!"
fi
check_ansible

sudo ansible-playbook installDevEnv.yml
