+++
title = "PowerShell - Lengh limits AD attributes"
author = ["svejk"]
tags = ["activedirectory", "powershell"]
draft = false
+++

## Determine character limits on AD attributes {#determine-character-limits-on-ad-attributes}

```shell { linenos=true, linenostart=1 }
dsquery * cn=Schema,cn=Configuration,dc=contoso,dc=com -filter "(LDAPDisplayName=department)" -attr rangeUpper
dsquery * cn=Schema,cn=Configuration,dc=contoso,dc=com -filter "(LDAPDisplayName=department)" -attr rangeUpper
```
