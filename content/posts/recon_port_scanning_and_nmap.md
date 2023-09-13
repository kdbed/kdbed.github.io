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

Full TCP:

```sh
nmap -sV -sC -p- -o nmap.out -vvv $RHOST
```


### UDP Scan {#udp-scan}

```sh
sudo nmap -sU -sS -sC -sV -oA <NAME>.udp <IP> -v
```

```sh
nmap -sU --top-ports 20 -o nmap-udp.out -vvv $RHOST
```


### Script categories {#script-categories}

```sh
nmap --script vuln,safe,discovery -oN scan.txt target-ip
```


### List available nse scripts {#list-available-nse-scripts}

```sh
ls -lh /usr/share/nmap/scripts/
```


### nmap through socks4 proxy {#nmap-through-socks4-proxy}

```sh
nmap --proxies socks4://proxy-ip:1080 target-ip
```


### ftp bounce scan {#ftp-bounce-scan}

```sh
nmap -P0 -n -b username:password@target-ip target2-ip --proxies socks4://proxy-ip:1080 -vvv
```


### format {#format}

```sh
ports=$(nmap -p- -Pn --min-rate=1000 -T4 10.10.11.205 | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -p$ports -Pn -sC -sV 10.10.11.205
```


## nmap Automator {#nmap-automator}

```sh
nmapAutomator <IP> All
```
