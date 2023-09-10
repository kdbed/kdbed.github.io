+++
title = "DLL Hijacking"
author = ["kdb"]
tags = ["privesc", "exploit", "windowsExploitation"]
draft = false
+++

## Basic Ideas {#basic-ideas}

Windows DLL hijacking occurs when a trusted or legitimate application is tricked into loading an arbitrary DLL.  Dll hijacking can be used to execute code, obtain persistence and escalate privileges, although privilege escalation is the least likely.  [hackTricks](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation/dll-hijacking)


### Approaches {#approaches}

There are different approaches to DLL hijacking, and success will be determined by how the application is set to load its DLLs.

1.
