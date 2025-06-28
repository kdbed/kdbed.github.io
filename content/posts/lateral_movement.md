+++
title = "Lateral Movement"
author = ["svejk"]
tags = ["pivoting", "pentest"]
draft = false
+++

## Lateral Movement {#lateral-movement}

The adversary is trying to move through your environment.

Lateral Movement consists of techniques that adversaries use to enter and control remote systems on a network. Following through on their primary objective often requires exploring the network to find their target and subsequently gaining access to it. Reaching their objective often involves pivoting through multiple systems and accounts to gain. Adversaries might install their own remote access tools to accomplish Lateral Movement or use legitimate credentials with native network and operating system tools, which may be stealthier.

-   MITRE [attack.mitre](https://attack.mitre.org/tactics/TA0008/)


### Port Forwarding - SSH {#port-forwarding-ssh}


#### local port forwarding {#local-port-forwarding}

```sh
ssh -L local_port:destination_server_ip:remote_port ssh_server_hostname
```


## Ligolo-ng {#ligolo-ng}

[nicocha30](https://github.com/nicocha30/ligolo-ng)
[hackingarticles](https://www.hackingarticles.in/a-detailed-guide-on-ligolo-ng/)
