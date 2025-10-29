+++
title = "Kerberoasting"
author = ["svejk"]
tags = ["activeDirectory", "kerberos"]
draft = false
+++

## Kerberoasting {#kerberoasting}

Kerberoasting allows a user to request a service ticket for any service with a registered SPN then use that ticket to crack the service password.

When a privileged domain account is configured to run a service in the environment, such as MS SQL, a Service Principal Name (SPN) is assigned in the domain to associate the service with that interactive service account. However, it’s important to remember that many service accounts historically have too many administrative rights. Every least privileged user who wants to use that specific resource receives a Kerberos ticket signed with an NTLM hash of the privileged account that is running the service.

This inherently creates a vulnerability, and a malicious actor could then take the Kerberos ticket offline onto his/her attacking machine that utilizes password cracking methods such as brute force, rainbow tables, etc., until the correct service account password is discovered. From there, the attacker can utilize that service account’s cleartext password to move laterally throughout the entire network.


### Rubeus {#rubeus}

```shell { linenos=true, linenostart=1 }
Rubeus.exe kerberoast
```

Then crack the hashes with hashcat

```shell { linenos=true, linenostart=1 }
hashcat -m 13100 -a 0 hash.txt Pass.txt
```


### Impacket {#impacket}

```shell { linenos=true, linenostart=1 }
sudo python3 GetUserSPNs.py controller.local/Machine1:Password1 -dc-ip 10.10.239.179 -request
```
