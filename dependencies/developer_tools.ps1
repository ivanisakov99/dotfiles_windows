winget install Microsoft.PowerShell --silent --accept-package-agreements

# GitHub CLI
winget install --id GitHub.cli --silent --accept-package-agreements

winget install Microsoft.VisualStudioCode --silent --accept-package-agreements

# winget install Microsoft.VisualStudio.2022.Professional --silent --accept-package-agreements --override "--wait
#                                                                                                             --quiet
#                                                                                                             --norestart
#                                                                                                             --nocache
#                                                                                                             --addProductLang En-us
#                                                                                                             --add Microsoft.VisualStudio.Workload.Azure
#                                                                                                             --add Microsoft.VisualStudio.Workload.NetWeb"

winget install Vim.Vim --silent --accept-package-agreements

winget install OpenJS.NodeJS --silent --accept-package-agreements

Get-PackageProvider NuGet -Force | Out-Null
