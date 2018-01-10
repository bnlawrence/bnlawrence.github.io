---
layout: post
title: Affording Interfaces
last_modified: Friday 28 July, 2006
tags: ndg
categories: computing

---
... and I don't mean how much it costs :-)

[Yesterday]({% post_url oldblog/2006-07-27-on_processing_affordance %}) I tried to get across the concept of processing affordance, which is a construct which it appears that we have to invent because of limitations in GML.

The big deal we have left to thrash around with is how to describe these
affordances and link them to interfaces ... Well, I think they're different ideas, as I've tried to express in this diagram:

![Image: IMAGE: static/2006/07/28/SimpleAffordances3b.jpg ](/assets/images/2006-07-28-SimpleAffordances3b.jpg)

It has been suggested that we use a registry formalism to describe the
association between operations and features (affordance), but that was when we (I) hadn't made a distinction between operations and interfaces. If we use a registry how do we deal with the choices that need to be made about inheritance of affordance? (**Update**: Andrew tells me that I should look at WSDL2, so I will ... and note that the diagram has also been altered to avoid an incorrect UML use of interface stereotype that Andrew pointed out to me).

Obviously the computational science world has wrestled with this sort of problem for ages, so there has to be a clean solution, we just need to work out how to deploy it in our "model-driven" architecture environment.

#### trackbacks (1)

*[Service Descriptions]({% post_url oldblog/2006-12-07-service_descriptions %}) (from "Bryan's Blog" on (on Thursday 07 December, 2006)*)

A little over six months ago, I introduced the thorny problem of service binding to my blog. Of course it hasn't gone away. Last week I gave a talk (see my the SEEGRID talk on my talks page) about "Grid-OGC collision" in which I made some specific statements ...
