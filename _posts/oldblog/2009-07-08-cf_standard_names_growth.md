---
layout: post
title: cf standard names growth
last_modified: Wednesday 08 July, 2009
tags: curation cmip5 cf
categories: computing environment
---

Adequate descriptions of scientific data depend on precise descriptions of what the data actually are. At the heart of that are what we call "phenomenon descriptions", which at BADC and in much of the climate community, we handle using "[CF](http://www.cfconventions.org) standard names".

Alison Pamment here at BADC is the international CF standard names manager. Today she posted an update to the CF standard names list, and buried in her email to the [CF list](http://mailman.cgd.ucar.edu/pipermail/cf-metadata/) was this:
<blockquote>The current version is now version 12, dated 6 July 2009. This has been a
very large modification to the table - 804 new names, 67 aliases, 19
clarifications to definitions and 3 modifications to units - almost
doubling the length of the table to just over 1900 entries.
</blockquote>

This specific large update is part of the preparation for [CMIP5](http://www.wmo.ch/pages/prog/wcrp/documents/WCRPnews_20081015.pdf), and represents a huge amount of work. We don't do nearly enough to recognise this sort of essential underpinning work, without which we couldn't build automatic tools to find data ... and without which, scientific users couldn't have confidence in knowing exactly what a particular variable measured (or simulated). Well done Alison, and all the folk who worked hard proposing and defining the names!

#### comments (2)

*John Graybeal (on Saturday 18 July, 2009)*

I totally agree with the essence of your post -- this is essential underpinning work, and poorly recognized and funded.

And yet...and yet.  The latest and whole CF process points to the fragility of such a labor-intensive development of standard names.  Many name requests have to be delayed in the process, and many more are never proposed, because of the inevitable delays and/or belief the system will be swamped.

As automated systems begin producing data in many variations, what is the scheme by which the CF standard name process can be made to scale?

*Bryan (on Monday 20 July, 2009)*

Hmmm. This requires a longer reply that I don't have time to deliver right now.

However, I think we all agree that scientists can't work with quantities they don't understand, and generally, folks need to agree on definitions to be sure they are talking about the same thing ...

... so requiring soundly based, generally agreed definitions is a given. What's wrong now is a) we've only just started to try and do it (so we have a huge backlog), b) it's not well resourced or recognised, and c) we don't have the software systems in place to maximise the use of intelligence and minimise the drudgery.

In the future? Well, of course there is scope for more automated reasoning, but it has to be based on fundamentals, agreed by humans ...
