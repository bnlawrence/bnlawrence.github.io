---
layout: post
title: From ORE to DublinCore
last_modified: Friday 09 May, 2008
tags: metadata ndg iso19115 metafor
categories: computing
---
Standards really are like buses, there's another along every minute, exactly which one should you choose? I'm deep
in a little "standards review" as part of our MOLES upgrade. I plan to muse on the role of standards another day, this post is really about Dublin Core!

You've seen me investigate atom. You know I've been delving in ISO19115.  You know I'm deep into the OGC framework of GML and application schema and all that. You know I think  that Observations and Measurements is a good thing.

Today's task was to investigate ORE a little more, and the first thing I did was try and chase down the ORE vocabulary, which surprisingly, isn't in the [data model](http://www.openarchives.org/ore/datamodel) per se, it lives in it's [own document](http://www.openarchives.org/ore/vocabulary). Anyway, in doing so, I discovered something that I must have known once, and forgotten: Dublin Core is itself an ISO standard (ISO15836:2003). Of course no one refers to DC via it's ISO roots, because they're toll barred (i.e. the ISO version costs money), wheras the public  [Dublin Core](http://dublincore.org/) site stands proud.

What amazes me of course is that Dublin Core and ISO19115 use different vocabularies for the same things, even though Dublin Core preceded ISO19115. What was TC211 thinking? Of course ISO19115 covers a lot more, but why wasn't ISO15836 explicitly in the core of ISO19115? The situation is stupid beyond belief: someone even had to convene [a working group to address mapping](ftp://ftp.cenorm.be/PUBLIC/CWAs/e-Europe/MMI-DC/cwa14856-00-2003-Nov.pdf) between them. I've extracted the key mapping [here](static/2008/05/09/iso2dc.pdf).

Mind you, Dublin Core is evolving, unlke ISO15836 which by definition is static. We might come back to that issue. Anyway, the current DublinCore fifteen which describe a Resource look like this:

<table border="1" rules="all"><tr><td align="center" colspan="1">&nbsp; **term**  &nbsp;</td><td align="center" colspan="1">&nbsp; **what it is**  &nbsp;</td><td align="center" colspan="1">&nbsp; **type** &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; contributor  &nbsp;</td><td align="center" colspan="1">&nbsp; a contributors name  &nbsp;</td><td align="center" colspan="1">&nbsp; A &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; coverage  &nbsp;</td><td align="center" colspan="1">&nbsp;  spatial and or temporal jurisdiction, range, or topic  &nbsp;</td><td align="center" colspan="1">&nbsp; B &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; creator   &nbsp;</td><td align="center" colspan="1">&nbsp; the primary author's name  &nbsp;</td><td align="center" colspan="1">&nbsp; A &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; date  &nbsp;</td><td align="center" colspan="1">&nbsp; of an event applicable to the resource  &nbsp;</td><td align="center" colspan="1">&nbsp; C &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; description  &nbsp;</td><td align="center" colspan="1">&nbsp; of the Resource  &nbsp;</td><td align="center" colspan="1">&nbsp; D or E &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; format  &nbsp;</td><td align="center" colspan="1">&nbsp; format, physical medium or dimensions (!)  &nbsp;</td><td align="center" colspan="1">&nbsp; F &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; identifier  &nbsp;</td><td align="center" colspan="1">&nbsp;  reference to the resource  &nbsp;</td><td align="center" colspan="1">&nbsp; G &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; language  &nbsp;</td><td align="center" colspan="1">&nbsp; a language of the resource  &nbsp;</td><td align="center" colspan="1">&nbsp; B (best is RFC4646) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; publisher  &nbsp;</td><td align="center" colspan="1">&nbsp; name of an entity making the resource available  &nbsp;</td><td align="center" colspan="1">&nbsp; A &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; relation  &nbsp;</td><td align="center" colspan="1">&nbsp; a related resource  &nbsp;</td><td align="center" colspan="1">&nbsp; B &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; rights  &nbsp;</td><td align="center" colspan="1">&nbsp; rights information  &nbsp;</td><td align="center" colspan="1">&nbsp; D (G)  &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; source  &nbsp;</td><td align="center" colspan="1">&nbsp; a related resource from which the described resource is derived  &nbsp;</td><td align="center" colspan="1">&nbsp; G &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; subject  &nbsp;</td><td align="center" colspan="1">&nbsp; describes the resource with keywords  &nbsp;</td><td align="center" colspan="1">&nbsp; B &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; title  &nbsp;</td><td align="center" colspan="1">&nbsp; the name of the resource  &nbsp;</td><td align="center" colspan="1">&nbsp; D &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; type  &nbsp;</td><td align="center" colspan="1">&nbsp; nature or genre of the resource  &nbsp;</td><td align="center" colspan="1">&nbsp; H &nbsp;</td></tr>

</table><br/>

We can see the "types" of the Dublin Core elements have some semantics which reduce to
<table border="1" rules="all"><tr><td align="center" colspan="1">&nbsp; A  &nbsp;</td><td align="center" colspan="1">&nbsp; free text (names) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; B  &nbsp;</td><td align="center" colspan="1">&nbsp; free text (best to use arbitrary controlled vocab) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; C  &nbsp;</td><td align="center" colspan="1">&nbsp; free text (dates) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; D  &nbsp;</td><td align="center" colspan="1">&nbsp; really free text &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; E  &nbsp;</td><td align="center" colspan="1">&nbsp; grapical representations &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; F  &nbsp;</td><td align="center" colspan="1">&nbsp; free text (best to use MIME types) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; G  &nbsp;</td><td align="center" colspan="1">&nbsp; free text (best to use a URI) &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; H  &nbsp;</td><td align="center" colspan="1">&nbsp; free text, B, but best to use [dcmi-types](http://dublincore.org/documents/dcmi-type-vocabulary/) &nbsp;</td></tr>

</table><br/>

The last vocabulary consists of Collection, Dataset, Event, Image, InteractiveResource, MovingImage, PhysicalObject, Service, Software, Sound, StillImage, Text. (Note that StillImage differs from Image in that the former includes digital objects as well as "artifacts").

#### comments (1)

*[Simon Cox](http://www.csiro.au/people/ps205.html) (on Sunday 11 May, 2008)*

Bryan - You have the chronology mixed up, and your notion of "roots" is off the mark. The primary development period of both DC and ISO 19115 is the late 1990's. 

DC emerged from an attempt by librarians to tame the web, a little. It defaults to library based options in a number of places - e.g. publisher/contributor (creator was almost "author"). It was propagated through papers in D-Lib and elsewhere, and the Dublin Core Metadata Inititiave gradually developed a web-site for self-publishing its standards. It was also published as an IETF RFC and later through ISO as an afterthought - these were not the target or the roots. 

ISO 19115 is essentially a harmonization of map-and-image metadata standards (FGDC, ANZLIC, etc), developed by the same national government bodies who were also coming together in ISO/TC 211 in the mid nineties. Its origins in systematic dataset/series description are pretty obvious. Sure, ISO 19115 was not formally published until 2003, but it was well-known within the community before that. 

So DC did not really precede ISO 19115. There was a little traffic flow between the folks involved DC and ISO, though it was frequently perceived as a Mars/Venus relationship. ISO with its 100's of elements, and anorexic DC. ISO with its humungous records and elaborate typing, and edgy DC - part of the "semantic web" where anyone can say anything about anyone (or similar). 

