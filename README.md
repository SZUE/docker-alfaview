# docker-alfaview (legacy machine support)

## Quickstart:
* checkout repo

* build dockerimage (once per update) :|:  
## docker build --rm --build-arg USERUID=$(id -u) --build-arg DISPLAY=${DISPLAY} -t alfaview:latest .
wichtig: den Punkt am Ende bitte nicht übersehen!

* alfaview benutzen - mit 3 Video Devices (eines sollte genügen) und schlankes bind-mount verwendet
## docker run -it --rm --mount type=bind,src=$HOME/.local/share/alfaview,dst=/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/dri --gpus=all --cpuset-cpus 0 --memory 512mb --network host --device /dev/video0 --device /dev/video1 --device /dev/video2 alfaview:latest



                        Usage: /opt/alfaview/alfaview [options] url

                        Options:
                        --verbose                              enable verbose logs {debug level}
                        --url <url>                            web launch url
                        --autoaccepteula                       automatically accept the eula
                        --subroom <subroomId>                  auto join this subroomId after
                                                                connecting
                        --bandwidthProfile <bandwidthProfile>  override default bandwidth profile
                        --screenshareQuality <qualityName>     can be used to override the
                                                                screenshare quality value
                        --nocolor                              disable stdout colors
                        --nostdout                             disable std out log output hook
                        --console                              enable console
                        --noupdate                             skip checking for updates
                        --bandwidthUsage <bandwidthUsage>      can be used to lock the application
                                                                into a specific Bandwidth Usage mode
                                                                (normal, reduced, minimum)
                        --skipquicksetup                       skip device setup screen at launch
                        --skipportcheck                        skip port checking at launch
                        --disableproxysettings                 disable proxy settings UI
                        --disableleaveroom                     disable leaving room on stage
                        -h, --help                             Displays help on commandline options.
                        --help-all                             Displays help including Qt specific
                                                                options.
                        -v, --version                          Displays version information.

                        Arguments:
                        url                                    web launch url




                        Usage: /opt/alfaview/alfaview [options] url

                        Options:
                        --verbose                              enable verbose logs {debug level}
                        --url <url>                            web launch url
                        --autoaccepteula                       automatically accept the eula
                        --subroom <subroomId>                  auto join this subroomId after
                                                                connecting
                        --bandwidthProfile <bandwidthProfile>  override default bandwidth profile
                        --screenshareQuality <qualityName>     can be used to override the
                                                                screenshare quality value
                        --nocolor                              disable stdout colors
                        --nostdout                             disable std out log output hook
                        --console                              enable console
                        --noupdate                             skip checking for updates
                        --bandwidthUsage <bandwidthUsage>      can be used to lock the application
                                                                into a specific Bandwidth Usage mode
                                                                (normal, reduced, minimum)
                        --skipquicksetup                       skip device setup screen at launch
                        --skipportcheck                        skip port checking at launch
                        --disableproxysettings                 disable proxy settings UI
                        --disableleaveroom                     disable leaving room on stage
                        -h, --help                             Displays help on commandline options.
                        --help-all                             Displays help including Qt specific
                                                                options.
                        -v, --version                          Displays version information.
                        --qmljsdebugger <value>                Activates the QML/JS debugger with a
                                                                specified port. The value must be of
                                                                format port:1234[,block]. "block" makes
                                                                the application wait for a connection.
                        --platform <platformName[:options]>    QPA plugin. See QGuiApplication
                                                                documentation for available options for
                                                                each plugin.
                        --platformpluginpath <path>            Path to the platform plugins.
                        --platformtheme <theme>                Platform theme.
                        --plugin <plugin>                      Additional plugins to load, can be
                                                                specified multiple times.
                        --qwindowgeometry <geometry>           Window geometry for the main window,
                                                                using the X11-syntax, like
                                                                100x100+50+50.
                        --qwindowicon <icon>                   Default window icon.
                        --qwindowtitle <title>                 Title of the first window.
                        --reverse                              Sets the application's layout
                                                                direction to Qt::RightToLeft (debugging
                                                                helper).
                        --session <session>                    Restores the application from an
                                                                earlier session.
                        --display <display>                    Display name, overrides $DISPLAY.
                        --name <name>                          Instance name according to ICCCM
                                                                4.1.2.5.
                        --nograb                               Disable mouse grabbing (useful in
                                                                debuggers).
                        --dograb                               Force mouse grabbing (even when
                                                                running in a debugger).
                        --visual <id>                          ID of the X11 Visual to use.
                        --geometry <geometry>                  Alias for --windowgeometry.
                        --icon <icon>                          Alias for --windowicon.
                        --title <title>                        Alias for --windowtitle.

                        Arguments:
                        url                                    web launch url


### DEPRECATED - before 8.18.2
* build image via: 
docker build --pull --no-cache --rm --build-arg USERUID=$(id -u) --build-arg DISPLAY=${DISPLAY} -t alfaview:beta-8.18.2 -f "Dockerfile"

* run container:
AS VERBOSE DEBUG CONSOLE
docker run -it --rm --cpuset-cpus 0 --memory 512mb --network host --mount type=bind,src=$HOME/.local/share/alfaview,dst=/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/dri --device /dev/video0 --device /dev/video1 --device /dev/video2 alfaview:latest

OR DETACHED if stable
docker run -d --rm --cpuset-cpus 0 --memory 512mb --network host --mount type=bind,src=$HOME/.local/share/alfaview,dst=/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/dri --device /dev/video0 --device /dev/video1 --device /dev/video2 alfaview:latest



* run alfaview anytime with `docker run -d --rm --network host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -v $HOME/.local/share/alfaview:/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/video[0-3] --device /dev/dri -v /dev/shm:/dev/shm  alfaview:latest`
* pro-tipp: create a alias in ~/.bash_aliases 


docker build --pull --no-cache --rm --build-arg USERUID=$(id -u) --build-arg DISPLAY=${DISPLAY} -t alfaview:latest . && docker run -it --rm --cpuset-cpus 0 --memory 512mb --network host -v $HOME/.local/share/alfaview:/home/alfaview/.local/share/alfaview --device /dev/snd --device /dev/dri --device /dev/video0 --name xanderstruck alfaview:latest