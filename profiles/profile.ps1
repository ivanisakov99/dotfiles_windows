# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

# Load in Git status to prompt
if (($null -ne (Get-Command git -ErrorAction SilentlyContinue)) -and ($null -ne (Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue))) {
    Import-Module Posh-Git
}
