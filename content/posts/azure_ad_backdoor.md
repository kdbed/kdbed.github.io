+++
title = "Pentest - Azure AD"
author = ["svejk"]
tags = ["entra", "azure", "pentest"]
draft = false
+++

## Basic Recon {#basic-recon}

Detect M365 usage: `https://login.microsoftonline.com/getuserrealm.srf?login=test@acmecorp.com&xml=1`
Tenant ID: `https://login.microsoftonline.com/<target domain>/v2.0/.well-known/openid-configuration`
User enumeration: `https://login.Microsoft.com/common/oauth2/token`
Detect invalid users while password spraying with: [MSOLSpray](https://github.com/dafthack/MSOLSpray)
Enumerate users via OneDrive: [onedrive_user_enum](https://github.com/nyxgeek/onedrive_user_enum)
Data in public Azure blobs:

-   storage-acct-name.blob.core.windows.net
-   storage-acct-name.file.core.windows.net
-   storage-acct-name.table.core.windows.net
-   storage-acct-name.queue.core.windows.net

Cloud_enum - Chris Moberly [clound_enum](https://github.com/initstring/cloud_enum)
Azure Smart Lockout - protection from pw spray; bypass with FireProx + MSOLSpray [fireprox](https://github.com/ustayready/fireprox)


## Authentication {#authentication}

-   Forms of auth: Password hash synchronization; pass through authentication; Active Directory Federation Services (ADFS); certificate-based auth; conditional access policies; long-term access tokens; legacy authentication portals
-   If CAP applies to Device Platforms, it only reads user-agent string - easily spoofed
-   Find gaps in CAP - [dafthack/MFASweep](https://github.com/dafthack/MFASweep)


## User Account Enumeration {#user-account-enumeration}

[chronlund](https://danielchronlund.com/2020/03/13/automatic-azure-ad-user-account-enumeration-with-powershell-scary-stuff/)


## Password Spray Attacks with PowerShell {#password-spray-attacks-with-powershell}

[chronlund](https://danielchronlund.com/2020/03/17/azure-ad-password-spray-attacks-with-powershell-and-how-to-defend-your-tenant/)


## Conditional Access as Code {#conditional-access-as-code}

[chronlund](https://danielchronlund.com/2020/11/25/how-to-manage-conditional-access-as-code-the-ultimate-guide/)


## Breach Response {#breach-response}

[chronlund](https://danielchronlund.com/2021/03/29/my-azure-ad-has-been-breached-what-now/)


## PIM Roles - PowerShell {#pim-roles-powershell}

[chronlund](https://danielchronlund.com/2021/09/17/activate-your-azure-ad-pim-roles-with-powershell/)


## CAP - Priv Workstation for GA {#cap-priv-workstation-for-ga}

[chronlund](https://danielchronlund.com/2021/11/02/require-privileged-workstation-for-admin-access-with-conditional-access/)


## Tenant Enum with B2B guest accounts {#tenant-enum-with-b2b-guest-accounts}

[chronlund](https://danielchronlund.com/2021/11/18/scary-azure-ad-tenant-enumeration-using-regular-b2b-guest-accounts/)


## Mapping Tenant {#mapping-tenant}

[chronlund](https://danielchronlund.com/2021/11/23/how-to-find-valuable-targets-in-an-azure-ad-tenant-by-mapping-the-entire-organisation/)


## Attack CAP {#attack-cap}

[chronlund](https://danielchronlund.com/2022/01/07/the-attackers-guide-to-azure-ad-conditional-access/)


## 365 Data Exfil {#365-data-exfil}

[chronlund](https://danielchronlund.com/2023/02/09/microsoft-365-data-exfiltration-attack-and-defend/)


## Incident Response {#incident-response}

[hunters](https://www.hunters.security/en/blog/human-friendly-guide-incident-response-microsoft-and-threat-hunting-azure-1)


## Protect Identities {#protect-identities}

[cloudcoffee](https://www.cloudcoffee.ch/microsoft-azure/microsoft-entra-id-protection-protect-identities-detect-risks-and-mitigate-threats/)


## Risky User Report {#risky-user-report}

[office365itpros](https://office365itpros.com/2023/08/16/entra-id-risky-users/)


## Create Backdoor in AAD {#create-backdoor-in-aad}

[aadinternals](https://aadinternals.com/post/aadbackdoor/)

AADInternals PowerShell module:

[module](https://aadinternals.com/aadinternals/)


## Tokens {#tokens}

[Microsoft - Protecting Tokens](https://learn.microsoft.com/en-us/entra/identity/devices/protecting-tokens-microsoft-entra-id)

[Token Theft - Red Team (TrustedSec)](https://trustedsec.com/blog/weaponization-of-token-theft-a-red-team-perspective)

[pwnauth](https://cloud.google.com/blog/topics/threat-intelligence/shining-a-light-on-oauth-abuse-with-pwnauth/)

[AlteredSecurity-365Stealer](https://github.com/AlteredSecurity/365-Stealer)

[github](https://github.com/mandiant/PwnAuth)

[trustedsec](https://trustedsec.com/blog/hacking-your-cloud-tokens-edition-2-0)

Token Tactics: [github](https://github.com/f-bader/TokenTacticsV2)


## Skeleton Key {#skeleton-key}

[varonis](https://www.varonis.com/blog/azure-skeleton-key)


## AD Connect {#ad-connect}

[sygnia](https://www.sygnia.co/blog/guarding-the-bridge-new-attack-vectors-in-azure-ad-connect/)


## Azure MFA Bypass {#azure-mfa-bypass}

[oasis](https://www.oasis.security/resources/blog/oasis-security-research-team-discovers-microsoft-azure-mfa-bypass)


## DC Toolbox {#dc-toolbox}

[Chronlund](https://github.com/DanielChronlund/DCToolbox)


## Graphrunner: [https://github.com/dafthack/GraphRunner](https://github.com/dafthack/GraphRunner) {#graphrunner-https-github-dot-com-dafthack-graphrunner}
