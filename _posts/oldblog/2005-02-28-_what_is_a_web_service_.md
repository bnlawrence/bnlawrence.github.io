---
layout: post
title:  What is a Web Service 
last_modified: Monday 28 February, 2005
tags: computing ndg
categories: computing
---

Last week I gave a kick off talk at the National Institute for Environmental e-Science ([niees](http://niees.ac.uk)) on "What is a Web Service". This was in a meeting on "Developing applications for real-time environmental data" ([DARTED](http://www.niees.ac.uk/events/darted/)).

In that (short) talk, I spent a few minutes on the SOAP v REST wars, because I think the environmental community could be sold a dummy if they put too
much work into mis-applying technologies. In particular, I do believe
that while there is a place for SOAP-ful web services in some applications (we are using them in [NDG](http://ndg.nerc.a.cuk)), in many cases it's simply
not worth the effort. The trick is going to be deciding at project conception whether one needs the full WS machinery or not.

Meanwhile, the war rumbles on ... but here from [soap-is-dead](http://www.manageability.org/blog/stuff/soap-is-dead) via [Ryan Tomayko](http://naeblis.cx/rtomayko/web/) is a key point for us application developers:
</blockquote>

The same article goes on to say:
</blockquote>

Which goes to show that this battle at least is about interoperability. I don't know where the truth is here yet, so I'm happy to keep on reading about it. But it's not all about interoperability, we need to add security to the mix, and if I have the same code base at each end of the wire (or not), using WS-whatever and/or SOAP may be easier than doing it all (over again) RESTfully. As I say, I really don't know how this war will pan out, but I do know that NDG needs X509 (proxy) certificates, and XML-signature, and probably a fair hunk of WSRF (or something like it) ... so if we can have it in a SOAP toolkit, we'll use it!