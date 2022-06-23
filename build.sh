#!/bin/bash

repoPath="$(dirname $(realpath ${BASH_SOURCE[0]}))"

# Script arguments handle
__verbose=
__test=
__mode="--release"

while (( $# )); do
    case ${1,,} in
        -v|--verbose)
            __verbose=1
            echo "Verbose output enabled"
            ;;
        -t|--test)
            echo "Testing mode launched"
            __test=1
            ;;
        -d|--debug)
            echo "Building in debug mode"
            __mode="--debug"
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
    time /opt/flutter/bin/flutter build linux "${__mode}"
else
    /opt/flutter/bin/flutter pub run build_runner build --delete-conflicting-outputs
    time /opt/flutter/bin/flutter test
fi
