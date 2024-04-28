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
