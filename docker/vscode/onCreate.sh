#!/bin/bash

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