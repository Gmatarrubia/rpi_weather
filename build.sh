#!/bin/bash

repoPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"

# Script arguments handle
__verbose=
__test=

while (( $# )); do
    case ${1,,} in
        -v|--verbose)
            __verbose=1
            echo "Verbose output enabled"
            ;;
        -t|--test)
            shift
            echo "Testing mode launched"
            __test=1
            ;;
    esac
    shift
done

# Check if sources were downloaded
if [ ! -d "/opt/flutter/bin" ]
then
    "${repoPath}"/getSources.sh
fi


###Enable option for only start
/opt/flutter/bin/flutter pub get
if [ -z "$__test" ]
then
    /opt/flutter/bin/flutter config --enable-linux-desktop
    time /opt/flutter/bin/flutter build linux
else
    /opt/flutter/bin/flutter pub run build_runner build --delete-conflicting-outputs
    time /opt/flutter/bin/flutter test
fi
