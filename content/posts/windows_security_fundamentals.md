+++
title = "Windows - Security Fundamentals"
author = ["svejk"]
tags = ["windows", "pentest"]
draft = false
+++

## Windows Security {#windows-security}


### PowerShell {#powershell}

-   script execution policy - determines what types of scripts PowerShell can execute. For Windows clients running PowerShell 5.1, the default is Restricted, which blocks all scripts from running unless they are signed with a trusted certificate. Change the execution policy to RemoteSigned - this execution policy allows the user to run unsigned PowerShell scripts if they’re created locally but will not allow us to execute unsigned scripts downloaded in a web browser or attached to emails.
    ```shell { linenos=true, linenostart=1 }
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    ```
