# Simple security care in a world going nuts

### On a sudoer system?
```
sudo su
chmod o-rwx /bin/su
```
only admin can really access root, unless a bug leading to root privilege; ohhhh...

### Your home is a temple...
```
chmod -R o-rwx ../$USER
echo 'umask 027' >> .bashrc
```

### You wish to contain things simply, with what you got...
```
sudo su
userdadd -G kvm -m -s /bin/bash <contain_username>
chmod -R o-rwx /home/<contain_username>
echo 'umask 027' >> /home/<contain_username>/.bashrc
```
It's generally a good thing to do if you got alsa handling instead pulseaudio to add ",audio" to "-G kvm"...

Using pulseaudio I still didn't find the right way to do with ubuntu...

All of this applies in the case you will use that last account in a terminal...

You'll be able to launch software but nothing accessing to graphic card or sound card...

to access actual user graphical session issue ```xhost +``` in your shell...

By now you'll be able to use graphical apps into your actual session from another user (call from terminal)...

These apps are unable to see users directories unless its own...

written by 752963e64 the 16/06/2022 d/m/y - my 0 cent journal...
