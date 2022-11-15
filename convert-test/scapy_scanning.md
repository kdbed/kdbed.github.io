---
id: 91f63959-8c6c-40be-b254-3032417e56e9
title: Active Scanning with Scapy
---

- <a href="#scanning-networks-with-scapy" id="toc-scanning-networks-with-scapy">Scanning Networks with Scapy</a>
- <a href="#port-scan" id="toc-port-scan">Port Scan</a>
  - <a href="#syn-scan" id="toc-syn-scan">SYN Scan</a>
  - <a href="#dns-scan" id="toc-dns-scan">DNS Scan</a>
- <a href="#source" id="toc-source">Source</a>

# Scanning Networks with Scapy

Nmap implements several types of scans and can be used to detect the versions of operating systems and services; it can also perform custom vulnerability scanning. Here we'll implement a couple of simple scans using `scapy` in Python.

- <u>SYN scan</u> : A SYN scan sends a TCP SYN packet to a port and looks for a SYN/ACK packet in response.
- <u>DNS scan</u> : A DNS scan tests whether a DNS server is running on the target system.

`Scapy` makes it easy to create and send custom packets over the network and to sniff network traffic for responses.

# Port Scan

``` python
from scapy.all import *
import ipaddress

ports = [25,80,53,443,445,3306,8080,8443]

<<synscanner>>

<<dnsscanner>>

host = input("Enter IP Address: ")
try:
    ipaddress.ip_address(host)
except:
    print("Invalid address")
    exit(-1)

SynScan(host)
DNSScan(host)
```

## SYN Scan

``` python
def SynScan(host):
    ans,unans = sr(IP(dst=host) /
                   TCP(sport=33333, dport=ports, flags="S")
                   ,timeout=2,verbose=0)
    print("Open ports at %s:" % host)
    for (s,r,) in ans:
        if s[TCP].dport == r[TCP].sport and r[TCP].flags == "SA":
            print(s[TCP].dport)
```

## DNS Scan

``` python
def DNSScan(host):
    ans,unans  = sr(IP(dst=host) /
                    UDP(dport=53) /
                    DNS(rd=1,qd=DNSQR(qname="google.com"))
                    ,timeout=2,verbose=0)
    if ans and ans[UDP]:
        print("DNS Server at %s" % host)
```

# Source

**Python for Cybersecurity** - Howard E Poston
