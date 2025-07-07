+++
title = "Rubeus"
author = ["svejk"]
tags = ["pentest", "activeDirectory", "kerberos"]
draft = false
+++

## Rubeus {#rubeus}


### Harvesting and Brute-forcing tickets {#harvesting-and-brute-forcing-tickets}

Rubeus has a wide variety of attacks and features that allow it to be a very versatile tool for attacking Kerberos. Just some of the many tools and attacks include overpass the hash, ticket requests and renewals, ticket management, ticket extraction, harvesting, pass the ticket, AS-REP Roasting, and Kerberoasting.

[GhostPack](https://github.com/GhostPack/Rubeus)

-   Harvest TGTs every 30 seconds: `Rubeus.exe harvest /interval:30`
-   Password spray against found users and provide a `.kirbi` TGT for that user: `Rubeus.exe brute /password:Password1 /noticket`
