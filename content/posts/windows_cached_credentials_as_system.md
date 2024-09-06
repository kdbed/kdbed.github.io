+++
title = "Windows - Cached Credentials as SYSTEM"
author = ["svejk"]
draft = false
+++

## Credentials cached as SYSTEM {#credentials-cached-as-system}

Cached Passwords - SYSTEM

There are passwords that can be stored in the SYSTEM context that can't be seen in the normal Credential Manager view.

Download `PsExec.exe` from Technet and copy it to `C:\Windows\System32`.

From a command prompt run:    `psexec -i -s -d cmd.exe`.

From the new DOS window run:  `rundll32 keymgr.dll,KRShowKeyMgr`

Remove any items that appear in the list of Stored User Names and Passwords.  Restart the computer.
