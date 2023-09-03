+++
title = "PowerShell - Regex - string between two strings"
author = ["svejk"]
draft = false
+++

## Regex - string between two strings {#regex-string-between-two-strings}

```shell { linenos=true, linenostart=1 }
function GetStringBetweenTwoStrings($firstString, $secondString, $importPath){

    #Get content from file
    $file = gc -raw $importPath

    #Regex pattern to compare two strings
    $pattern = '$firstString(.*?)$secondString'

    #Perform the opperation
    $result = [regex]::Match($file,$pattern).Groups[1].Value

    #Return result
    write-host $result

}
```
