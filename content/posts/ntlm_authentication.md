+++
title = "NTLM Authentication"
author = ["svejk"]
tags = ["activeDirectory"]
draft = false
+++

## NTLM Authentication {#ntlm-authentication}


### Process {#process}

1.  I enter my username and password on my local computer.
2.  My computer runs the password I typed through the standard hashing algorithm used by both client machines like mine and the domain controllers (DCs) that provide authentication and authorization services. That gives it my password hash, which it will use in Step 5.
3.  My machine sends the nearest DC a logon request, which includes my username.
4.  The DC sends back a random number, which is known as a logon challenge.
5.  My computer encrypts the logon challenge using the hash of my password and sends the result (response) back. (Now you know why NTLM is called a challenge-response authentication protocol.)
6.  To see whether I provided the correct password, the DC encrypts the logon challenge using the hash of the password that it has on record associated with the username that came in the logon request — which was created using the same hashing algorithm as my client machine is using.
7.  The DC compares the result it gets with the response my computer sent. Since both the DC and my client machine are using the same hashing algorithm and the same encryption process, if the results match, that proves I entered the correct password. In that case, I’m authenticated.

Note that during this NTLM authentication process, neither my password or its hash ever got sent across the network. For further security, all of these communications are encrypted using a shared secret key, which is my computer’s domain password.

{{< figure src="/images/ntlm.png" >}}
