<#
.SYNOPSIS
Scans a range of ports on a host.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$Computer,
    [int]$StartPort = 1,
    [int]$EndPort = 1024
)

for ($port = $StartPort; $port -le $EndPort; $port++) {
    $result = Test-NetConnection -ComputerName $Computer -Port $port -WarningAction SilentlyContinue

    if ($result.TcpTestSucceeded) {
        Write-Output "Port $port is OPEN"
    }
}
