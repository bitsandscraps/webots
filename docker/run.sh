xhost +
docker run --runtime=nvidia --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
    --group-add $(getent group audio | cut -d: -f3) \
    -e HOST_PERMS="$(id -u):$(id -g)" \
    bitsandscraps/webots:cuda-10.0-ubuntu-18.04 /bin/bash
xhost -
