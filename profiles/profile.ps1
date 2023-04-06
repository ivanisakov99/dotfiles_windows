# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

# Source extras
Get-ChildItem (Join-Path (Split-Path -parent $profile) "common_components") | ForEach-Object { . $_.FullName }
