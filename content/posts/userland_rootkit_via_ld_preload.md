+++
title = "Userland Rootkit via LD_PRELOAD"
author = ["Kyle Bednar"]
draft = false
+++

## Userland Rootkit via LD_PRELOAD {#userland-rootkit-via-ld-preload}


## Overview {#overview}

This challenge demonstrated a userland rootkit leveraging the dynamic linker (ld-linux) and LD_PRELOAD to manipulate program behavior without modifying the kernel.

The rootkit:

Injected a malicious shared library into all dynamically linked binaries
Hooked libc functions (e.g., `readdir`, `fopen`)
Hid files/directories by filtering results in userspace

This resulted in:

Missing directories despite known existence
Abnormal library loading behavior in SSH
Key Indicators of Compromise (IOCs)

1.  Suspicious library in ldd output

<!--listend-->

```bash
ldd /usr/sbin/sshd
```

Finding:

```text
/lib/x86_64-linux-gnu/libc.hook.so.6
```

→ This is not a legitimate glibc component.

1.  Global preload configuration

<!--listend-->

```bash
cat /etc/ld.so.preload
```

Output:

```text
/lib/x86_64-linux-gnu/libc.hook.so.6
```

→ Confirms system-wide injection into all dynamic binaries.

1.  Inconsistent filesystem visibility

Directories known to exist appeared empty
Tools like `ls` and `find` returned incomplete results
Rootkit Mechanism (How It Works)

Dynamic linker abuse

Linux uses `ld-linux.so` to load shared libraries at runtime
`LD_PRELOAD` allows forcing a library to load before others

Effect:

Attacker’s library overrides libc functions

Function hooking via symbol interposition

Example pattern (inferred from binary):

```c
struct dirent *readdir(DIR *dirp) {
static struct dirent *(*orig_readdir)(DIR *) = NULL;
if (!orig_readdir)
orig_readdir = dlsym(RTLD_NEXT, "readdir");

struct dirent *entry;
while ((entry = orig_readdir(dirp)) != NULL) {
    if (strstr(entry->d_name, "pr3l04d_"))
        continue; // hide entry
    return entry;
}
return NULL;

}
```

Observed hooks from binary strings

`readdir`
`readdir64`
`fopen`
`strcmp`
`strstr`
`dlsym`
Why Files “Disappear”

Tools like:

`ls`
`find`
`du`

…all rely on libc functions such as:

`readdir`
`getdents`

Since these were hooked:
→ Output was filtered before reaching the user

Important insight:
The filesystem was never altered — only its representation.

Investigation Methodology

Step 1: Detect abnormal linking

```bash
ldd /usr/sbin/sshd
```

Look for:

Unexpected libraries
Non-standard paths
Suspicious naming (e.g., .hook.so)

Step 2: Check preload configuration

```bash
cat /etc/ld.so.preload
```

This is the most common persistence mechanism.

Step 3: Inspect binary strings (without tools)

```bash
xxd libc.hook.so.6
```

Extracted key clue:

```text
pr3l04d_
```

Step 4: Attempt clean execution environment

```bash
env -i LD_PRELOAD= /bin/ls /
```

Goal:

Run binaries without injected library

Step 5: Identify hiding logic
From strings:

Presence of `strstr` → substring filtering
Presence of token `pr3l04d_` → hide rule

Step 6: Disable rootkit (CTF context)

```bash
mv /etc/ld.so.preload /etc/ld.so.preload.disabled
```

This removes global injection.

Step 7: Enumerate filesystem normally

```bash
/bin/find / -maxdepth 4 2>/dev/null
```

Rootkit Behavior Summary
Component	Behavior
Injection	/etc/ld.so.preload
Technique	LD_PRELOAD
Scope	All dynamic binaries
Hooks	readdir, fopen
Filtering	substring match (strstr)
Hidden token	pr3l04d\_
Effect	Invisible files/directories
Flag Discovery

After disabling the rootkit:

```bash
ls /var
```

Revealed hidden directory:

```text
/var/pr3l04d_/
```

Flag location:

```text
/var/pr3l04d_/flag.txt
```

Key Takeaways

1.  Userland rootkits manipulate perception, not data

Files are still present on disk
Only user-facing tools are deceived

1.  LD_PRELOAD is extremely powerful

Requires no kernel access
Affects nearly all user-space programs
Easy to deploy, hard to notice

1.  ldd is a high-value forensic tool

Quickly exposes injected libraries
Often the fastest detection method

1.  Dynamic vs static binaries

Dynamic binaries → vulnerable to hooking
Static binaries → bypass userland rootkits

1.  Strings analysis can reveal logic

Even without `strings`:

`xxd` + manual inspection is sufficient
Look for:
function names
suspicious tokens
filtering logic

1.  Always question missing data

“Directory doesn’t exist” can mean:

corrupted filesystem ❌
permissions issue ❌
userland filtering ✅
Detection in Real Environments

Indicators

Presence of /etc/ld.so.preload
Unexpected shared libraries
Inconsistent output between tools
Suspicious .so files in system paths

Detection techniques

```bash
ldd /bin/ls
cat /etc/ld.so.preload
cat /proc/*/maps | grep '.so'
```

Defensive Mitigations
Monitor /etc/ld.so.preload integrity
Use file integrity monitoring (FIM)
Restrict write access to system library paths
Use EDR to detect anomalous library injection
Prefer statically linked tools for IR
Conceptual Summary

This challenge is a textbook example of:

Userland Rootkit =

Function hooking
Dynamic linker abuse
Data visibility manipulation

Not:

Kernel compromise
Disk tampering
Traditional malware persistence
Related Concepts
LD_PRELOAD attacks
Shared object injection
Symbol interposition
Runtime hooking
Linux dynamic linking internals
Final Insight

The system wasn’t lying — the interface to it was.

Understanding that distinction is the difference between:

chasing nonexistent corruption
and identifying deliberate deception

[infosecwriteups](https://infosecwriteups.com/a-gentle-introduction-to-function-hooking-using-ld-preload-1714124a6eb9)
