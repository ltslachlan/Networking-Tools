<#
.SYNOPSIS
Tests DNS resolution.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string[]]$Hostnames
)

foreach ($host in $Hostnames) {
    try {
        Resolve-DnsName $host -ErrorAction Stop
        Write-Output "$host - OK"
    } catch {
        Write-Output "$host - Failed"
    }
}
