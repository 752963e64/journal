# AlpineLinux for the intimates

- A default managed install is not what you gonna find in this document!

- At the end of this document describing my way! you'll be able to fly, literally!

## Download the toolbox

[official release x86_64](https://dl-cdn.alpinelinux.org/alpine/v3.23/releases/x86_64/alpine-standard-3.23.2-x86_64.iso)

## flash it on USBSTICK

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

```echo "8.8.8.8" > /etc/resov.conf```

We use big greedy corp just to finish setup or as failsafe... after we will setup an encrypted dns provider/server

## The internal clock (RealTimeClock)

```setup-ntp```

choose busybox it's the best option no dependancies...

# SOON®
