+++
title = "Hashing Vs Encryption"
author = ["svejk"]
tags = ["cryptography"]
draft = false
+++

## The difference between hashing and encryption {#the-difference-between-hashing-and-encryption}

The difference betwen hashing and encryption determines how likely an exposed password can be abused after a breach. Hashing is such that it can't be directly reversed (hash --&gt; plaintext), but the plaintext can be guessed by hashing a large number of candidates and comparing the results. Password hashing is one-way and deterministic. This means that sites that store hashes never actually keep the password, but re-hashing at logon provides a reliable point of comparison.


### Source: [troyhunt](https://www.troyhunt.com/we-didnt-encrypt-your-password-we-hashed-it-heres-what-that-means/) {#source-troyhunt}
