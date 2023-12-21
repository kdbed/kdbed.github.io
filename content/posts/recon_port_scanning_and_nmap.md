+++
title = "Recon - Port Scanning and Nmap"
author = ["svejk"]
tags = ["infosec", "nmap", "pentest"]
draft = false
+++

## Nmap scanning {#nmap-scanning}


### SYN (stealth) scan {#syn--stealth--scan}

TCP handshake not completed (ACK not sent)

```shell { linenos=true, linenostart=1 }
nmap -sS <ip>
```

Because the three-way handshake is never completed, the information is not passed to the application layer and as a result, will not appear in any application logs. A SYN scan is also faster and more efficient because fewer packets are sent and received.


### TCP Connect Scan {#tcp-connect-scan}

```shell { linenos=true, linenostart=1 }
nmap -sT <ip>
```


### TCP SYN Scan and UDP Scan {#tcp-syn-scan-and-udp-scan}

```shell { linenos=true, linenostart=1 }
nmap -sU -sS 192.168.2.1
```


### Ping sweep with greppable output {#ping-sweep-with-greppable-output}

```shell { linenos=true, linenostart=1 }
nmap -v -sn 192.168.100.1-253 -oG sweep.txt
grep Up sweep.txt | cut -d " " -f 2
```


### --top-ports=10 {#top-ports-10}

Option defined in `/usr/share/nmap/nmap-services`


### Other scans {#other-scans}

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


## Windows {#windows}

```shell { linenos=true, linenostart=1 }
1..1024 | % {echo ((New-Object Net.Sockets.TcpClient).Connect("192.168.2.1", $_)) "TCP port $_ is open"} 2>$null
```
