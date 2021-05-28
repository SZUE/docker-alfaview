#!/bin/sh -e
echo "'Thank you!' for using alfaview!"
echo "* PHASE 1 - set environment..."
_USERUID=$(id -u) 
echo "-> setup successful!"
echo "."
echo "* PHASE 2 - building baseimage..."
docker build --quiet --rm --build-arg USERUID=${_USERUID} --build-arg DISPLAY=${DISPLAY} -t alfatraining/alfaview:latest . || exit $?
echo "-> build successful!"
echo "."
echo "* PHASE 3 - starting non-persistent+detached container..."
docker run -d --rm \
    --mount type=bind,src=$HOME/.local/share/alfaview,dst=/home/alfaview/.local/share/alfaview \
    --mount type=bind,src=/run/user/$_USERUID,dst=/run/user/$_USERUID \
    --device /dev/snd \
    --device /dev/dri \
    --cpuset-cpus 0 \
    --memory 512mb \
    --network host \
    --device /dev/video0 \
    --device /dev/video1 \
    --device /dev/video2 \
    --name alfaview \
    alfatraining/alfaview:latest || exit $?
echo "-> start successful!"
echo "."
echo "check 'docker logs -f alfaview' for insights."
exit $?

#./build-alfaview-image.sh \
#	&& ./start-alfaview.sh
#	&& ./start-alfaview-consolelog.sh
