# AlpineLinux for the intimates, I proudly present to you "My way"

I'm 752963e64 in between others alias Today I decided to share with you what I think the keys from different perspecives about the free software ecosystem and its utility.

This is not a product despite its increasing value but a document to master your environment by yourself.

- A default managed install is not what you gonna find in this document!

- At the end of this document describing my way! you'll be able to fly, literally!

- RMS is bad at sharing his way... he lies

- Linus uses Fedora because he as bad RMS 🙂

- I would like to break in their personal network to confirm I'm right...

- monstruous machines with super stuff inside 😸

## Download the toolbox

[official release x86_64](https://dl-cdn.alpinelinux.org/alpine/v3.23/releases/x86_64/alpine-standard-3.23.2-x86_64.iso)

## flash it on USBSTICK

type the iso file path without >< and take care your device selection...

commande is ran as root...

```dd if=<ISO_FILEPATH> of=/dev/sdX```

wait a long moment, if your hardware is from fire era... (like me) 😸

```sync```

Obligatory toilet flush with removable devices... (psssst... many ppl lost their data like this because they didn't flush data before removing device...)

now you can remove the usb stick and plug it to the machine you wish I bless with you.

## bootstrap your machine

boot up the machine and select your pendrive as bootdevice from your bios... if it boots you are lucky...

I wont debug such problem with you...

type "root" hit return at prompt

congrats your are IN! serious shit is coming :accessibility:

## The keymap very important

The interfaces between you and the machine must be mastered.

```setup-keymap```

just follow instructions, when the program exit don't hesitate to try your machine assumes the right information from your keystroke!

## The hostname (machine name)

```setup-hostname```

name your machine, not a fully qualified domaine name.

## The network (required)

The doorway between the machine and the DMZ(No Military Allowed) 😸 or the WAN(Wide Area Network) or just the network internet...

```setup-interfaces```

The quickest way would be ethernet connected to a network that provide DHCP, however you can rely to the network(always via ethernet) using a static address which you need to be aware of the network pool and gateway addresses.

You can also use the WIFI if your WIFIcard is recognized by alpine... however this not handy... prepare your wifi key aside you to type it blindly YEAH it's a feature I heard 😸 welll anyway you are blind at this moment so don't shake on keystroke...

## The TIMEZONE (very important in a time sharing system/network 😺)

```setup-timezone```

I live at 4hours from Paris so I put "Europe/Paris" find yours 🙂

## The nameserver

permit to answer the resource locator, It's complex no? 😸

```echo "8.8.8.8" > /etc/resov.conf```

We use big greedy corp just to finish setup or as failsafe... after we will setup an encrypted dns provider/server

## The internal clock (RealTimeClock)

```setup-ntp```

choose busybox it's the best option no dependancies...

## apk repositories (it's not android apk 🙂)

Choose a mirror you put trust in (may be difficult! as they all dropping responsibility 🙂)

Take russian mirror and say "privet"! 😙

```setup-apkrepos```

```sed -i 's:http:https:g' /etc/apk/repositories```

Yeah... **"security oriented"** with the basis of security **not applied**

Anyway I sharp! I'm gonna bless your machine remember!

## Update the living creature!

```apk update```

It should update repo... if it doesnt debug it yourself... it should WORK! 😙

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

make a new dos partition table

create a new primary partition and at the ending block prompt type +512M hit enter

type a then hit enter. first partition should be bootable LBA zZZZZZZZzz

you should have one partition with a size of 512MB if that's okay let's continue!

create a new extended partition hit enter to all prompt...

create a new logical partition and at end block prompt type +8G hit enter

create a new logical partition and at end block prompt type +10G hit enter

create a new logical partition and at end block prompt type +100G hit enter

rest of your disk space is available at anytime even in a running system :)

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

notice the use of small inodes, when a file is written to disk it is wrote on inodes... this means that 1k real size file with the usual inode setup is taking 4k space on disk... you understand why? now? 😙

we separate /boot because it's totally useless in the userland... the boot partition can be read only, unmounted at boot or never mounted at all... well just keep mounting or remounting it when you update your system and a new kernel is available...

The extended partition feature let us total freedom in its scale and you are no more limited to 4 partitions per disk!...

the swap is big! must be if you got 8-16GB ram with memory intensive workload, you can simply don't use it at all if you are owner of 60-100gb machine 🙂

root partition is comfortable with 10GB... you can offload data at anytime by creating and mounting new partition with the rest of disk space 😙

the home partition! must be separate you can apply some rules to it! and you can plug this home to all your systems that bind to it (passive directory 😄) 

## commit push to disk!

```sh
mount -v /dev/sda6 /mnt
mkdir -v /mnt/boot
mount -v /dev/sda1 /mnt/boot
swapon /dev/sda5
```

homie's uneeded for this stage

```
cd / && zip -ry -9 /mnt/abnormal.zip ./bin ./etc ./lib ./sbin ./usr ./var ./tmp
sync
cd /mnt
unzip -XK abnormal.zip
mkdir -p dev proc sys root mnt opt home run boot
```

## setup kernel filesystems then bind /mnt

THe system is installed on disk, yeah already... 😄

by now we need to chroot /mnt

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

## Your are inside your future system

from there we need to creat an /etc/fstab = filesystem table? nevermind...

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

It is obligatory because the disk index may bind to another disk if there is another disk plugged...

demo from the wizard
```
┌──(hackit@q6600)-[~]
└─ $ blkid
┌──(hackit@q6600)-[~]
└─ $ 
```

## more to come :D

Doing it from memory is fun but it feels like lot of pretention I don't want to lead any ppl in error shit... so gotta verify all of it a lil after or tomorrow hope to finish for santa day 

fuuuuu, ninja

# SOON®
