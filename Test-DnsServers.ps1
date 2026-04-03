<#
.SYNOPSIS
Tests multiple DNS servers for resolution speed.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string[]]$DnsServers = @("8.8.8.8","1.1.1.1"),
    [string]$Hostname = "google.com"
)

foreach ($server in $DnsServers) {
    $time = Measure-Command {
        Resolve-DnsName $Hostname -Server $server -ErrorAction SilentlyContinue
    }

    [PSCustomObject]@{
        Server = $server
        TimeMs = $time.TotalMilliseconds
    }
}
