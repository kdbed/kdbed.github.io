+++
title = "PowerShell - Log Function"
author = ["svejk"]
draft = false
+++

## Log Function for [powershell]({{< relref "powershell.md" >}}) {#log-function-for-powershell--powershell-dot-md}

```powershell
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
