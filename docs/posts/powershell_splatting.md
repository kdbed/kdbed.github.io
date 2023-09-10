+++
title = "PowerShell - Splatting"
author = ["svejk"]
tags = ["powerShell"]
draft = false
+++

## Splatting in [powershell]({{< relref "powershell.md" >}}) {#splatting-in-powershell--powershell-dot-md}

Splatting allows one to format and send arguments to cmdlets and
functions. Typically use dash+parameter name+argument

```powershell
  Copy-Item -Path "Testfile.txt" -Destination "CopiedFile.txt" -WhatIf -force -Recurse
```

```powershell
  Copy-Item `
      -Path "Testfile.txt" `
      -Destination "CopiedFile.txt" `
      -WhatIf `
      -force `
```

Instead you can `splat` a parameter set. First create a hashtable
containing key/value pairs of each parameter and parameter argument.
Then pass that set of parameters to the command with `@<hashtablename>`

```powershell
  $Params = @{
      "Path" = "Testfile.txt"
      "Destination" = "CopiedFile.txt"
      "WhatIf" = $true
      "force" = $true
      "Recurse" = $true
  }

  Copy-Item @Params
```

```powershell
  $Params = @{
    "Path"        = "TestFile.txt"
    "Destination" = "CopiedFile.txt"
  }

  Copy-Item @Params -Force -WhatIf
```

In Powershell 7.1, you can override splatted parameters:

```powershell
  $Params = @{
    "Path"        = "TestFile.txt"
    "Destination" = "CopiedFile.txt"
    "WhatIf"      = $True
    "Force"       = $True
  }

  Copy-Item @Params -WhatIf:$False
```

For positional parameters, `splat` an array:

```powershell
  $ParamArray = @(
    "TestFile.txt"
    "CopiedFile.txt"
  )

  Copy-Item @ParamArray
```

Proxy Functions and Splatted Commands : these functions allow you to add
additional parameters to the original cmdlet and then call that cmdlet
with the new parameters. When you run a function in PowerShell,
PowerShell creates an automatic array variable called $Args. This array
contains all unnamed parameter values passed to that function.

You'll find another automatic variable called $PSBoundParameters which
contains a hashtable of all bound parameters. Notice below the
Test-Function function that returns the $Param1 and $Param2 parameters.

```powershell
  Function Test-Function {
    Param(
      $Param1,
      $Param2

      )
    Write-Host "Unnamed Parameters" -ForegroundColor 'Green'
    $Args

    Write-Host "Bound Parameters" -ForegroundColor 'Green'
    $PSBoundParameters
  }

  Test-Function "test1" "test2" "test3" -Param1 "testParam" -Param2 "testParam2"
```

```text
  Unnamed Parameters
  test1
  test2
  test3
  Bound Parameters

  Key    Value
  ---    -----
  Param1 testParam
  Param2 testParam2

```


### Building a Wrapper Function using Splatted Parameters\* To show how {#building-a-wrapper-function-using-splatted-parameters-to-show-how}

useful splatting can be in wrapper functions, create a custom function
that passes unnamed parameters and named parameters to the Copy-Item
cmdlet. With this technique, you can quickly create custom functions
that add additional functionality but retain the same parameter set you
would expect.

```powershell
  Function Copy-CustomItem {
    Get-ChildItem

    Copy-Item @Args @PSBoundParameters

    Get-ChildItem
  }

  Copy-CustomItem "TestFile.txt" "CopiedFile.txt" -force -verbose
```
