---
layout: post
title: Integrating data handling libraries
last_modified: Tuesday 12 October, 2010
tags: cf netcdf
categories: computing
header:
    teaser: /static/2010/10/12/stack1_teaser.png
---
Earlier this week I was talking with one of my colleagues about the difference between NetCDF3, NetCDF4, HDF etc ... and also about my hope that there is a future where projects stop inventing bespoke data formats AND exploit existing conventions as to how to use existing formats.

In the conversation, I realised I wanted some diagrams, and that I'd probably want them again. So here they are.

![Image: IMAGE: static/2010/10/12/stack1.png ](/assets/images/2010-10-12-stack1.png)

In this first schematic, I'm
* Explaining the relationship between the CF conventions for NetCDF, the NetCDF3 classic interface, NetCDF4 and HDF (which is essentially about layers, exploiting and constraining how they use lower layers).
* Pointing out that right now, CF is expanding (hopefully) into the aircraft, satellite, and station arenas (but admitting that we have a problem that is nobody's day job to work on this integration, to make proposals, and write examples etc).
* Pointing out that from what I understand about EUFAR, they may be bypassing the opportunity to work through "the CF stack". While this might make sense for those who directly work with the instruments, it makes life difficult for other communities. (This argument applies to others as well ...)

![Image: IMAGE: static/2010/10/12/venn1.png ](/assets/images/2010-10-12-venn1.png)

In the second schematic, I'm trying to show that the pontential overlap between these (currently) competing aircraft formats and the existing CF initiatives **could** be quite considerable, and that I hope folk will work on convergence rather than divergence.

Which brings me to the last schematic: I'd really like CF in the future to consist of the core conventions that exploit NetCDF in a common way, with clearly defined toolboxes that data producers and consumers can rely upon to create and consume the key variants of data of interest to a bunch of overlapping communities. It may be that in that world CF can't be completely implementable in NetCDF3 ...

![Image: IMAGE: static/2010/10/12/stack2.png ](/assets/images/2010-10-12-stack2.png)


#### comments (1)

*Bryan (on Friday 22 October, 2010)*

As Steve Hankin just pointed out, what I called the toolbox is just another way of saying CF should support a number of different feature types, each well defined.
