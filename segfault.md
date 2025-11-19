# The segmentation's faults 😸

#### BusyBox v1.37 - multi-madness binary.

- reproduce the bug using:

```sh
#input using /bin/ash
k() {
k
}
k
```

```sh
#output using /bin/ash
Segmentation fault
```

```sh
[ 2588.345297] ash[539]: segfault at 7fff157c2f78 ip 00007fdbf95b0362 sp 00007fff157c2f80 error 6 in ld-musl-x86_64.so.1[5f362,7fdbf9565000+58000] likely on CPU 1 (core 0, socket 0)
[ 2588.345314] Code: 40 20 48 8b 44 24 58 41 0f 11 40 50 66 0f 6f 84 24 90 00 00 00 49 89 40 28 48 8b 84 24 a0 00 00 00 41 0f 11 40 60 49 89 40 70 <e8> 77 35 fe ff 48 81 c4 c0 00 00 00 5b c3 b8 06 00 00 00 48 89 df
```

