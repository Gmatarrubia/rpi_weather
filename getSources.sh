#!/bin/bash

set -e
currentPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source ./checkFunctions.sh

## Script entry
check_ansible

ansible-playbook installFlutter.yml
