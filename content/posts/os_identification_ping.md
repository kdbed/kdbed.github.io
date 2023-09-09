+++
title = "OS Identification - Ping"
author = ["svejk"]
draft = false
+++

## [IP Time to Live (TTL)]({{< relref "ip_time_to_live_ttl.md" >}}) on the ICMP packets {#ip-time-to-live--ttl----ip-time-to-live-ttl-dot-md--on-the-icmp-packets}

The default TTL on windows is 128, which gets decremented by one at the router between the host and the box to 127. On the other hand the default for Linux is typically 64, so expect to see 63 for a Linux host.

{{< figure src="/images/icmp.png" >}}
