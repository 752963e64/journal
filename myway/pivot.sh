#!/usr/bin/env ash

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

