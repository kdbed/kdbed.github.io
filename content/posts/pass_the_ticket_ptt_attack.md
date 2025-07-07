+++
title = "Pass the Ticket (PtT) Attack"
author = ["svejk"]
tags = ["activeDirectory", "kerberos"]
draft = false
+++

## Pass the Ticket {#pass-the-ticket}

Pass the ticket works by dumping the TGT from the LSASS memory of the machine. The Local Security Authority Subsystem Service (LSASS) is a memory process that stores credentials on an active directory server and can store Kerberos ticket along with other credential types to act as the gatekeeper and accept or reject the credentials provided. You can dump the Kerberos Tickets from the LSASS memory just like you can dump hashes. When you dump the tickets with mimikatz it will give us a .kirbi ticket which can be used to gain domain admin if a domain admin ticket is in the LSASS memory. This attack is great for privilege escalation and lateral movement if there are unsecured domain service account tickets laying around. The attack allows you to escalate to domain admin if you dump a domain admin's ticket and then impersonate that ticket using mimikatz PTT attack allowing you to act as that domain admin. You can think of a pass the ticket attack like reusing an existing ticket were not creating or destroying any tickets here were simply reusing an existing ticket from another user on the domain and impersonating that ticket.


### [Mimikatz]({{< relref "mimikatz.md" >}}) {#mimikatz--mimikatz-dot-md}

```shell
mimikatz.exe
privilege::debug
sekurlsa::tickets /export
kerberos:ptt [0;131415]-2-0-40e10000-Administrator@krbtgt-CONTROLLER.LOCAL.kirbi
```


### Mitigation {#mitigation}

Don't let your domain admins log onto anything except the domain controller - This is something so simple however a lot of domain admins still log onto low-level computers leaving tickets around that we can use to attack and move laterally with.
