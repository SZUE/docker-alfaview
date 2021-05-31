# docker-alfaview (legacy machine support)
## quickstart
1. checkout
2. edit alfaview.sh (row 20-22 -> how many cams and which of those do you want to share with the container?) - start with /dev/video0 only if unsure.
3. start ./alfaview.sh 

## command switches
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
