# Switchero

I'm glad to find one year later, that now my HP laptop(most recent hardware I have) with hybrid graphic works...

I'm not kidding, both graphic card works together with none spotted problem actually...

I'm curious what is possible with OGL 4.3 and OGL ES 3.1 with NVD7(nouveau) or OGL 4.6 and OGL ES 3.2 with Intel(HSW GT2).

Something I find strange is that the Nvidia GPU is at 4.3 and 3.1 while Intel is at 4.6 and 3.2...

anyway both works for now... until how much time, no one knows... But I'm very glad It seems to work, It's now the right moment to focus on trying using it.

## It's a messy world...

Just noticed after an update that now X boot on nouveau instead intel...

Device order has been swapped...

To select discret Intel gpu as default, now it need ```DRI_PRIME=1``` variable to be passed when loading X...

To select nvidia gpu for a particular application in X, ```DRI_PRIME=0 program```

## Too much funny world...

Did an update Just now... and order been swapped again... :D

Now no need to pass DRI_PRIME variable when starting X on Intel GPU... so now need to use ```DRI_PRIME=1 program``` to run with nvidia GPU :D

# makes me think...

Makes me think about mirroring all stuffs I depend on, to avoid such drole and strange behavior... It's disturbing... It make me questionning myself alot :D

## modesetting and crocus is crap as replacement...

using DDX with the last mesa that supported accelerated DRI with DDX driver... no sync problem, no fucking tearing when scrolling...

both my haswell boards have screen tearing with crocus... It's pure crap to enjoy computing descently :/
