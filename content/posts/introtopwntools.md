+++
title = "Intro to Pwntools - TryHackMe"
author = ["svejk"]
draft = false
+++

## Intro to Pwntools {#intro-to-pwntools}

Source materials here [dizmascyberlabs
](https://github.com/dizmascyberlabs/IntroToPwntools)
[Install gdb-pwndbg-peda-gef](https://github.com/apogiatzis/gdb-peda-pwndbg-gef)


### Checksec {#checksec}

Same source code, compiled with different protections in place:

{{< highlight sh "linenos=table, linenostart=1" >}}
checksec checksec/intro2pwn2
{{< /highlight >}}

```text
[*] '/home/kdb/Downloads/IntroToPwntools/IntroToPwntools/checksec/intro2pwn2'
    Arch:     i386-32-little
    RELRO:    Partial RELRO
    Stack:    No canary found
    NX:       NX disabled
    PIE:      No PIE (0x8048000)
    RWX:      Has RWX segments
```

{{< highlight sh "linenos=table, linenostart=1" >}}
checksec checksec/intro2pwn1
{{< /highlight >}}

```text
[*] '/home/kdb/Downloads/IntroToPwntools/IntroToPwntools/checksec/intro2pwn1'
    Arch:     i386-32-little
    RELRO:    Full RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      PIE enabled
```

-   [RELRO]({{<relref "relro.md#" >}})  = Relocation Read-Only; makes the global offset table (GOT) read-only after the linker resolves functions to it. The GOT is important for techniques such as the ret-to-libc attack
-   [Stack Canaries]({{<relref "stack_canaries.md#" >}}) = tokens placed after a stack to detect a stack overflow. Stack canaries sit beside the stack in memory (where the program variables are stored), and if there is a stack overflow, then the canary will be corrupted. This allows the program to detect a buffer overflow and shut down.