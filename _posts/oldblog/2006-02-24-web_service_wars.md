---
layout: post
title: web service wars
last_modified: Friday 24 February, 2006
tags: ndg computing
categories: computing
---
The web-service wars have broken out again. [Tim Bray](http://www.tbray.org/ongoing/When/200x/2006/02/22/WS-Flurry) has a nice summary. The bottom line is well captured by  [Dare Obasanjo](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=ca19f6b9-8afd-4e93-b4f6-8c3beee8d088) thus:
<blockquote>At best WS-* means you don't have to reinvent the building blocks when building a service that has some claims around reliability and security. However the specifications and tooling aren't mature yet. In the meantime, many of us have services to build.    
</blockquote>

and that is of course why I'm interested - I have to know when this stuff is mature (if ever). People keep asking why we aren't using this or that "grid" or "web-service" technology, and the reason is always 
1. It doesn't do what we want it to do, and
1. It's not ready for a developer who doesn't have a mate in their core team!

In the UK, [OMII](http://www.omii.ac.uk) is trying to do something about hardening these packages, but they're not hardening the ones we want ... so, we're still trying to use WS-Security that interoperates between python and java installations in our own home-grown security stack.  Well strictly speaking we're not yet using WS-security as per the spec, but our roadmap says we will later this year .... but to do that we'll almost certainly have to engineer a solution in the python web services library ...

Meanwhile, the [OGC](http://opengeospatial.org) webservice stack is far more mature ... but even there, building real web feature servers depends on building real application schema, which are XML schema, and they're subject to [this problem](http://www.25hoursaday.com/weblog/PermaLink.aspx?guid=7a01ea38-6937-453a-bab1-0660f027979c) (also Dare):
<blockquote>After working with XSD for about three years, I came to the conclusion that XSD has held back the proliferation and advancement of XML technologies by about two or three years. The lack of adoption of web services technologies like SOAP and WSDL on the world wide web is primarily due to the complexity of XSD. The fact that XQuery has spent over 5 years in standards committees and has evolved to become a technology too complex for the average XML developer is also primarily the fault of XSD.  This is because XSD is extremely complex and yet is rather inflexible with minimal functionality. This state of affairs is primarily due to its nature as a one size fits all technology with too many contradictory design objectives. In my opinion, the W3C XML Schema Definition language is a victim of premature standardization.
</blockquote>

(Mind you, it's exactly the complexity of XSD that dragged the grid world towards WSRF and yet that's probably got even more folk throwing bricks at it that the simpler WS-stacks).

Sometime soon I'll  be blogging about some of our experiences in the area of trying to build application schema of GML, and issues with the tooling and XML schema etc.

#### comments (1)

*[Allan Doyle](http://think.random-stuff.org/FrontPage/archive/2006/02/24/trackback-rss-and-opml) (on Friday 24 February, 2006)*

I'm not quite sure if this site takes trackbacks. So here's a manual one - http://think.random-stuff.org/FrontPage/archive/2006/02/24/trackback-rss-and-opml

Thanks for stirring up the gray matter.
