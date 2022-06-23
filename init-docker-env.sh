#!/usr/bin/env bash

export uid=$(id -u)
export gid=$(id -g)
export user=$(id -nu)
export group=$(id -ng)

__graphics_opts=()

repoPath="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source checkFunctions.sh
if [ "$(check_docker)" == "1" ]
then
    exit 1
fi

# Check if running under WSL distro
if [ -n "${WSL_DISTRO_NAME}" ]
then
    # Check if docker daemon is running
    is_docker_daemon_running="$(ps -a | grep -c dockerd)"
    if [ "${is_docker_daemon_running}" -lt 1 ]
    then
        echo Docker daemon is not running.
        echo run it with: sudo dockerd
        exit 0
    fi
fi

# Check if docker image was built
image_exits=$(docker images | grep -c dev-env-flutter)
if [ "${image_exits}" -lt 1 ]
then
    echo "Not image dev-env-flutter found. Let's building it!"
    "${repoPath}"/docker/dockerbuild.sh
fi

exists_docker_volume=$(docker volume ls | grep -c flutter-sdk)

if [ "${exists_docker_volume}" -gt 0 ]
then
    docker volume create flutter-sdk
fi

gen_x11(){
    local -n opts="$1"
    if [ -n "${DISPLAY}" ]
    then
        local tmpxafile="/tmp/run-${uid}-${gid}-${DISPLAY//:/-}.Xauthority"
        true > "$tmpxafile"
        xauth extract "${tmpxafile}" "${DISPLAY}" || return 1
        opts+=(--env "DISPLAY=${DISPLAY}"
               --env "XAUTHORITY=${2}"
               --volume "${tmpxafile}:${2}:ro"
               --volume "/tmp/.X11-unix:/tmp/.X11-unix")
        echo "Exporting display ${DISPLAY}"
    fi
}

if [ -n "${DISPLAY}" ]
then
    xhost +local:docker
    gen_x11 __graphics_opts "/flutter/.Xauthority"
fi

docker run \
    -it --rm \
    --privileged \
    --name flutterenv \
    --mount source=flutter-sdk,target=/opt \
    --volume "${repoPath}":/flutter \
    --env USER="$user" \
    --env UID="$uid" \
    --env GROUP="$group" \
    --env GID="$gid" \
    --env INSIDE_DOCKER="1" \
    "${__graphics_opts[@]}" \
    dev-env-flutter:latest \
    "${@}"

