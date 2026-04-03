<#
.SYNOPSIS
Tests TCP port connectivity.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$Computer,
    [int]$Port
)

$result = Test-NetConnection -ComputerName $Computer -Port $Port

$result.TcpTestSucceeded
