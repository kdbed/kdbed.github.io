+++
title = "PowerShell - Custom Execution Timer"
author = ["svejk"]
draft = false
+++

## Custom Execution Timer {#custom-execution-timer}

source: [devblogs](https://devblogs.microsoft.com/powershell-community/measuring-script-execution-time/#:~:text=PowerShell%20has%20a%20built%2Din,passed%20to%20the%20script%20block.)

```pwsh
function Measure-CommandEx {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [scriptblock]$Expression,

        [Parameter(ValueFromPipeline)]
        [psobject[]]$InputObject
    )

    Begin {
        $stopWatch = New-Object -TypeName 'System.Diagnostics.Stopwatch'

        <#
            We need to define result as a list because the way objects
            are passed to the pipeline. If you pass a collection of objects,
            the pipeline sends them one by one, and the result
            is always overridden by the last item.
        #>
        [System.Collections.Generic.List[PSObject]]$result = @()
    }

    Process {
        if ($InputObject) {

            # Starting the stopwatch.
            $stopWatch.Start()

            # Creating the '$_' variable.
            $dollarUn = New-Object -TypeName psvariable -ArgumentList @('_', $InputObject)

            <#
                Overload is:
                    InvokeWithContext(
                        Dictionary<string, scriptblock> functionsToDefine,
                        List<psvariable> variablesToDefine,
                        object[] args
                    )
            #>
            $result.AddRange($Expression.InvokeWithContext($null, $dollarUn, $null))

            $stopWatch.Stop()
        }
        else {
            $stopWatch.Start()
            $result.AddRange($Expression.InvokeReturnAsIs())
            $stopWatch.Stop()
        }
    }

    End {
        return [PSCustomObject]@{
            ElapsedTimespan = $stopWatch.Elapsed
            Result = $result
        }
    }
}
```
