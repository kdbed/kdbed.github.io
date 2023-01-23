+++
title = "Kali Linux - Basics"
author = ["svejk"]
tags = ["linux", "kali"]
draft = false
+++

## Filesystem {#filesystem}

FHS - Filesystem Hierarchy Standard - conventions used for layout of a UNIX system [LinuxFoundation](https://wiki.linuxfoundation.org/lsb/fhs)

-   /bin : basic programs like `ls`, `cd`, `cat`
-   /sbin : system programs like `fdisk`, `makefs`, `sysctl`
-   /etc : configuration files
-   /tmp : temporary files, typically deleted on boot
-   /usr/bin : applications like `apt`, `ncat`, `nmap`
-   /usr/share : application support and data files


## Basic Linux commands {#basic-linux-commands}


### man pages {#man-pages}

Manual content divided into sections:

| Section | Contents                                       |
|---------|------------------------------------------------|
| 1       | User Commands                                  |
| 2       | Programming interfaces for kernel system calls |
| 3       | Programming interfaces to the C library        |
| 4       | Special files such as device nodes and drivers |
| 5       | File formats                                   |
| 6       | Games and amusements                           |
| 7       | Miscellaneous                                  |
| 8       | System administration commands                 |

Name, synopsis, description, along with options, parameters, switches, etc

`man cat`

{{< figure src="/images/man.png" >}}


#### Search by Keyword {#search-by-keyword}

`man -k '^passwd$'` -- search by regex

{{< figure src="/images/manKey.png" >}}


#### Search using `apropos` {#search-using-apropos}

search descriptions, equivalent to `man -k`


## Finding files {#finding-files}


### `which` {#which}

searches through directories in the `$PATH` environment variable for a given file name; returns the full path to the file if a match is found


### locate {#locate}

quickest way; uses locate.db, database updated regularly by cron scheduler; update manually with `sudo updatedb`


### find {#find}

most complex and flexible; eg recursive search starting from root of filesystem, searching for any files that start with sbd: `sudo find / -name sbd*`; find can search by many attributes

Ex: find files modified in last day and not owned by root; execute `ls -l` on them:

`find / -mtime -1 -type f ! -user root -exec ls -l {} \;`

Ex: find files of a certain size and base64 decode contents

`find / -size 64c -exec base64 -d {} \; 2>/dev/null`


## Kali services {#kali-services}

In order to maintain a low profile, Kali prevents network services from starting by default -- they need to be specifically enabled


### ssh {#ssh}

`sudo systemctl start ssh`

Verify:

`sudo ss -antlp | grep sshd`

![](/images/sshd.png)
To start automatically at boot: `sudo sytemctl enable ssh`


### http {#http}

http service (apache) -- hosting a site or a platform for downloading files to victim machine

`sudo systemctl start apache2`


### List of all available services {#list-of-all-available-services}

`systemctl list-unit-files`


## Tools {#tools}

`apt` is the package manager for this debian-based system


### apt uses {#apt-uses}

-- apt update ; apt upgrade
-- apt-cache search
    `apt-cache search pure-ftpd`
-- apt show
-- apt install


### dpkg {#dpkg}

does not require an internet connection; will not install dependencies
