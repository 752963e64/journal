# Strange software separation

``` $: groups
two
 $: id
uid=1001(two) gid=1001(two) groups=1001(two)
 $: l /dev/kvm
0 crw-rw-rw-  1  root  kvm  10, 232 Nov 17 06:02  /dev/kvm
 $: cat /etc/group
...
kvm:x:34:qemu
qemu:x:36:one
...
 $: qemu-system-x86_64 -accel kvm ...
echo "WHAT!"
```

- I can't explain this and this is scary :D
