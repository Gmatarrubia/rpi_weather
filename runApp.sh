#!/bin/bash

repoPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"

# Script arguments handle
__mode="release"

while (( $# )); do
    case ${1,,} in
        -r|--release)
            echo "Building in release mode"
            __mode="release"
            ;;
        -d|--debug)
            echo "Building in debug mode"
            __mode="debug"
            ;;
    esac
    shift
done

__app=
function getApp() {
    __app="$( find "${repoPath}/build/linux/x64/${__mode}/bundle/" -maxdepth 1 -executable -type f)"
}
getApp

if [ -f "${__app}" ]
then
    "${__app}"
else
    "${repoPath}/build.sh" "--${__mode}"
    getApp
    "${__app}"
fi
