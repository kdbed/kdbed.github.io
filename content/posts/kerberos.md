+++
title = "Kerberos"
author = ["svejk"]
draft = false
+++

## Kerberos {#kerberos}


### Protocol {#protocol}


#### [Kerberos Authentication]({{< relref "kerberos_authentication.md" >}}) {#kerberos-authentication--kerberos-authentication-dot-md}


### Attacking Kerberos {#attacking-kerberos}


#### Overview {#overview}

The main ticket you will receive is a ticket-granting ticket (TGT). These can come in various forms, such as a .kirbi for Rubeus and .ccache for Impacket. A ticket is typically base64 encoded and can be used for multiple attacks.

The ticket-granting ticket is only used to get service tickets from the KDC. When requesting a TGT from the KDC, the user will authenticate with their credentials to the KDC and request a ticket. The server will validate the credentials, create a TGT and encrypt it using the krbtgt key. The encrypted TGT and a session key will be sent to the user.

When the user needs to request a service ticket, they will send the TGT and the session key to the KDC, along with the service principal name (SPN) of the service they wish to access. The KDC will validate the TGT and session key. If they are correct, the KDC will grant the user a service ticket, which can be used to authenticate to the corresponding service.


#### Enumeration and Attacks {#enumeration-and-attacks}

[Kerbrute]({{< relref "kerbrute_enumeration.md" >}}) Enumeration - No domain access required
[Rubeus]({{< relref "rubeus.md" >}}) - Harvesting and Brute-forcing tickets
[Targeted Kerberoast]({{< relref "targeted_kerberoast.md" >}})
[Pass the Ticket (PtT) Attack]({{< relref "pass_the_ticket_ptt_attack.md" >}})  - Access as a user to the domain required
[Kerberoasting]({{< relref "kerberoasting.md" >}})  - Access as any user required
[AS-REP Roasting]({{< relref "as_rep_roasting.md" >}})  - Access as any user required
[Golden Ticket]({{< relref "golden_ticket.md" >}})  - Full domain compromise (domain admin) required
[Silver Ticket]({{< relref "silver_ticket.md" >}})  - Service hash required
[Skeleton Key]({{< relref "pentest_active_directory_skeleton_key.md" >}})  - Full domain compromise (domain admin) required
