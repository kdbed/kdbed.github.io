+++
title = "PowerShell - Writing cmdlets in C#"
author = ["svejk"]
tags = ["cmdlet", "csharp", "powershell"]
draft = false
+++

## Writing [powershell]({{< relref "powershell.md" >}}) cmdlets in C# {#writing-powershell--powershell-dot-md--cmdlets-in-c}

source: [dotnetninja](https://dotnetninja.net/2020/03/creating-a-powershell-cmdlet-in-c/)


### Overview {#overview}

create a new class that derives from one of two base classes (Cmdlet or PsCmdlet), add properties to the class to accept your parameters, override one or more methods in the base class to provide your functionality, and decorate the class and properties with a few attributes.


### cmdlet name {#cmdlet-name}

all defined in constants in the C# reference library

<span class="underline">VerbsCommon</span>: Add, Clear, Close, Copy, Enter, Exit, Find, Format, Get, Hide, Join, Lock, Move, New, Open, Optimize, Pop, Push, Redo, Remove, Rename, Reset, Resize, Search, Select, Set, Show, Skip, Split, Step, Switch, Undo, Unlock, Watch

<span class="underline">VerbsCommunications</span>: Connect, Disconnect, Read, Receive, Send, Write

<span class="underline">VerbsData</span>: Backup, Checkpoint, Compare, Compress, Convert, ConvertFrom, ConvertTo, Dismount, Edit, Expand, Export, Group, Import, Initialize, Limit, Merge, Mount, Out, Publish, Restore, Save, Sync, Unpublish, Update

<span class="underline">VerbsDiagnostic</span>: Debug, Measure, Ping, Repair, Resolve, Test, Trace

<span class="underline">VerbsLifecycle</span>: Approve, Assert, Complete, Confirm, Deny, Disable, Enable, Install, Invoke, Register, Request, Restart, Resume, Start, Stop, Submit, Suspend, Uninstall, Unregister, Wait

<span class="underline">VerbsOther</span>: Use

<span class="underline">VerbsSecurity</span>: Block, Grant, Protect, Revoke, Unblock, Unprotect
