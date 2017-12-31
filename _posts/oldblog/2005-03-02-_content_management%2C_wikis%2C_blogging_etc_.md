---
layout: post
title:  Content Management, Wikis, Blogging etc 
last_modified: Wednesday 02 March, 2005
tags: badc blogging
categories: computing
---

A number of threads are banging around in my mind. Here at the BADC we are running a number of bits of software that all do a bit of the same
task. We run
1. [Leonardo](http://jtauber.com/leonardo) for blogging.
1. [BSCW](http://bscw.fit.fraunhofer.de/) (Basic Support for Cooperative Working], for collaboratory activities, including private *workspaces* and file sharing.
1. A number of [kwiki](http://kwiki.org) based wikis,
1. and of course we have our comprehensive (and complicated) [web site](http://badc.nerc.ac.uk).

The boundaries between these pieces of software and their target communities is rather blurred. From time to time we set up project web pages. If the project is at all active, we end up creating BSCW pages for it, wiki pages for it, and static html. Before long no one in the project knows where to put material.

We're about to add a new project site, and update an older one. At the same time, our existing major web site (the [badc](http://badc.nerc.ac.uk)) is beginning to creak at the seams: the number of pages is multiplying, we have duplicates, maintenance problems, no history management. All classic stuff for a proper content management system.

Obviously the question arises as to whether we can simplify our environment?

In the case of the [badc web site](http://badc.nerc.ac.uk), I think we need a proper content management system, and there is no getting around it. We've just kicked off a project to look at replacing it with [plone](http://plone.org). That project will run for quite a while, because our existing content is complex; driven in part by a number of databases and scripts. The relationships between what we do and what plone could do need to be well understood before we would be able to start developing the new website.

Our BSCW *workspaces* are very popular with the research community who primarily use it for sharing documents and data for (especially) field campaigns. It's not obvious to me that it is used for more than a private file repository (for each community), so it's not clear that we couldn't replace BSCW with something which has the same functionality (Although personally, I do like the ability to know if someone has downloaded a file that I have uploaded).

I've invested a good deal of time in Leonardo, because I thought (and still think) that blogging could be of significant importance for the academic community who could use it to improve collaboration.  We've tried in the past to encourage them to use products like BSCW (and simpler bulletin board products) to engender discussion and questioning, but it's not really worked. 
One of the reasons why I don't think academics much like bulletin board type collaborations is that it is ok for question/answer type situations, but not so good for the gradual development and sharing of ideas. It's the latter process that blogging is so good for, and when coupled with categories, comments and trackback, can allow the efficient exchange of information. Of course, one of the limitations is that sometimes one wants to keep ones thoughts private to a small community, and that's not so easy with standard blogging software. So, before Leonardo can really take off in this context we need to add support for
* trackback, comments and categories, and
* the ability to limit access to some pages to some parts of the community.

As many have said before, the difference between a community blog and a wiki is nearly impossible to identify.  Again, Leonardo fills this space in a nice way, with a relatively seamless transition between content which is (perhaps) slowly varying (the wiki material), and diary content which is time-stamped and evolves by addition, not correction (the blog material). If Leonardo was to replace our existing wikis though, we'd have to add two crucial pieces:
* Version Control, and
* Multiple Users.

Of course, we need multiple user support to limit blogging conversations to a small community (I imagine that being done with some categories being limited to some sort of access control list). This implies that beyond what we need for academic (and other) blogging, the only additional thing Leonardo would need to move into our wiki space would be good support for version control.

Given we're moving to plone and Leonardo, can we remove some others of the pieces from the mix?  The most obvious candidate for improvement would be to replace all the adhoc websites with instances of a complex wiki that would allow one to have immutable pages, and mutable pages, and access control. If this wiki software  allowed the uploading of documents as well as wikipages, and could hold some documents in a private space, it could certainly replace those situations where we have three different products in the same space. 

It's even possible with the above spec, that it could replace the BSCW software. However, for those applications where people simply want to share documents and collaborate, BSCW still seems to have all the functionality we need, and it has a happy user community. Now is not the time to think about shutting it down.

kwiki doesn't quite meet all those requirements, so I've spent some time looking at wikis, and while I wouldn't claim to have done a comprehensive job looking, two good candidates (in terms of their feature support) would be: 
* [MoinMoin](http://moinmoin.wikiwikiweb.de/MoinMoin), and
* [MediaWiki](http://en.wikipedia.org/wiki/MediaWiki)

However, when push comes to shove (and I spent much of this afternoon shoving MoinMoin) there do seem to be enough little limitations that we'd have to do a little engineering to get around those problems. Of course being in python, MoinMoin has a significant advantage (we have relevant expertise, and it will probably be more easy to engineer it to fit in our access control environment).

We have to start a new website in the near future, and upgrade another, and we have clear choices: If we look at what is required for Leonardo to fill this space, we can see that it's all on the roadmap for Leonardo, but it's not going to be here soon. MoinMoin is much closer to what we want now, so we'll probably go with that.

Annoyingly then, it looks like we'll still have four things to maintain, but at least they'll be targetted more clearly:
* Sophisticated Web Site (plone)
* Less Complicated Web Sites and Community Wikis (MoinMoin?)
* Blogging (Leonardo)
* Out and Out file sharing (BSCW)

It should be that these new project based websites should be much easier
to setup, maintain, and use. That'd be a result!
