#!/bin/bash

repoPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"

echorun() {
    echo "$@"
    "$@"
}

echorun rm -rf .flutter*
echorun rm -rf build
echorun rm -rf .packages
