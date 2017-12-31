---
layout: post
title:  Maths and Blogging 
last_modified: Tuesday 21 December, 2004
categories: academic
tags: blogging
---

Inevitably I'm going to want to put maths in this blog, and if not here, on scientific wikis to support the [CF](cf) (and other) projects.

I've just done a bit of a wander around the internet looking for wiki
solutions, figuring that I'm going to want to extend the Leonardo wiki parser to do this. I started at http://c2.com/cgi/wiki?MathWiki, which as of today is sequence of thoughts from a number of folk, which as the comment at the top says "needs refactoring". Nonetheless, there are a lot of good links off to math wiki projects.

The general consensus is that one needs somehow to support inline latex commands, at least until MathML support is widespread amongst common browsers (hopefully in my lifetime?).

I had a look at two solutions in particular, firstly, the Ian Hutchinson Tex-to-HTML translator ([TtH](http://hutchinson.belmont.ma.us/tth/)), and secondly, Bob McElrath's [LatexWiki](http://mcelrath.org/Notes/LatexWiki).  After spending a few minutes looking at each of them, it seemed that the former probably required the wiki **viewer** to do too much hard work (my KDE 3.3 konqueror didn't render things right first time ...), whereas the latter just worked (via presenting in-line images). The latter has the advantage of being python based too ... (and released under the GPL, the former has a "commercial version with additional functionality", which is a bit of a turn-off). Both have problems with IE, and what you see if you choose to print the page will be very disappointing. 

It seems clear to me that the state of play in this area is far more immature than one might have expected, and might repay some sort of investment in time (although regrettably not by me).
