---
id: 6125ce50-da2d-47c0-89cf-1b2b152827b3
title: PowerShell - Get Domain Controllers in Forest
---

To list all of the domain controllers in an [Active Directory](id:eb1af46c-3b9b-4292-bfb2-5737c2264ce9) forest:

``` powershell
(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }| Format-Table -Property Name,ComputerObjectDN,Domain,Forest,IPv4Address,OperatingSystem,OperatingSystemVersion
```
