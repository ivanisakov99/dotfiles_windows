
# Delete any old capture file.
$captureFile = "$PSScriptRoot\out.txt"
Remove-Item -ErrorAction Ignore $captureFile

Start-Sleep 5

# Start the elevated process *hidden and asynchronously*, passing
# a [System.Diagnostics.Process] instance representing the new process out, which can be used
# to monitor the process
$passThruArgs = '-noprofile', '-command', "testing.ps1", '*>', $captureFile
# $ps = Start-Process powershell -PassThru -ArgumentList $passThruArgs

$ps = Start-Process powershell -WindowStyle Hidden -PassThru -ArgumentList "$PSScriptRoot\testing.ps1", "*>", "$PSScriptRoot\out.txt"


# Wait for the capture file to appear, so we can start
# "tailing" it.
While (-not $ps.HasExited -and -not (Test-Path -LiteralPath $captureFile)) {
  Start-Sleep -Milliseconds 100
}

# Start an aux. background that removes the capture file when the elevated
# process exits. This will make Get-Content -Wait below stop waiting.
$jb = Start-Job {
  # Wait for the process to exit.
  # Note: $using:ps cannot be used directly, because, due to
  #       serialization/deserialization, it is not a live object.
  $ps = (Get-Process -Id $using:ps.Id)
  while (-not $ps.HasExited) { Start-Sleep -Milliseconds 100 }
  # Get-Content -Wait only checks once every second, so we must make
  # sure that it has seen the latest content before we delete the file.
  Start-Sleep -Milliseconds 1100
  # Delete the file, which will make Get-Content -Wait exit (with an error).
  Remove-Item -LiteralPath $using:captureFile
}

# Output the content of $captureFile and wait for new content to appear
# (-Wait), similar to tail -f.
# `-OutVariable capturedLines` collects all output in
# variable $capturedLines for later inspection.
Get-Content -ErrorAction SilentlyContinue -Wait -OutVariable capturedLines -LiteralPath $captureFile

Remove-Job -Force $jb  # Remove the aux. job

Write-Verbose -Verbose "$($capturedLines.Count) line(s) captured."

exit

