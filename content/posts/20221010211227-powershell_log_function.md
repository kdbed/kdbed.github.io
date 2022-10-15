+++
title = "PowerShell - Log Function"
author = ["svejk"]
draft = false
+++

## Log Function for [PowerShell]({{<relref "20221006200600-powershell.md#" >}}) {#log-function-for-powershell--20221006200600-powershell-dot-md}

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