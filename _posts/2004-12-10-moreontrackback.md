---
layout: post
title:  More on Trackbacks 
last_modified: Tuesday 21 December, 2004
tags: xml computing ndg
categories: computing
---

Yesterday I spent some time implementing the
[trackback spec](http://www.movabletype.org/docs/mttrackback.html) in python. I
know there are [other implementations
in python](http://www.postneo.com/projects/tblib/), but I wanted to really understand this stuff.  I'll put my
implementation up here soon (it's intended for use in Leonardo and
other places), but for now I want to record some of the things that
it got me thinking about.  The key thing I discovered were some
inconsistencies in the spec
* why does the trackback have (uri,excerpt) but the rss response have
(link,description)?
* how extensible is it? I want to put some semantics in my trackback
ping ... to tell the target what sort of trackback is coming in (it might not
be a blog, it might be an analysis programme, or a formal citation).
Thinking this must be a bit of old hat for the semantic web folks, I went off 
on a bit of a google on trackback and semantics.

Firstly, [David Galbraith](http://www.davidgalbraith.org/) on permalinks and
trackbacks [wrote](http://www.davidgalbraith.org/archives/000055.html) in an
undated page (please put the dates on your pages folks):<blockquote>At a recent tech discussion Mark Nottingham pointed out that the real difference between RSS and RDF (the cornerstone of the semantic web initiative) was that RSS was about lists.
 On the one hand this is true, however, the term list understates a crucial
 point about weblogging. Weblogging is designed to deal with nuggets of
 information that an author creates instead of a page that a publisher
 publishes. A permalink refers to a unique item, and in terms of the semantic
 web, indicates a component from which meaning can be extracted.
</blockquote>

Ok, this is fine, but I'm not so interested in web logging per se, I'm
thinking about links between nuggets that carry information about what
sort of link they are (sounds like a candidate for rdf to me already) ...

(As an aside, I found a two year old
[post](http://ln.hixie.ch/?start=1033171507&amp;count=1) about
[pingback](http://www.hixie.ch/specs/pingback/pingback#status) which compared it with trackback.  It seems there aren't many active implementations of
pingback, but if the concept of trackback without semantics is what you want
it would seem simpler to me. Did it catch on? Doesn't seem so!)

I found a useful disscussions of trackback in 2003
[here](http://w6daily.winn.com/001456.html) and
[here](http://wordpress.org/development/archives/27). But better, I found 
[this](http://novaspivack.typepad.com/nova_spivacks_weblog/2003/08/semantic_linkin.html
) describing exactly what I mean, and a comment stated "How in particular
does RDF not work for you as a linking technology"? Which is what I started
thinking as I read the trackback spec anyway - it uses RDF for the
autodiscovery, why not in the ping itself?

That's a very good question, and is a good place to stop for today. My simple
answer is, where is the (extendable) controlled vocabulary which defines the
types of triples that would be allowed? I can easily imagine
    remotelink cites permalink
    remotelink incorporates permalink 
    remotelink headlines permalink
for textural things, but for data, I might want the adjective to be something
which is more akin to a pointer to workflow ... hmmm ... but these would be
meaningless unless a finite group of folk understood and implemented the words
    cites, incorporates, headlines

Clearly, at this point there are some more things I need to read up on,
including, but not limited to:
* foaf: [spec](http://xmlns.com/foaf/0.1/), [description](http://www.foaf-project.org/)
* where the atom spec lies on trackbacks (for text isn't a trackback just an
atom entity?)
* [xlink](http://www.w3.org/TR/xlink-naming)
* [The atom link Model](http://www.xml.com/pub/a/2004/06/16/dive.html)