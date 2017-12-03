---
layout: post
title: A citation and provenance system for climate modelling
last_modified: Monday 02 March, 2015
categories: computing
tags: cmip
---
What would a modelling citation and provenance system need to do?

I've thought about this [before]({% post_url oldblog/2013-08-23-gavins_proposal %}), more than [once]({% post_url oldblog/2013-08-13-confusion_on_dois %}), but this is a first principles use case description.

We start from the assumption that I will be accessing files from a local "copy" of some files of data, and that I have a subset of files that I've used for a particular problem.

So, I have to describe that  compendium of data, which means I need a tool which identifies which data I used ... It needs to be able to do something notionally like:
<pre>
makecite "list of files" &gt; provenance.list</pre>
What's actually in *provenance.list* should be a list of permanent identifiers to data actually used, not the data itself.

I expect I will want to *cite* this provenance.list in my publication, so the provenance list itself should be a (published) dataset, with an identifier. So, there needs to be a way of describing and publishing my provenance.list.

Now, you reading my paper, need to be able to obtain and use that provenance list.  Assuming my provenance.list has a DOI, let's assume getting it is straightforward (it should be small).

Now you need a tool which allows you to use the provenance list to **get** the relevant data or **check** that you already have it, something like:
<pre>
citeget provenance.list</pre>
which should result in a set of files , or
<pre>
citecheck provenance.list</pre>
might confirm that you have those files. Alternatively (or additionally)
<pre>
citeupdate provenance.list</pre>
might give you (or me) an updated set of versions for the same datasets ...

That user story is very file-centric.  We could probably make it more "data-centric" by, for example, including opendap urls to bounding boxes, but as it stands it's very simple, and hopefully doable (none of these tools actually exist!)

This story doesn't address credit, but it does address scientific repeatability!

So what to do about credit?  We could of course pull out of the list of permanent identifiers a list of contributing simulations.

What to do with it?  Do we believe it will be possible to go from those simulation identifiers to appropriate "traditional papers"? In principle yes, in practice no. We can expect to do this exercise before the appropriate formal scientific model and simulation description papers have even been written!

So, can one use "data" DOIs? It rather depends on whether we believe an appropriate data publication system is in place and on an appropriate granularity. However it too may not be in place when the citation is necessary.

However, that's a very traditional way of thinking, that we have to show the modelling group credit by putting a traditional citation to them in my paper. If one has a more [altmetrics](http://en.wikipedia.org/wiki/Altmetrics) focus, we should be happy that the metrics can be calculated, we don't have to have the right way of doing it a priori!

#### comments (1)
*[Tobias Weigel](https://www.dkrz.de/about-en/Organisation/staff/tobias-weigel) (on Thursday 05 March, 2015)*
Bryan,

I like these ideas. They are very much in line of what I imagine we can do with PID collections once a significant amount of files in ESGF bears globally resolvable identifiers (and as you know we are already working on this) [1]. In addition to the low-level atomic files we will also provide dataset identifiers and provide rich landing pages that provide the necessary context and browsing facilities. The tool examples you give are exactly what I'd like to see, including the versioning service.
Going beyond the file-centric view would also be possible by attaching so-called 'fragment identifiers' or query parameters to the aggregated identifiers and then put an additional service between identifier resolution and file that does some processing (e.g. a WPS).

In the end, these make good examples for value-added services towards our ESGF end-users; there are some scalability concerns down the road but a prototype service should be adequate to judge the overall usefulness. You are also right that this is not so much about giving credit, but rather about repeatability: At that point where someone puts an identifier on this sort of "shopping cart" of cross-ensemble files, we may not have all the required information to give correct credit. But I can very well imagine that such a collection can be referenced in an article nonetheless; just perhaps not directly in the formal reference list, but then again, it doesn't have to. It would be another small but significant step to getting flaky URLs out of article footnotes.

Best, Tobias

[1] http://mms.dkrz.de/pdf/klimadaten/poster/AGU2014-Weigel-PIDs-ESGF.pdf
