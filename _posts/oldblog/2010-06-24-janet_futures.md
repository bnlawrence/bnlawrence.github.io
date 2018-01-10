---
layout: post
title: Janet Futures
last_modified: Thursday 24 June, 2010
tags: badc networking
categories: computing

---
I've just attended a workshop on the research community's future requirements for the UK academic network, [JANET](http://www.ja.net). The workshop was held at the new royal society conference venue - the [Kavli Royal Society International Centre](http://royalsociety.org/Kavli/) - which as you can see is a bit special:

![Image: IMAGE: static/2010/06/24/roysockavli.jpg ](/assets/images/2010-06-24-roysockavli.jpg)

The workshop itself covered a bunch of interesting things, but the aspect I was most interested in was obviously ensuring that the networks can support the data movements required by the earth observation and earth system modelling communities.

In practice we currently rely on the production IP network now (running over SuperJanet), but there are real issues in getting the performance we need: either the last mile isn't fast enough (often a 1 Gbit/s network in some universities), or there are subtle configuration problems that preclude the disk to disk speeds we want (in excess of 1 Gbit/s - the canonical figure we want is to move 10 TB in a day, day in, day out). In the case of the BADC, we want to do that to three or four locations as part of ensuring we have the data - and we want users to be able to download at similar speeds ... so our aggregate bandwidth requirements are expected to be in the multiple Gbit/s - sustained.

We are starting to investigate tuning gridftp instances for specific routes (e.g. BADC to and from PCMDI for CMIP5), and on a local scale light paths (guaranteed network allocations, which could allow us to run any network protocol, not just IP). We'll eventually be considering light paths for our important long haul international links.

Key things for the future, are:
1. To do better on the UK and European scale about influencing where things are located: it's crucial that we have adequate bandwidth of course, but even with light paths, latency starts to matter if we want to mount file systems over long distances.
1. To investigate the use of the dynamic allocation of "light paths", so for example, if we're not running big simulations at hector, we don't hold a network channel open. When we are, we do ...
