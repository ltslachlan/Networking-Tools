<#
.SYNOPSIS
Continuously pings a host and logs results.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$Target = "8.8.8.8",
    [string]$LogPath = "ping-log.txt"
)

while ($true) {
    $result = Test-Connection $Target -Count 1 -ErrorAction SilentlyContinue

    $status = if ($result) { "UP" } else { "DOWN" }
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    "$time - $Target - $status" | Out-File -Append $LogPath

    Start-Sleep -Seconds 5
}
