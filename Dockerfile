# Run Alfaview in a container
#
# build alfaview image once 
# docker build -t alfaview:latest .
#
# start the app
# detached - recommended
# docker run -d --rm --network host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -v $HOME/.local/share/alfaview:/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/video[0-3] --device /dev/dri -v /dev/shm:/dev/shm  alfaview:latest

# interactive - development only
# docker run -it \
#	--rm \
#	--network host \
#	--cpuset-cpus 0 \
#	--memory 512mb \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
#	-v $HOME/.local/share/alfaview:/home/alfaview/.local/share/alfaview \
#	-v /dev/shm:/dev/shm \
#	--device /dev/dri \
#	--device /dev/snd \
#	--device /dev/video[0-3] \
#	alfaview:latest

FROM debian:bullseye-slim
LABEL maintainer "Sascha Xander <sxander@apache.org>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	fonts-roboto-hinted \
	ca-certificates \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	hicolor-icon-theme \
	libv4l-0 \
	libsecret-1-0 \
	xdg-utils \
	libfreetype6 \
	libgstreamer1.0-0 \
	gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-ugly \
	libxfixes3 \
	libasound2 \
	libxkbcommon0 \
	libdbus-1-3 \
	dbus-x11 \
	curl \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV ALFAVIEW_RELEASE beta
ENV ALFAVIEW_VERSION 8.13.0

RUN curl -sSL https://production-alfaview-assets.alfaview.com/$ALFAVIEW_RELEASE/linux/alfaview_$ALFAVIEW_VERSION.deb -o /tmp/alfaview_$ALFAVIEW_VERSION.deb \
	&& dpkg -i /tmp/alfaview_$ALFAVIEW_VERSION.deb \
	&& rm /tmp/*.deb

RUN apt-get autoremove -y --purge curl ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/alfaview

RUN useradd --create-home --home-dir $HOME alfaview \
	&& mkdir -p $HOME/.local/share/alfaview \
	&& chown -R alfaview:alfaview $HOME \
	&& usermod -a -G audio,video alfaview

USER alfaview

WORKDIR $HOME

ENTRYPOINT [ "/opt/alfaview/alfaview" ]
CMD [ "--noupdate", "--skipquicksetup", "--disableproxysettings", "--autoaccepteula", "--console" ]
