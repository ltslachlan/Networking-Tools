<#
.SYNOPSIS
Gets network adapter details.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

Get-NetAdapter |
Select Name, Status, LinkSpeed
