# AlpineLinux for the intimates

**NOTICE** This document is written by me, It is currently not finish! Copilot has been used to write commit message for beginning part until it left me abruptly... I don't care the commit messages, so there won't be information anymore about the building process from this document... this source doesn't need to go backward. 😸 

The race! Is led by an outperforming algorithm... You must master the technology!

## I proudly present to you "My way"!

I'm 752963e64 in between others alias, I'm literally nobody in this game not to be confused.

Today I decided to share with you what I think the keys from different perspecives about the free software ecosystem and its utility.

This is not a product despite its increasing value but a document to master your environment by yourself.

- A default managed install is not what you gonna find in this document!

- At the end of this document describing my way! you'll be able to fly, literally!

- RMS is bad at sharing his way... he lies... He is certainly running his own kernel with pristine prog!

- Linus promote Fedora because he as bad RMS... 🙂

- Both of them cannot really answer question about their hacky relation with machines surrounding them... they can only act as an Ad board in front the public... 😸

- I would like to break in their personal network to confirm I'm right...

- monstruous machines with super stuff inside 😸

### FOR THE PC ABSTRACTION!

To remain Plug & Play for all parties! The program must be free and available to all. This is the basis from this ecosystem.

## Download the toolbox

[official release x86_64](https://dl-cdn.alpinelinux.org/alpine/v3.23/releases/x86_64/alpine-standard-3.23.2-x86_64.iso)

```wget https://dl-cdn.alpinelinux.org/alpine/v3.23/releases/x86_64/alpine-standard-3.23.2-x86_64.iso```

## flash it on USBSTICK

Plug the usbstick! 🙂 and then find out its architecture by typing ```dmesg```

You should see a new device at end the log ```/dev/sdX``` This is your USB storage DEVICE!

**take care your device selection...**

commande is ran as root...
```dd if=alpine-standard-3.23.2-x86_64.iso of=/dev/sdX```

wait a long moment, if your hardware is from fire era... (like me) 😸

```sync```

Obligatory toilet flush with removable devices... (psssst... many ppl lost their data like this because they didn't flush data before removing device...)

This is also true for SDCARD!

now you can remove the usb stick and plug it to the machine you wish I bless with you.

## Bootstrap your machine

boot up the machine and select your pendrive as bootdevice from your bios... if it boots you are lucky...

I wont debug such problem with you...

You should end on a login prompt!

Type ```root``` hit return

congrats your are IN! serious shit is coming :accessibility:

## The keymap very important

The interfaces between you and the machine must be mastered.

Despite its seamless integration devices need setup.

```setup-keymap```

just follow instructions, when the program exit don't hesitate to try your operating system assumes the right information from your keystroke!

## The hostname (machine name)

name your machine, not a fully qualified domaine name.

```setup-hostname```

Me I put the CPU name "q6600"! I've no imagination I know! I give more importance to object than ppl; I'm autist. 😙

## The network (required)

The doorway between the machine and the DMZ(No Military Allowed) 😸, the WAN(Wide Area Network), internet or simply your own LAN(Local Area Network)...

```setup-interfaces && rc-service networking start```

The quickest way would be ethernet connected to a network that provide DHCP(is a protocol), however you can rely to the network(always via ethernet or WiFi) using a static address which you need to be aware of the network pool and gateway addresses.

You can also use the WiFi if your WifIcard is recognized by alpine... however this not handy... prepare your wifi key aside you to type it blindly YEAH it's a feature I heard 😸 welll anyway you are blind at this moment so don't shake on keystroke...

This is the stage 0 from installation... we will change the setup to fit some particular purpose, later...

Disable IPv6 like so, It's unreliable idiotsyncratic shit.
```sysctl net.ipv6.conf.all.disable_ipv6=1 && echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf```

at this moment you can test that your network is bound to your router's network pool and routed through your ISP by typing ```ping -c1 8.8.8.8``` (Imagine yourself pinging ipv6 address 😸) If you see 100% packet loss. you did something wrong and you cannot continue, YOU MUST BE CONNECTED to an IP network first...

### Network explanation

At this moment you are connected by IP (0.0.0.0) to your network(LAN=Local Area Network) this is the basis to roam data over a network. like sun's jonathan swartz said! The network is the computer and vice versa.

Packet transit between IP addresses via protocols like TCP, UDP! The shiny name you find in application to join a machine over the network are resource locators it is an upper layer of the network that permit join services in a structured and attractive way. This is a regulated domain of computing like the network(WAN) itself... some domain name aren't cheap, you depend on the applicable law...

Your network(LAN) **shal** be regulated by yourself.

IP network works with 2 types of IP strategy. IPv4 and IPv6. Here we disabled IPv6 transport.

IP rely on [ARP](https://en.wikipedia.org/wiki/Address_Resolution_Protocol)(Address Resolution Protocol) this is the link layer that register your machine on a network router.

keep following instructions!

## The TIMEZONE (very important in a time sharing system/network 😺)

Your operating system needs to be aware of your timezone to apply the time difference to the Universal Time Clock **UTC** which is gathered from servers all over the world via NTP servers... NTP is a protocol.

These servers uses time precision methods to stay synchronized and share this synchronization to all participants freely over the network! this permit to corelate time in applications depending on time!

```setup-timezone```

I live at 4hours from Paris so I put "Europe/Paris" find yours 🙂

## The nameserver

Permit to answer the resource locator, It's complex no? 😸

The applications that read a resource locator to translate a fully qualified domain name (www.google.com,google.com,...) join a "nameserver" service over IP to return an IP. 

A nameserver service uses the DNS protocol.

an URL is a prototcol ```http://google.com``` you need to learn about to use it like professionals.

push a temporary nameserver
```echo "nameserver 8.8.8.8" > /etc/resolv.conf```

This server logs all queries for security and law, same shit with your ISP...

We use this corp owned server just to finish setup or as failsafe... after we will setup an encrypted dns provider/server with some requirement that let us feel more safe...

The Main problem from these federated services is that owners are vicious and users unaware what they outsourcing and how it is used.

They also auditing... for deceptive and dangerous content... it's not bad at all... so to you to make your opinion.

However you can rely entirely on IP for security reason, this requiert you to master how protocols works. Nameservers aren't a requirement to exchange over the network, it's just comfort.

You can name machine internaly and still be able to query fully qualified domain names! via ```/etc/hosts```

## The internal clock (RealTimeClock)

This permit to setup the real time clock, so your computer remain o'clock...

It is highly recommended for clock dependant softwares...

[RTC Wikipedia](https://en.wikipedia.org/wiki/Real-time_clock)

```setup-ntp```

choose busybox it's the best option no dependancies...

Note that the CPU can perform high precision clock operation without an **RTC**

## apk repositories (it's not android apk 🙂)

Choose a mirror you put trust in (may be difficult! as they all dropping responsibility 🙂)

Take russian mirror and say "privet"! 😙

```setup-apkrepos```

```sh
sed -i 's:http:https:g' /etc/apk/repositories
sed -i 's:#::' /etc/apk/repositories
sed -i 's:/me:#/me:' /etc/apk/repositories
```

**"security oriented"** with the basis of security **not applied**

Anyway I sharp! I'm gonna bless your machine remember!

## Update the living creature!

```apk update```

It should update repo... if it doesn't, debug it yourself... it should WORK! 😙

## Gear up the living creature!

We install new package on the live system... don't worry it's normal...

```apk add grub-bios zip util-linux```

- grub-bios cuz it is bios install

- zip cuz we gonna zip stuff to import on the filesystem

- util-linux cuz we need better tool to part slice the disk...

## Now you'll be a disk architect...

We gonna use fdisk to partition our disk like me...

forget all data on your disk if you didn't do a backup...

```fdisk /dev/sda```

from there if you have partition on it delete them all following instruction in the software...

- make a new dos partition table

- create a new primary partition and at the ending block prompt type +512M hit enter

type a then hit enter. first partition should be bootable LBA (LEGACY BOOT ADDRESS)

you should have one partition with a size of 512MB if that's okay let's continue!

- create a new extended partition hit enter to all prompt...

- create a new logical partition and at end block prompt type +8G hit enter

- create a new logical partition and at end block prompt type +10G hit enter

- create a new logical partition and at end block prompt type +100G hit enter

**rest of your disk space is available at anytime even in a running system :)**

by adding a line for your new partition(s) in the mount table ```/etc/fstab``` at anytime runtime!

like so: ```/dev/sda8						      /var		      ext4	rw,defaults,relatime				                          0 1```

awesome? 😙

so you have: 

- /dev/sda1 => 512MB => /boot
- /dev/sda2 => Extended partition => not a mountable partition
- /dev/sda5 => 8GB => swap
- /dev/sda6 => 10GB => /
- /dev/sda7 => 100GB => /home
- rest of your disk space available at runtime!

## Now we will setup filesystems

You'll notice that we tweak inode size in some condition

```mkfs.ext2 -T small /dev/sda1```

```mkfs.ext4 -T small /dev/sda6```

```mkfs.ext4 /dev/sda7```

```mkswap /dev/sda5```

### Explanantion!

Notice the use of small inodes, when a file is written to disk it is wrote on inodes... this means that 1k real size file with the usual inode setup is taking 4k space on disk... you understand why? now? 😙

We separate /boot because it's totally useless in the userland... the boot partition can be read only, unmounted at boot or never mounted at all... well just keep mounting or remounting it when you update your system and a new kernel is available...

The extended partition feature let us total freedom in its scale and you are no more limited to 4 partitions per disk!...

The swap is big! must be if you got 8-16GB ram with memory intensive workload, you can simply don't use it at all if you are owner of 60-100gb machine 🙂

Root partition is comfortable with 10GB... you can offload data at anytime by creating and mounting new partition with the rest of disk space 😙

The home partition! must be separate you can apply some rules to it! and you can plug this home to all your systems that bind to it (passive directory 😄) 

## Mount filesystem layout!

```sh
mount -v /dev/sda6 /mnt
mkdir -v /mnt/boot
mount -v /dev/sda1 /mnt/boot
swapon /dev/sda5
```

homie's uneeded for this stage

## Copy the live system to filesystem

```
cd / && zip -ry -9 /mnt/abnormal.zip ./bin ./etc ./lib ./sbin ./usr ./var ./tmp
sync
cd /mnt
unzip -XK abnormal.zip
mkdir -p dev proc sys root mnt opt home run boot
```

## Setup kernel filesystems

The system is installed on disk, yeah already... 😄

By now we need mount the running kernel's filesystems to your operating system copy on disk so we can operate on that operating system as we had booted it.

From there you should be able to query network... here is a link to the script that permit you to chroot into your new operating system assembled by hand with blessing by me. 

```wget https://raw.githubusercontent.com/752963e64/journal/refs/heads/main/myway/pivot.sh```

Here is the script for reference.
```sh
cd /mnt
mount --bind /dev ./dev
mount -t devpts devpts ./dev/pts -o nosuid,noexec
mount -t sysfs sys ./sys -o nosuid,nodev,noexec,ro
mount -t proc proc ./proc -o nosuid,nodev,noexec
mount -t tmpfs tmp ./tmp -o mode=1777,nosuid,nodev,strictatime
#mount -t tmpfs run ./run -o mode=0755,nosuid,nodev
if [ -L ./dev/shm ]; then
  mkdir -p ./`readlink ./dev/shm`
  mount -t tmpfs shm ./`readlink ./dev/shm` -o mode=1777,nosuid,nodev
else
  mount -t tmpfs shm ./dev/shm -o mode=1777,nosuid,nodev
fi

chroot . /usr/bin/env -i SHELL=/bin/sh HOME=/root TERM=linux PATH=/usr/sbin:/usr/bin:/sbin:/bin /bin/sh
```

just issue ```chmod +x pivot.sh && ./pivot.sh```

## Your are now inside your future system

From there we need to create an /etc/fstab = filesystem table? nevermind...

/etc/fstab:
```
/dev/sda6						      /		      ext4	rw,relatime				                          0 1
/dev/sda1						      /boot		  ext2	ro,relatime 				                        0 0
/dev/sda7						      /home		  ext4	rw,relatime				                          0 2
/dev/sda5						      swap    	swap	defaults				                            0 0
proc            					/proc     proc	rw,nosuid,nodev,noexec,relatime,hidepid=2   0 0
```

arrrghh, explanation with spikes 🙂... normally profesionals uses UUID... I find them ugly and highly uniqely identifying shit in some obscure context that could arrise 😙

anyway you'll have to use ```blkid``` program to grab all UUID and replace to respective partition in /etc/fstab

like so
```UUID=bd8bbd25-9df0-4456-88a9-ef6a19fdb808     /		      ext4	rw,relatime				                          0 1```

when it's done you can protect it from lurker using ```chmod o-rwx /etc/fstab```

It is obligatory because the disk index may bind to another disk if there is another disk plugged at boot...

demo from the wizard
```
┌──(hackit@q6600)-[~]
└─ $ blkid
┌──(hackit@q6600)-[~]
└─ $ 
```

## more to come :D

Doing it from memory is fun but it feels like lot of pretention I don't want to lead any ppl in error shit... so gotta verify all of it a lil after or tomorrow hope to finish for santa day cuz it's not even 10% from what I'm about to write.

fuuuuu, ninja

# SOON®
