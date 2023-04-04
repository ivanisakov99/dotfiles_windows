# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

# Load in extras
Get-ChildItem (Join-Path (Split-Path -parent $profile) "components") | ForEach-Object { & $_.FullName }
