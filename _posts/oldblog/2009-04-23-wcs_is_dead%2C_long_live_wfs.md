---
layout: post
title: WCS is dead, long live WFS
last_modified: Thursday 23 April, 2009
categories: computing
tags: ogc
---

For many years Steve Hankin has been asking me why we want WCS when OPeNDAP
has similar functionality, and many, many, working implementations. For just
as many years I've argued that OPeNDAP has/had three major flaws:1. It wasn't easily securable (soon not to be a problem),1. Didn't have good relationship with metadata, and in particular,1. Was all about syntax, not semantics - you subset by array index, not
the desired portion of a semantically described domain (e.g
give me array elements 4-6 compared with give me the array elements
which lie between latitudes 40 to 60 degrees).

but I've also admitted that WCS had some flaws too:1. It might be easier to secure, but only because it (might) be easier to
implement your own stack ...1. Nearly no working implementations.

You would have thought the latter would be a show stopper, and indeed it is, but
the first flaw for OPenDAP has also been a show stopper ... until now. So, we
are going to deploy OPenDAP soon ... but we still want to deploy something
which addresses semantic subsetting as well. So we've been investing in
WCS ...

... but today I heard a presentation that filled me with horror. Very
well presented, but still horrific. The plan for the future evolution
of WCS is so flawed that I can't see it surviving!

Fortunately, the talk on WCS was followed by one on WFS (declaration: from
someone in my group) which outlined how WFS can deliver much of the same
functionality as WCS. It remains to be seen whether it can deliver a
semantic version of OPenDAP ... I hope so, in which case it'll be
"WCS is dead, long live WFS".

So predictions, should either of them read this:
* Rob Atkinson will smile: He's been claiming for a while that WCS was, or would be, only a
convenience API to a WFS!
* Steve Hankin will role his eyes, and think: "oh no, not another WXS ..."

#### comments (3)

*Jon Blower (on Wednesday 06 May, 2009)*

What was the well-presented-but-horrific talk?

We both agree that the WCS world is in a terrible state, and that the ongoing work on securing OPeNDAP is a Good Thing. Certainly we lack a standard way of securing OPeNDAP but it doesn't seem to me that WCS is inherently any easier to secure.  Without SOAP you could secure both OPeNDAP and WCS using servlet filters (or Python/WSGI equivalents) or proxy servers equally well (or perhaps badly), even if you don't have access to the source code in question.

I also don't believe that the semantic subsetting issue is a big deal in practice.  Provided that the OPeNDAPped data uses the CF conventions (admittedly you're stuffed if they don't), it's fairly easy to write a tool that takes geospatial coordinates and generates the necessary array indices - and there are loads of tools that do it already. The WCS syntax is just sugar, and humans don't generate URLs without tools anyway.  (I'm not saying that semantic subsetting is bad - but this feature alone isn't very persuasive for me.)

WCS actually hides some very important information - you can't predict how big the response from a WCS will be, whereas you can with OPeNDAP.  This can be very important when trying to optimize a system.

To sum up, you can build a WCS on top of OPeNDAP, but you can't build OPeNDAP on top of WCS.  I've tried for a number of years now but I still can't think of a really good reason to adopt WCS...

So I say long live OPeNDAP!  It's great that you're able to deploy DAP servers now.  As for WFS, the jury's out.  Actually it isn't - the court is only just in session. ;-)

*Simon Cox (on Wednesday 20 May, 2009)*

I think Jon has it in a nutshell: "you can build a WCS on top of OPeNDAP" - i.e. use WXS precisely as a facade over OPeNDAP to provide the semantic sugar. While I agree that WCS appears to be heading for a rathole, other WXS interfaces allow mixing of XML/GML for the envelope and metadata, with a link to a suitable protocol for the main payload.

OPeNDAP is a lower-level protocol. It was developed in the scientific community amongst 'friends' who are used to think in terms of array indices, etc.

OTOH WXS is (supposed to be) about providing higher-level interfaces, abstracting the semantics which are common to all geographically sensitive disciplines - i.e. standardizing the X-domain stuff - and also providing standard patterns for domain specialization.

*Rob Atkinson (on Thursday 04 June, 2009)*
:-)
