#!/bin/bash

repoPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"

# Script arguments handle
__verbose=
__cmd=

while (( $# )); do
    case ${1,,} in
        -v|--verbose)
            __verbose=1
            echo "Verbose output enabled"
            ;;
        -cmd|--cmd)
            shift
            __cmd=("${@}")
            echo Custom bitbake command: "${__cmd[@]}"
            ;;
    esac
    shift
done

# Check if sources were downloaded
if [ ! -d "${repoPath}/sources" ]
then
    "${repoPath}"/getSources.sh
fi


###Enable option for only start

if [ -z "${__cmd[*]}" ]
then
    ./sources/bin/flutter pub get
    time ./sources/bin/flutter build linux
else
    echo "Executing command: ${__cmd[*]}"
    time "${__cmd[@]}"
fi
