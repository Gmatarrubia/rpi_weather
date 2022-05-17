#!/bin/bash

set -e
currentPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ./checkFunctions.sh

## Script entry
check_ansible

sudo ansible-playbook installDevEnv.yml
