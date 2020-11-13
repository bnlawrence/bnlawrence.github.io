---
layout: post
title: Pushing Water Analogies too far
last_modified: Wednesday 09 February, 2011
tags: metadata badc neodc
categories: computing
image: /assets/images/2011-02-09-firehose.jpg
---
Recently I heard a talk by [Kevin Trenbeth](http://www.cgd.ucar.edu/cas/trenbert.html), who showed a slide with the following cartoon:

![Image: firehose.jpg ](/assets/images/2011-02-09-firehose.jpg)

It was perfect in context, but I also found it amusing in a serendipitous sort of a way: just before he started speaking , I had started (in a coffee break I hope) googling for images of reservoirs, hoses and sprinklers ... because I had a similar idea in mind, and I wanted an easy way of communicating it.

However, my idea was and is rather different from Kevin's. So why is it different? Firstly, mine was borne out of Ian Jackson's repeated mantra (on the NERC information strategy group) that a water-pipe system is no good without water, and my repeated response, and without a pipe *system*, the water just gets wasted. We were both right of course: a water delivery system is useless without water, and water gets wasted without a delivery system.

To some extent Kevin's image is redolent of wasted water, even though there are clearly components of a system ... but I'd put it slightly differently:

* I don't think the sensor is analogous to the hydrant, I think it should be analogous to the rain pouring water into a reservoir via runoff, rivers, whatever ...
    * There are plenty of folk who will tell you it's [raining data](http://eprints.ecs.soton.ac.uk/7648/1/The_Data_Deluge.pdf).
    * My point being that there are a plethora of sensors (water delivery mechanisms), each delivering data (water) into a bunch of archives (lakes, reservoirs, whatever).
    * The hydrant is simply a defined interface to which I can couple a hose! It depends on being connected to a local reservoir, which itself may be coupled by a canal or a pipe to another reservoir, or lake or whatever. So the lessons I draw are that:
        * In the case of data, we need local caches, to which we can connect delivery systems which understand a standard interface.
        * But they depend on the existence of connected (and large) managed bodies of water. In my world view, that might be a European archive (distributed or otherwise), and a national archive (which may be independent of, or part of, the European system).
* I think the idea of the scientist cowering under a deluge of data is correct, but
    * more and more we see folks building complicated data delivery systems so that the data can be more easily consumed.
        * I see that as analogous to the design and construction of a range of sprinklers on the end of the hose, targeted at particular problems.

So here is my graphic:

![Image: water-analogy.png ](/assets/images/2011-02-09-water-analogy.png)

And the context?

We are being encouraged to put more and more effort into the front end - the portal, the visualisation system - to the detriment of the backend (the managed archive, well connected, with standard interfaces).

It clearly wont end well

* if we have a lovely sprinkler system, but the reservoir looks like this:

![Image: dryreservoir.jpg ](/assets/images/2011-02-09-dryreservoir.jpg)

Nor will it end well
* if we ignore the importance of metadata,and the fact that the pipes can carry more than one type of fluid:

![Image: industrial.png ](/assets/images/2011-02-09-industrial.png)

(I'm well aware I need some picture credits on this post, since I made some serious use of other peoples pictures ... please let me know if your picture is here and you would like a credit - or for me to remove it.)

#### comments (1)

*cyberdoyle (on Saturday 12 February, 2011)*

great analogy.
With fat pipes everywhere (dumb pipes will do nicely) we can keep the water on full belt and move the data all over the place, to where its needed.
Bring on the fibre.
chris
