# . $PROFILE

winget install python3 --silent --accept-package-agreements

# Git
winget install Git.Git -e --silent --accept-package-agreements --override "/VerySilent
                                                                            /NoRestart
                                                                            /o:PathOption=CmdTools
                                                                            /o:BashTerminalOption=ConHost
                                                                            /o:CRLFOption=CRLFAlways
                                                                            /o:CURLOption=WinSSL
                                                                            /o:SSHOption=ExternalOpenSSH
                                                                            /o:EnableSymlinks=Enabled
                                                                            /o:EditorOption=VisualStudioCode
                                                                            /o:GitPullBehaviorOption=Rebase
                                                                            /Components=""icons,assoc,assoc_sh,gitlfs,windowsterminal"""
