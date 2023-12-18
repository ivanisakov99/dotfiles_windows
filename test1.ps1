[CmdletBinding()]
param (
    [Parameter(Position=0, Mandatory=$true)]
    [string[]]
    $PassThroughArgs
)

$PassThroughArgs += "1>", "$PSScriptRoot\stdout.txt", "2>", "$PSScriptRoot\stderr.txt"

Start-Process powershell -ArgumentList $PassThroughArgs



