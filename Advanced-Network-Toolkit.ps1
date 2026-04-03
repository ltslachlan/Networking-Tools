<#
.SYNOPSIS
Interactive network troubleshooting toolkit.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

function Show-Menu {
    Clear-Host
    Write-Host "=== NETWORK TOOLKIT ==="
    Write-Host "1. IP Configuration"
    Write-Host "2. Ping Test"
    Write-Host "3. DNS Lookup"
    Write-Host "4. Port Test"
    Write-Host "5. Trace Route"
    Write-Host "6. Exit"
}

do {
    Show-Menu
    $choice = Read-Host "Select option"

    switch ($choice) {
        1 { ipconfig /all; pause }
        2 { 
            $target = Read-Host "Enter host"
            Test-Connection $target -Count 2
            pause
        }
        3 {
            $host = Read-Host "Enter hostname"
            Resolve-DnsName $host
            pause
        }
        4 {
            $host = Read-Host "Enter host"
            $port = Read-Host "Enter port"
            Test-NetConnection $host -Port $port
            pause
        }
        5 {
            $target = Read-Host "Enter host"
            tracert $target
            pause
        }
    }

} while ($choice -ne 6)
