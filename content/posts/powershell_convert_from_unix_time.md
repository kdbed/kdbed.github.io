+++
title = "PowerShell - Convert from Unix Time"
author = ["svejk"]
tags = ["powershell"]
draft = false
+++

## Function to convert from Unix timestamps {#function-to-convert-from-unix-timestamps}

```shell { linenos=true, linenostart=1 }
function ConvertFrom-UnixTime {
    [CmdletBinding(DefaultParameterSetName = "Seconds")]
    param (
        [Parameter(Position = 0,
            ValueFromPipeline = $true,
            Mandatory = $true,
            ParameterSetName = "Seconds")]
        [int]
        $Seconds,

        [Parameter(Position = 0,
            ValueFromPipeline = $true,
            Mandatory = $true, ParameterSetName = "Miliseconds")]
        [bigint]
        $Miliseconds
    )
    Begin {
        $date = (Get-Date "1970-01-01 00:00:00.000Z")
    }
    Process {
        switch ($PSCmdlet.ParameterSetName) {
            "Miliseconds" {
                $date = $date.AddMilliseconds($Miliseconds)
            }
            Default {
                $date = $date.AddSeconds($Seconds);
                            }
        }
    }
    End {
        $date
    }
}
ConvertFrom-UnixTime '1681230017000'
```
