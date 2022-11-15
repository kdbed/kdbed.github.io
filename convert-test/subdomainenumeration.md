---
id: cd4b6f4b-7885-4ad0-b29f-0d0e259c38f8
title: Subdomain Enumeration
---

- <a href="#from-dns" id="toc-from-dns">From DNS</a>
- <a href="#wfuzz" id="toc-wfuzz">WFuzz</a>

# From DNS

``` shell
dig +nocmd trick.htb axfr +noall +answer @trick.htb
```

# WFuzz

In case the subdomain has a certain naming convention (Trick/HTB):

``` shell
sed 's/^/preprod-/' subdomains-top1million-110000.txt
```

Then use [wfuzz](id:db68d989-7170-41cd-9d19-fedba535cb75):

``` shell
sudo wfuzz -c -f out -w wordlist -u "http://trick.htb" -H "Host: FUZZ.trick.htb"  --hw 475
```
