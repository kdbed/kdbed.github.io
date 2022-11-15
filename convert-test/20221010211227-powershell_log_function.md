---
id: 671d8c04-85b2-4149-968b-74d1b5846bfa
title: PowerShell - Log Function
---

- <a href="#log-function-for-powershell" id="toc-log-function-for-powershell">Log Function for PowerShell</a>

# Log Function for [PowerShell](id:86716c7a-447f-4c8f-94ed-87dc6f79f0af)

``` powershell
function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Message,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Information','Warning','Error')]
        [string]$Severity = 'Information'
    )

    [pscustomobject]@{
        Time = (Get-Date -f g)
        Message = $Message
        Severity = $Severity
    } | Export-Csv -Path "$env:Temp\LogFile.csv" -Append -NoTypeInformation
 }
```

From : [ATA](https://adamtheautomator.com/powershell-log-function/)
