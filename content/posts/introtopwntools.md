+++
title = "Intro to Pwntools - TryHackMe"
author = ["svejk"]
draft = false
+++

## Intro to Pwntools {#intro-to-pwntools}

Source materials here [dizmascyberlabs](https://github.com/dizmascyberlabs/IntroToPwntools)
[Install gdb-pwndbg-peda-gef](https://github.com/apogiatzis/gdb-peda-pwndbg-gef)


### Checksec {#checksec}

Same source code, compiled with different protections in place:

```sh
checksec checksec/intro2pwn2
```

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