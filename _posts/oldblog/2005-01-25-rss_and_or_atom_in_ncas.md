---
layout: post
title:  Atomic content in NCAS 
last_modified: Tuesday 25 January, 2005
tags: badc
categories: computing
---

The NERC Centres of Atmospheric Science, [NCAS](http://ncas.ac.uk), consists of a number of centres and facilities that have their own life and web presences. Today some of us had a brief discussion about whether it would be feasible to utilise [RSS](http://www.xml.com/pub/a/2002/12/18/dive-into-xml.html) and/or [Atom](http://www.atomenabled.org/) to improve the connections between the centres, the ncas website itself, and the wider world.

Ideally, all the information parcels on the websites would be individual atom parcels that can be aggregated in sensible ways: for example, it would be good if an atmospheric aerosol research group could aggregate all the ncas website articles on aerosols onto one page, while at the same time, the individual website articles could also appear (where appropriate) as NCAS news items. Clearly one prerequisite would be the existence of appropriate feeds!

We discussed the steps we would need to take:

In a more general sense, blogging tools customised to scientists could allow much better collaborative working. One of the problems with wikis is that a standard wiki doesn't allow clear authorship distinctions in a discussion. Using blogs, together with trackback and or comments could be one way of doing this, another is to modify a wiki to allow individual page ownership. Actually, the second option is just a special case of well constructed blog software, and would be easily supportable by Leonardo. We discussed what would need to happen for us to roll out Leonardo to NCAS scientists:

Of course blogging is something that may not come naturally to many of our community, so it's more likely that it'll take off amongst the NCAS students where, for example, we could establish an NCAS wide journal club. We could survey interest at this years Royal Met Soc Meeting.

What next? We're going to build a wee prototype news service, and consider doing the seminars between a couple of candidate sites, and test out the feed constructs in our environment. A few more folk are going to play with Leonardo. We'll revisit this all again in Mid-March.

At the same time (well, actually, over a longer time scale), BADC is going to be moving to a comprehensive content management system (possibly [plone](http:plone.org)). plone has some (if not all) of these features already, we'll need to consider whether we should simply support this activity with plone rather than extend Leonardo (Personally I'll stick with Leonardo, here I'm talking about a solution we may have to roll out to hundreds of users who have complex roles and relationships, plone already has this sort of thing built in).

So, in summary, two new activities,:
* Investigating how to use atomic content better in NCAS, and
* Exploring the possibilities of wide-scale collaborative blogging in our community.