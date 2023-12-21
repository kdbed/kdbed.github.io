+++
title = "Kerbrute"
author = ["svejk"]
tags = ["passwordAttack", "AD", "pentest"]
draft = false
+++

## Kerbrute {#kerbrute}

-   based on obtaining a TGT. For example, using kinit on a Linux system, we can obtain and cache a Kerberos TGT. We'll need to provide a username and password to do this. If the credentials are valid, we'll obtain a TGT. The advantage of this technique is that it only uses two UDP frames to determine whether the password is valid, as it sends only an AS-REQ and examines the response.

<!--listend-->

```shell { linenos=true, linenostart=1 }
.\kerbrute_windows_amd64.exe passwordspray -d domain.com .\usernames.txt "Password123!"
```
