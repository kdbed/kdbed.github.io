+++
title = "Targeted Kerberoast"
author = ["Kyle Bednar"]
draft = false
+++

## Targeted Kerberoast {#targeted-kerberoast}

targetedKerberoast is a Python script that can, like many others (e.g. GetUserSPNs.py), print "kerberoast" hashes for user accounts that have a SPN set. This tool brings the following additional feature: for each user without SPNs, it tries to set one (abuse of a write permission on the servicePrincipalName attribute), print the "kerberoast" hash, and delete the temporary SPN set for that operation. This is called targeted Kerberoasting. This tool can be used against all users of a domain, or supplied in a list, or one user supplied in the CLI.

{{< figure src="/images/targetedKerberoast.png" >}}

[thehacker.recipes](https://www.thehacker.recipes/ad/movement/dacl/targeted-kerberoasting)

{{< figure src="/images/targKerb.png" >}}
