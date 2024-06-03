+++
title = "Hashing Vs Encryption"
author = ["svejk"]
tags = ["cryptography"]
draft = false
+++

## The difference between hashing and encryption {#the-difference-between-hashing-and-encryption}

The difference betwen hashing and encryption determines how likely an exposed password can be abused after a breach. Hashing is such that it can't be directly reversed (hash --&gt; plaintext), but the plaintext can be guessed by hashing a large number of candidates and comparing the results. Password hashing is one-way and deterministic. This means that sites that store hashes never actually keep the password, but re-hashing at logon provides a reliable point of comparison.

Hashing a password - md5 hash, which always produces output of 32 chars:

```shell { linenos=true, linenostart=1 }
echo -n P@ssw0rd | md5sum
```

```text
161ebd7d45089b3446ee4e0d86dbcf92  -
```

If the data needs to be used in its original format (ie needs to not be one-way), encryption is used. Passwords are unique in lacking this requirement. Password hashes are predictable, however, so a unique salt of random characters can be added to the beginning. The salt and the hashed password both get stored for later comparison to input. Even if the database is dumped, this then forces the attacker to take a password list and perform hashing with each salt prepended. This doesn't present much of a problem with MD5 or SHA-1, but if a hashing algorithm designed for passwords is used, eg bcrypt, the story is different.


### Source: [troyhunt](https://www.troyhunt.com/we-didnt-encrypt-your-password-we-hashed-it-heres-what-that-means/) {#source-troyhunt}
