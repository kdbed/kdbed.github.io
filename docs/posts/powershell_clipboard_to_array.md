+++
title = "PowerShell - Clipboard to Array"
author = ["svejk"]
tags = ["powerShell"]
draft = false
+++

```powershell
(Get-Clipboard) -split '\t|\r?\n'
```
