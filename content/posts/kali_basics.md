+++
title = "Kali Linux - Basics"
author = ["svejk"]
tags = ["linux", "kali"]
draft = false
+++

## Filesystem {#filesystem}

-- /bin : basic programs like `ls`, `cd`, `cat`
-- /sbin : system programs like `fdisk`, `makefs`, `sysctl`
-- /etc : configuration files
-- /tmp : temporary files, typically deleted on boot
-- /usr/bin : applications like `apt`, `ncat`, `nmap`
-- /usr/share : application support and data files


## Basic Linux commands {#basic-linux-commands}


### man pages {#man-pages}

Name, synopsis, description, along with options, switches, etc

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
