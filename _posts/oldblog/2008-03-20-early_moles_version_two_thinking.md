---
layout: post
title: early MOLES version two thinking
last_modified: Thursday 20 March, 2008
tags: ndg metadata iso19115 moles
categories: computing
---
Today's task was going through MOLES V1 and trying to capture the key semantics in UML.

MOLES V1 was implemented (and defined) in XML schema, and had some regrettable flaws which
we want to sort out in V2 ... and like I said yesterday, we want to take a step towards
O&amp;M support (but realistically we won't get there in this one step).

So this is where we are: the key overarching diagram looks like this:

![Image: IMAGE: static/2008/03/20/molesV2.png ](/assets/images/2008-03-20-molesV2.png)

I don't have time to explain much of it today, but suffice to say it has all the good
bits from V1 but cleaner lines (yes really) of specialisation and association. It should
be much easier to implement and support.

It turns out with a cleaner structure a whole lot baggage disappeared, and rather less
semantic content was left to differentiate between those key entities: productionTool,
observationStation and activity than I thought ... (you can't see that in this diagram,
you'll have to wait for a fuller discussion, but suffice to say it mostly comes down
to codeLists, albeit that we might support a movingPlatform specialisation of an 
observationStation).

You will also see that there are the beginnings of some support for late binding of
services. That might be a bit clearer with this:

![Image: IMAGE: static/2008/03/20/molesServices.png ](/assets/images/2008-03-20-molesServices.png)

Yesterday I was also wittering on about online references. My thinking isn't complete
on this yet, but this is what I have in dgOnlineReference:

![Image: IMAGE: static/2008/03/20/molesOnlineReference.png ](/assets/images/2008-03-20-molesOnlineReference.png)

Note the use of applicationProfile to hold the semantics of an information resource,
which ought to be a featureType. Note also I'd rather like to get the mimeType in here
too ... rather like an xlink actually. Some more thinking to go on here (indeed the whole
thing is still in a state of flux ...)

#### trackbacks (1)

*[more MOLES version two thinking]({% post_url oldblog/2008-04-01-more_moles_version_two_thinking %}) (from "Bryan's Blog" on (on Tuesday 01 April, 2008)*)

We've made some more progress with our thinking since last week ... but there is more to come. Meanwhile ...
