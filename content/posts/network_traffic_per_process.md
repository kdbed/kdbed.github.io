+++
title = "Network Traffic per Process"
author = ["svejk"]
draft = false
+++

## Examine network traffic based on PID {#examine-network-traffic-based-on-pid}

Use netsh trace:

```shell { linenos=true, linenostart=1 }
netsh trace start capture=yes traceFile=c:\tracefolder\traceName.etl
...
netsh trace stop
```

Then open the .etl file with NetMon
