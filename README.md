# docker-alfaview (legacy machine support)

## Quickstart:
* checkout repo
* build image with `docker build -t alfaview:latest .`
* run alfaview anytime with `docker run -d --rm --network host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -v $HOME/.local/share/alfaview:/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/video[0-3] --device /dev/dri -v /dev/shm:/dev/shm  alfaview:latest`