
$passThruArgs = '-command', '&', 'testing.ps1', '*>', "`"$PSScriptRoot\out.txt`""

# Start-Process powershell -ArgumentList "$PSScriptRoot\testing.ps1", "*>", "out.txt"

Start-Process powershell -Wait -WindowStyle Hidden -PassThru -Verb RunAs -ArgumentList "$PSScriptRoot\testing.ps1", "*>", "$PSScriptRoot\out.txt"

Get-Content "$PSScriptRoot\out.txt"
