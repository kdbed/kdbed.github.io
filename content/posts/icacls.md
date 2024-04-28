+++
title = "icacls"
author = ["svejk"]
tags = ["permissions", "windows"]
draft = false
+++

## icacls {#icacls}


### Propagate a single {#propagate-a-single}

Suppose we need to push a single ACE through subdirectories:

```shell
icacls "X:\PATH\TO\FOLDER\" /grant DOMAIN\group:(f) /t
```


### MS {#ms}

[learn.microsoft](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc753525(v=ws.11)?redirectedfrom=MSDN)
