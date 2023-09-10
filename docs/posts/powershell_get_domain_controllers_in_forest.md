+++
title = "PowerShell - Get Domain Controllers in Forest"
author = ["svejk"]
tags = ["activeDirectory"]
draft = false
+++

To list all of the domain controllers in an [Active Directory]({{< relref "active_directory.md" >}}) forest:

```powershell
(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }| Format-Table -Property Name,ComputerObjectDN,Domain,Forest,IPv4Address,OperatingSystem,OperatingSystemVersion
```
