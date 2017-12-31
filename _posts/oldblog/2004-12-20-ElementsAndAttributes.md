---
layout: post
title:  Elements and Attributes 
last_modified: Tuesday 21 December, 2004
tags: xml ndg
categories: computing
---

Reminder:
    &lt;element has-attribute="something"&gt; stuff &lt;/element&gt;

Hmmm ... seems rather a lot of my blog entries are going to be along the lines of "look what this other bloke said" ... but anyway, look what [Ned Batchelder](http:///www.nedbatchelder.com) said about [elements and attributes](http://www.nedbatchelder.com/blog/20041218T173942.htm):<blockquote>I say: Use attributes unless you truly need elements. You need elements for a thing if the thing can be repeated, or is itself structured, or has semantics based on its order among its peers.
</blockquote>

This was possibly more of a summary than was warranted, but the essential point was fair. I think the bit that got lost in the summary was that in designing schema, by putting something in as an attribute you are constraining things in a way that is **obvious** (each attribute-type can have at most one value). You can use a schema to constrain something to have only one child of a specific element (I presume), but that's not obvious!  I think being obvious is a **good thing**, after all, many (most?) schema will be used by people who haven't thought about the design decisions, and are reacting to them.