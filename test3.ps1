

# $stdout = Start-Job -ScriptBlock {
#   Get-Content ".\stdout.txt" -Wait | ForEach-Object { Write-Output -ForegroundColor White $_ }
# }

# $stderr = Start-Job {
#   Get-Content ".\stderr.txt" -Wait | ForEach-Object { write-host -ForegroundColor Red $_ }
# }

# Wait-Job -Id $stdout.Id

$test = { Get-Content ".\stderr.txt" -Wait }
Start-Job -ScriptBlock $test | Wait-Job | Receive-Job


# Get all matching files in dir
# dir C:\*.log -Include log1.txt, log2.txt
