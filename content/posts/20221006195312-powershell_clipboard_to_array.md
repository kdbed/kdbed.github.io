+++
title = "PowerShell - Clipboard to Array"
author = ["svejk"]
draft = false
+++

```powershell
(Get-Clipboard) -split '\t|\r?\n'
```