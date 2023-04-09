# Check to see if we are currently running "as Administrator"
if (!(Test-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas"
    $newProcess.WindowStyle = "hidden"
    [System.Diagnostics.Process]::Start($newProcess);

    exit
}

Install-Module Posh-Git -Scope AllUsers -Force
