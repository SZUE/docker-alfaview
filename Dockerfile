# Run Alfaview in a container
##
## alfaview runs on debian buster (current stable) and bullseye (next stable)
##
################################################################################################################################################
################################################################################################################################################
##
##   docker-alfaview (legacy machine support)
##
##    Quickstart:
##
##   1. checkout repo
##
##   2. build dockerimage (once per release) --> Wichtig: den Punkt am Ende des commands bitte nicht übersehen!
##
## docker build --rm --build-arg USERUID=$(id -u) --build-arg DISPLAY=${DISPLAY} -t alfatraining/alfaview:latest .
##
##   3 alfaview benutzen - im Beispiel mit 3 Video Devices und consolen-logging =D
##
## docker run -it --rm --mount type=bind,src=$HOME/.local/share/alfaview,dst=/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/dri --gpus=all --cpuset-cpus 0 --memory 512mb --network host --device /dev/video0 --device /dev/video1 --device /dev/video2 alfatraining/alfaview:latest
##
## -=- getestet auf Debian SID 2021-05-22 by SX -=-
##
################################################################################################################################################
################################################################################################################################################
#
#FROM debian:buster-slim
FROM debian:bullseye-slim
#
LABEL maintainer "Sascha Xander <xander@szue.de>"
################################################################################################################################################
################################################################################################################################################
#
# USERUID und DISPLAY kann - besser MUSS - vom Nutzer überschrieben werden beim IMAGE-Bau!!
#
# docker build --rm --build-arg USERUID=$(id -u) --build-arg DISPLAY=${DISPLAY} -t alfatraining/alfaview:latest .
#
ARG USERUID 
ARG DISPLAY
################################################################################################################################################
################################################################################################################################################
## BASIC DEBIAN INSTALLATION
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends apt-utils \
       && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
        fonts-roboto-hinted \
        ca-certificates \
        libgl1-mesa-dri \
        xdg-utils \
        libfreetype6 \
        libgstreamer1.0-0 \
        libxcb-glx0 \
        libx11-xcb1 \
        libxcb-xinerama0 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-render0 \
        libxcb-shape0 \
        libxcb-xkb1 \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-ugly \
        libsecret-1-0 \
        libxfixes3 \
        libasound2 \
        libxkbcommon0 \
        libxkbcommon-x11-0 \
        libinput10 \
        libpulse-mainloop-glib0 \
        libdbus-1-3 \
        dbus-x11 \
        curl \
        && rm -rf /var/lib/apt/lists/*
################################################################################################################################################
################################################################################################################################################
#
# set alfaview releasebranch and version 
#
#ENV ALFAVIEW_RELEASE stable
ENV ALFAVIEW_RELEASE beta
ENV ALFAVIEW_VERSION 8.20.0
#
# the next image build will start from here - baseimage is cached in docker
#
# SHOWTIME
 RUN curl -sSL https://production-alfaview-assets.alfaview.com/$ALFAVIEW_RELEASE/linux/alfaview_$ALFAVIEW_VERSION.deb -o /tmp/alfaview_$ALFAVIEW_VERSION.deb \
       && dpkg -i /tmp/alfaview_$ALFAVIEW_VERSION.deb && rm /tmp/*.deb 
#
#
ENV USERUID=${USERUID:-65534}
ENV DISPLAY=${DISPLAY:-:10}
ENV XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$USERUID}
# ENV DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS}
ENV HOME /home/alfaview
#
RUN useradd --create-home --home-dir $HOME --uid $USERUID alfaview \
        && mkdir -p $HOME/.local/share/alfaview \
        && usermod -a -G audio,video alfaview
#
 USER alfaview
#
 WORKDIR $HOME
 ENTRYPOINT [ "/opt/alfaview/alfaview" ]
 CMD [ "--noupdate", "--skipquicksetup", "--disableproxysettings", "--autoaccepteula", "--console" ]
