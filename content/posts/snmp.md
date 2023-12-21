+++
title = "SNMP"
author = ["svejk"]
draft = false
+++

## SNMP {#snmp}

The SNMP Management Information Base (MIB) is a database containing information usually related to network management. The database is organized like a tree, with branches that represent different organizations or network functions. The leaves of the tree (or final endpoints) correspond to specific variable values that can then be accessed and probed by an external user.


### Enumeration {#enumeration}

-   Nmap: `sudo nmap -sU --open -p 161 192.168.50.1-254 -oG open-snmp.txt`
-   _onesixtyone_
-   _snmpcheck_
