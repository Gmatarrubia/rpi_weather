#!/bin/bash

scriptPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
repoPath="$(realpath "${scriptPath}/../../")"

export uid=$(id -u)
export gid=$(id -g)
export user=$(id -nu)
export group=$(id -ng)

if [ -n "${DISPLAY}" ]
then
    echo "Export display ${DISPLAY}"
    xhost +local:docker
    tmpxafile="/tmp/run.Xauthority"
    touch "$tmpxafile"
    xauth extract "${tmpxafile}" "${DISPLAY}" || return 1
fi

"${repoPath}"/docker/dockerbuild.sh

exit 0