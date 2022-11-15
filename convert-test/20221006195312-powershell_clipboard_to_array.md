---
id: f70f9db9-268a-4e16-a8cd-cb6d7636ec1b
title: PowerShell - Clipboard to Array
---

``` powershell
(Get-Clipboard) -split '\t|\r?\n'
```
