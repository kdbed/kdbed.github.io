+++
title = "PowerShell - Add a calculated property in Select-Object"
author = ["svejk"]
draft = false
+++

## Calculated Property in Select-Object {#calculated-property-in-select-object}

The proper syntax for forming the hash table:

```sh { linenos=true, linenostart=1 }
Get-Service | Select-Object -Property @{Name = 'Name'; Expression = {$_.Name}}
```
