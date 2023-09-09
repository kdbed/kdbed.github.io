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


### UDP Scan {#udp-scan}

```sh
sudo nmap -sU -sS -sC -sV -oA <NAME>.udp <IP> -v
```


### Script categories {#script-categories}


### List available nse scripts {#list-available-nse-scripts}


### nmap through socks4 proxy {#nmap-through-socks4-proxy}


### ftp bounce scan {#ftp-bounce-scan}


### format {#format}

```sh
ports=$(nmap -p- -Pn --min-rate=1000 -T4 10.10.11.205 | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -p$ports -Pn -sC -sV 10.10.11.205
```


## nmap Automator {#nmap-automator}
