---
layout: post
title: On Moores Law
last_modified: Monday 19 May, 2008
tags: computing
categories: computing
---
Last week I was involved in a conversation where I was explaining how the BADC deals with storage costs. It's not a complicated scheme, we basically work on the assumption that as long as we can store the next four years data, we can probably store the entire previous archive as a marginal activity.

Given a doubling time of thirteen months in storage capacity (associated with a halving in cost, we figure that in four years time we'll have about 10-13 times the storage for the same cost as our current storage (why thirteen months? See below). That also means our current storage will be about 5-10% of the total volume.  So we front load the cost of putting data **into** the archive (by a tiny bit), and then our business model doesn't need to deal with the cost of long term storage.

A digression: At some point or another one might start wondering when Moore's Law might break. Yesterday, I found [this from Greg Matter](http://blogs.sun.com/roller/page/Gregp?entry=don_t_become_moore_confused) - a  nice reminder that technically Moore's Law has nothing to say about storage efficiency advances. It's a nice blog entry, because it makes the point that the continual improvement in price performance is not just about smaller and smaller transistors, but also about improving architectures etc.

As he said:
<blockquote>Continuing to throw transistors at making single processors run faster is a bad idea. It's kinda like building bigger and bigger SUVs in order to solve our transportation problems.
</blockquote>

Then he went on to say:
<blockquote>Just as the '80's discrete processors were killed by microprocessors, today's discrete systems &#151; motherboards full of supporting chip sets and PCI slots with sockets for microprocessors &#151; will be killed by microsystems: my word for the just-starting revolution of server-on-a-chip ... Where does end up? Well, we are now dying to get to 65nm (Niagara is 90nm) so we can get even more transistors on a chip in order to integrate more and bigger systems. Just as the microprocessor, harvested the pipeline inventions of 60's and 70's, microsystems are going to integrate the system innovations of the 80's and 90's.
</blockquote>

and
<blockquote>Moore's Law is VERY much alive
</blockquote>

OK, back to my storage doubling time. If it's not Moore's law, what is it? [wikipedia](http://en.wikipedia.org) calls it
[Kryder](http://en.wikipedia.org/wiki/Kryder's_law)'s law.
However, we also remember it's not just about storage capacity. This figure (grabbed from [oracle](http://www.dba-oracle.com/oracle_tips_hardware_oracle_performance.htm)) makes a good point about another reality: I may be able to store more data, but getting it back is starting to be a big problem:

![Image: IMAGE: static/2005/11/14/hardware_oracle_performance.jpg ](/assets/images/2005-11-14-hardware_oracle_performance.jpg)

And I have to worry about the software I'm using:  another amusing variant of Moore's law is [Wirth](http://en.wikipedia.org/wiki/Wirth's_law)'s law:
<blockquote>Software gets slower faster than hardware gets faster.
</blockquote>

All of this reminds us that our complete business model has much more than just the storage cost in it, so as well as dealing with speed of access, and software, we have one more major cost: there is no doubling in the speed of human thought, and we still have to manage all this data!


#### trackbacks (1)

*[Cost Models]({% post_url oldblog/2008-05-20-cost_models %} (from "Bryan's Blog" on (on Tuesday 20 May, 2008)*)

Sam and I had a good chat about cost models today - he's in the process of honing the model we use for charging NERC for programme data management support.
