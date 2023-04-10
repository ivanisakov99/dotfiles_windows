Write-Host "Installing Python" -ForegroundColor "Green"
winget install python3 --silent --accept-package-agreements;

Write-Host "Installing Git" -ForegroundColor "Green"
winget install Git.Git -e --silent --accept-package-agreements --override "/VerySilent
                                                                            /NoRestart
                                                                            /o:PathOption=CmdTools
                                                                            /o:BashTerminalOption=ConHost
                                                                            /o:CRLFOption=CRLFAlways
                                                                            /o:CURLOption=WinSSL
                                                                            /o:SSHOption=ExternalOpenSSH
                                                                            /o:EnableSymlinks=Enabled
                                                                            /o:GitPullBehaviorOption=Rebase
                                                                            /Components=""icons,assoc,assoc_sh,gitlfs,windowsterminal"""
