+++
title = "Subdomain Enumeration"
author = ["svejk"]
tags = ["subdomain", "enumeration", "pentest"]
draft = false
+++

## From DNS {#from-dns}

```shell
dig +nocmd trick.htb axfr +noall +answer @trick.htb
```


## WFuzz {#wfuzz}

In case the subdomain has a certain naming convention (Trick/HTB):

```shell
sed 's/^/preprod-/' subdomains-top1million-110000.txt
```

Then use [wfuzz]({{< relref "wfuzz.md" >}}):

```shell
sudo wfuzz -c -f out -w wordlist -u "http://trick.htb" -H "Host: FUZZ.trick.htb"  --hw 475
```


## gobuster {#gobuster}


### DNS {#dns}

```shell { linenos=true, linenostart=1 }
gobuster dns -d domain.com -w $wordlists/subdomains-top1million-110000.txt -t 20
```


### vhost {#vhost}

```shell { linenos=true, linenostart=1 }
gobuster vhost -u domain.com -w <wordlist>
```
