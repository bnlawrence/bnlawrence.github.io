---
layout: post
title: On Processing Affordance
last_modified: Thursday 27 July, 2006
tags: ndg
categories: computing
header: 
---
When we [produced]({% post_url oldblog/2006-03-20-the_lockin_results_in_the_exeter_communique %}) the [Exeter Communique](/assets/papers/TanEA06.pdf), we spent a lot of time talking about something that Simon Cox has termed "processing affordance". A processing affordance is a property of a feature[^1] type which expresses "what can be done to or with it". 

Some of us (ok, maybe just me), find it useful to distinguish between intrinsic affordances and extrinsic affordances, by which we (me) mean things that depend on the properties of the feature that were anticipated by the feature type creator (intrinsic), and things that may be independent of the properties of the feature, and are certainly things that are not described and maintained by the person or organisation that governs the description of a specific feature type (extrinsic).

This blog entry is effectively the record of a conversation that Andrew Woolf, Jeremy Tandy and I had, where we were trying to tie down (mainly for my benefit I fear), exactly why we need this affordance concept. (Of course, it's *my* record, so it may be nonsense ...)

If we concentrate only on intrinsic affordances, then they are certainly something we describe in our UML domain modelling. A simple example would be that if we had a gridseries feature, we clearly anticipate an operation of subsetting which allows one to extract a series ... (we anticipate a lot of other things too, but that's fairly obvious). Suppressing extraneous detail (and arguments about whether a geometry like "grid" should be a feature), in UML, we might have our simple domain model looking like:
![Image: IMAGE: static/2006/07/27/SimpleAffordances.jpg ](/assets/images/2006-07-27-SimpleAffordances.jpg)

So far so good, but when we want to serialise it, and if we want to use GML, then we hit a serious snag. The design and history of GML as a *data* modelling activity means that the GML coverage type has already ditched the operations in its version of the parent CV_Coverage class, and the GML schema has no inherent mechanism for describing operations. (I spent a lot of time being confused by this, as folk had insisted on saying *xml-schema* has no mechanism for describing the operations, and that's obviously daft ... what they had meant was that the *GML-xml-schema* has no mechanism).

Because we don't believe in multiple inheritance (the ISO mechanism explicitly says we should only inherit from one class, which amongst other reasons, makes the software easier to automate), we're stuck. In practice we have to serialise via GML schema so we have to come up with an independent method
of serialising the operations (which when they are inherently tied to a feature become "affordances"), and then creating the link. Something like the following
![Image: IMAGE: static/2006/07/27/SimpleAffordances2.jpg ](/assets/images/2006-07-27-SimpleAffordances2.jpg)

The question we are left with then is how *exactly* to implement these relationships between operations and their *parent* features in a way that is likely to be consistent with the OGC methodology and one that others will buy into. That will be the topic of another note ...
[^1]:
where we use the word feature in the ISO19123 sense


#### trackbacks (1)

*[Service Descriptions]({% post_url oldblog/2006-12-07-service_descriptions %}) (from "Bryan's Blog" on (on Thursday 07 December, 2006)*)

A little over six months ago, I introduced the thorny problem of service binding to my blog. Of course it hasn't gone away. Last week I gave a talk (see my the SEEGRID talk on my talks page) about "Grid-OGC collision" in which I made some specific statements ...
