---
layout: post
title: Having our granule cake and eating it too
last_modified: Tuesday 10 June, 2008
tags: metadata ndg metafor moles
categories: computing
---
Over on [import cartography](http://zcologia.com/news/767/im-sabotaging-the-fight-for-a-sustainable-climate/), Sean is convinced he's not sabotaging the fight for a sustainable climate. He's right.

His post was inspired by a sequence of emails (most of which I haven't read), which culminated in [this one](http://lists.osgeo.org/pipermail/discuss/2008-May/003665.html).

I must say I'm depressed with how often folk manage to get themselves in one of two states: *my hammer is suitable for all problems (including screws)*, or *if you dis my hammer I will never be able to strike another nail*.

To be fair, I  sometimes find myself in these camps too (I told you it was depressing!)

Anyway, the thread Sean highlghted is particularly frustrating, because I don't think the two camps *need* to be far away. There is a place for clean, easy to use mashable technologies, *and*, complex, powerful, complete descriptions of 
geospatial objects. And guess what? Sometimes that place can coincide!

[Just today]({% post_url oldblog/2008-06-04-moles_basic_concepts %}) I mentioned that we were moving MOLES towards using ATOM as a container technology. So, not yet fully thought out, but just to make that point, here is something approximating UML for a new MOLES granule:

![Image: IMAGE: static/2008/06/04/granule-atom.png ](/assets/images/2008-06-04-granule-atom.png)

(and [here](static/2008/06/10/granule-atom.xml)[^1](static/2008/06/04/granule-atom.xml)] is an example XML instance).

The point to note is that the inoffensive little object in the bottom left corner includes a GML feature collection in [CSML](http://ndg.nerc.ac.uk/csml), using the entire crufty(but useful)ness of GML, and it's pointed to as atom content.

We do intend to have our cake and eat it too! We should be able to both mash up *and* consume our complex binary objects.  I don't see why we can't see complex GML descriptions as cargo of georss flavoured atom, just the same as a photo might be!

For the record, some things to note in this are
1. We need to flesh out a *when* object, because the atom time stamps are about the atom record, not the time of the enclosed data objects.
1. We need a logo element attribute of the dgEntity because an Atom entry doesn't have a logo (even though a feed does).
1. We have some specific elements to ensure we could produce an ISO record with mandatory components.
1. We have made the decision that the atom author and contributor should refer to the author and contributors of the enclosed CSML content, not the metadata writer (who produces the summary text, who appears as the metadata maintainer).

Of course now we might be able to build services which are easier to exploit than the OWS stack though ... (but meanwhile we are building one of the them anyway).
[^1]:
Updated on the 10/06/2008, the old one is [here


#### comments (2)

*[Sean Gillies](http://zcologia.com/sgillies) (on Wednesday 04 June, 2008)*

Exactly. Atom and GML aren't exclusive.

*[Andrew Turner](http://highearthorbit.com) (on Friday 06 June, 2008)*

Looks nice. I especially like the atom:links to the other representations - especially the WMS. 

Regarding time, have a look at xCal.


