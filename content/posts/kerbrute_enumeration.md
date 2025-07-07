+++
title = "Kerbrute"
author = ["svejk"]
tags = ["kerberos", "passwordAttack", "AD", "pentest"]
draft = false
+++

## Kerbrute {#kerbrute}

-   Kerbrute is a popular enumeration tool used to brute-force and enumerate valid active-directory users by abusing the Kerberos pre-authentication.
-   based on obtaining a TGT. For example, using kinit on a Linux system, we can obtain and cache a Kerberos TGT. We'll need to provide a username and password to do this. If the credentials are valid, we'll obtain a TGT. The advantage of this technique is that it only uses two UDP frames to determine whether the password is valid, as it sends only an AS-REQ and examines the response. By brute-forcing Kerberos pre-authentication, you do not trigger the account failed to log on event which can throw up red flags to blue teams.


### Kerberos Pre-Authentication Behavior {#kerberos-pre-authentication-behavior}

Kerberos authentication starts with an AS-REQ (Authentication Service Request) sent to the Key Distribution Center (KDC), which is typically the domain controller.

When a valid username is submitted:

The KDC responds with an error indicating that pre-authentication is required (error code: KRB5KDC_ERR_PREAUTH_REQUIRED / 0x19).

When an invalid username is submitted:

The KDC responds with an error indicating that the principal (user) is unknown (error code: KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN / 0x6).


### Tool {#tool}

-   [ropnop/kerbrute](https://github.com/ropnop/kerbrute/releases)


#### User Enumeration {#user-enumeration}

```shell { linenos=true, linenostart=1 }
./kerbrute userenum --dc CONTROLLER.local -d CONTROLLER.local User.txt
```

{{< figure src="/images/kerbrute.jpg" >}}

```shell { linenos=true, linenostart=1 }
.\kerbrute_windows_amd64.exe passwordspray -d domain.com .\usernames.txt "Password123!"
```
