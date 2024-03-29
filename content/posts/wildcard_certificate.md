+++
title = "Wildcard Certificate"
author = ["svejk"]
tags = ["cryptography", "web"]
draft = false
+++

## Wildcare Certificates {#wildcare-certificates}

[digicert](https://knowledge.digicert.com/generalinformation/INFO900.html)

What is a SSL Wildcard Certificate?

A SSL/TLS Wildcard certificate is a single certificate with a wildcard character (\*) in the domain name field. This allows the certificate to secure multiple sub domain names (hosts) pertaining to the same base domain.

For example, a wildcard certificate for \*.(domainname).com, could be used for www.(domainname).com, mail.(domainname).com, store.(domainname).com, in addition to any additional sub domain name in the (domainname).com.

When a client checks the sub domain name in this type of certificate, it uses a shell expansion procedure to see if it matches.

What is the difference between a SAN certificate and a Wildcard certificate?
A Subject Alternative Name (SAN) certificate is capable of supporting multiple domains and multiple host names with domains. SANS certificates are more flexible than Wildcard certificates since they are not limited to a single domain.

Combining the functionality of both allows you secure a much broader set of domains along with the capability to use them on any number of sub-domains.

Note: Only non-Wildcard names can be added as SAN.

When should I request a SSL Wildcard Certificate?

A SSL/TLS Wildcard certificate should be considered an option when looking to secure a number of sub domains, such as 'secure.(domainname).com', 'www.(domainname).com', and 'mail.(domainname).com' with a single certificate.

The format of the common name entered for the SSL/TLS Wildcard Certificate will be '\*.(domainname).com'.

How do I add SAN?
SAN is an optional feature available during your Wildcard SSL/TLS purchase, you can add up to an additional 250 SANs to a single certificate.

Note: It is imperative that software documentation is referenced to ensure that the server on which the certificate will be installed on supports wildcard certificates.

Do SSL/TLS Wildcard Certificates work with all servers and browsers?

SSL/TLS Wildcard certificates work with most servers. If unsure, check with your server vendor for further assistance.

Can I share the IP address with all the sub domain names?

Yes. As the same certificate will be used to secure all the sub domain names associated with a domain name, an IP address can be shared amongst all of the sub domain names. SSL/TLS by nature of the protocol is IP based but in this case, where the same certificate will be used by all sub domain names, a Wildcard certificate can be configured for use with name-based virtual hosts instead of IP -based virtual hosts.

Updating licensing is not applicable.

TLS/SSL Wildcard Certificates: Multiple Servers

A TLS/SSL Wildcard certificate secures all the sub domain names associated with a domain name on one server. If multiple servers are involved, the certificate and it's corresponding private key would need to be used on the other servers.

Please Note: The use of one certificate on more than one device can result in increased security risks to networks and that DigiCert expressly disclaims any liability for breaches of security that result from the distribution of a single private key across multiple devices.
