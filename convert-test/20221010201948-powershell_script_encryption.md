---
id: 0a4851af-747e-4284-897c-40de23d7e0fb
title: PowerShell - Script Encryption
---

- <a href="#encrypt-powershell-scripts" id="toc-encrypt-powershell-scripts">Encrypt PowerShell Scripts</a>

# Encrypt [PowerShell](id:86716c7a-447f-4c8f-94ed-87dc6f79f0af) Scripts

Function to obfuscate code containing sensitive data:

``` powershell
function Encrypt-Script($path, $destination) {
    $script = Get-Content $path | Out-String
    $secure = ConvertTo-SecureString $script -asPlainText -force
    $export = $secure | ConvertFrom-SecureString
    Set-Content $destination $export
    "Script '$path' has been encrypted as '$destination'"
}


function Execute-EncryptedScript($path) {
    trap { "Decryption failed"; break }
    $raw = Get-Content $path
    $secure = ConvertTo-SecureString $raw
    $helper = New-Object system.Management.Automation.PSCredential("test", $secure)
    $plain = $helper.GetNetworkCredential().Password
    Invoke-Expression $plain
}
```

From: [idera](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/encrypting-powershell-scripts#)
