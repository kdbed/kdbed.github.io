+++
title = "Recon - Port Scanning and nmap"
author = ["svejk"]
tags = ["infosec", "nmap", "pentest"]
draft = false
+++

## Basic nmap scan {#basic-nmap-scan}

```sh
nmap -sC -sV -oA nmap/result <ip>
```

Flags:

-   `-oA <basename>: Output in the three major formats at once`
-   `-sV: Probe open ports to determine service/version info`
-   `-sC: default scripts`
