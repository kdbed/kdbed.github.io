+++
title = "lastLogon vs lastLogonTimestamp"
author = ["svejk"]
tags = ["kerberos", "activeDirectory"]
draft = false
+++

## lastLogon vs lastLogonTimestamp {#lastlogon-vs-lastlogontimestamp}

If you ask for types of situations, then any logon event updates the lastlogontimestamp, but only some of them update lastlogon attribute.

There are certain types of events that only emulate the logon without using the actual username and password that update only the lastlogon attribute.


### Kerberos S4u2Self {#kerberos-s4u2self}

[How LastLogonTimeStamp is Updated with Kerberos S4u2Self](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/how-lastlogontimestamp-is-updated-with-kerberos-s4u2self/ba-p/257135)
[S4U2self](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-sfu/02636893-7a1f-4357-af9a-b672e3e3de13)
