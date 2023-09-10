+++
title = "PowerShell - Common Members of two groups"
author = ["svejk"]
draft = false
+++

## Get members in common for 2 groups in AD {#get-members-in-common-for-2-groups-in-ad}

```sh
Function Get-ADGroupMembersInBothGroups {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$Group1,
        [Parameter(Mandatory=$true)]
        [string]$Group2
    )
    $Group1Members = Get-ADGroup -Identity $Group1 -properties members |select -expand members
    $Group2Members = Get-ADGroup -Identity $Group2 -properties members|select -expand members
    $match = $Group1Members | Where-Object {$Group2Members -contains $_}
    write-host $match
}
```
