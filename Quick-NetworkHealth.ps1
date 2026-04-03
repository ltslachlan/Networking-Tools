<#
.SYNOPSIS
Performs quick network diagnostics.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

$targets = @(
    "8.8.8.8",
    "google.com",
    "microsoft.com"
)

foreach ($target in $targets) {
    $ping = Test-Connection -ComputerName $target -Count 1 -Quiet
    $dns = Resolve-DnsName $target -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Target      = $target
        Ping        = $ping
        DNS         = if ($dns) { $true } else { $false }
    }
}
