---
layout: post
title: No Silver Bullet Exists
last_modified: Monday 04 December, 2006
tags: ndg computing
categories: computing

---
Another bout of web services "religious war" has broken out again. We've been here [before]({% post_url oldblog/2006-02-24-web_service_wars %})! This time it's based on one [funny and accurate](http://wanderingbarque.com/nonintersecting/2006/11/15/the-s-stands-for-simple/) diatribe about SOAP. The resulting frenzy in the blogosphere has yielded some quality 
comments, and even some [declarations of victory](http://www.dehora.net/journal/2006/11/the_war_on_error.html) by those who think REST is the
 one true way.

Amongst the furore, there were four key comments:
1. [Nelson Minar](http://www.somebits.com/weblog/tech/bad/whyoapSucks.html) whose opinion on soap web services has to be respected states:
<blockquote>The deeper problem with SOAP is strong typing. WSDL accomplishes its magic via XML Schema and strongly typed messages. But strong typing is a bad choice for loosely coupled distributed systems. The moment you need to change anything, the type signature changes and all the clients that were built to your earlier protocol spec break. And I don't just mean major semantic changes break things, but cosmetic things like accepting a 64 bit int where you use used to only accept 32 bit ints, or making a parameter optional. SOAP, in practice, is incredibly brittle. If you're building a web service for the world to use, you need to make it flexible and loose and a bit sloppy. Strong typing is the wrong choice.
1. This is backed up by [Joe Gregorio](http://bitworking.org/news/Nelson_Minar_on_SOAP):
</blockquote>
<blockquote>... if you don't have control of both ends of the wire then loosely typed documents beat strongly typed data-structure serializations.
1. And finally, Sam Ruby [pointed out](http://www.intertwingly.net/blog/2006/11/17/The-H-stands-for-Hyper) that it's just much easier to handle problems with
developing restful applications. He also makes the following throw away:
</blockquote>
<blockquote>In addition to all the architectural benefits of REST, as well as all the pragmatic experience the web has built up over time with caching and intermediaries? benefits and experience that WS-* forsakes ...
1. [Gunnar Peterson](http://1raindrop.typepad.com/1_raindrop/2006/12/rest_security_o.html) makes the point that it's not just about unsecured applications ([via Sam Ruby](http://www.intertwingly.net/blog/2006/12/01/Equal-Time)):
</blockquote>
<blockquote>... But if you are going to say that REST is so much simpler than SOAP then you should compare REST with HMAC, et. al. to the sorts of encryption and signature services WS-Security gives you and then see how much simpler is.
</blockquote>

Which brings me to me why I wanted to say something. It's just not as simple as some might say, and even Roy Fielding didn't claim that REST solved all the problems in the world! I wonder how
many of the vocieferous RESTful advocates have actually read [his thesis](http://roy.gbiv.com/pubs/dissertation/top.htm)?

Some choice quotes:
<blockquote>Some architectural styles are often portrayed as ?silver bullet? solutions for all forms
of software. However, a good designer should select a style that matches the needs of the
particular problem being solved. Choosing the right architectural style for a
network-based application requires an understanding of the problem domain and
thereby the communication needs of the application, an awareness of the variety of
architectural styles and the particular concerns they address, and the ability to anticipate
the sensitivity of each interaction style to the characteristics of network-based
communication.
</blockquote>
<blockquote>The REST interface is designed to be efficient for large-
grain hypermedia data transfer, optimizing for the common case of the Web, but resulting
in an interface that is not optimal for other forms of architectural interaction.
</blockquote>
<blockquote>REST is not intended to capture all possible uses of the Web protocol standards. There
are applications of HTTP and URI that do not match the application model of a distributed
hypermedia system.
</blockquote>

So where do I stand on all this?  In practice, some of the applications of this stuff are simply not "distributed hypermedia applications" (which is what REST was designed for). Some of them really are distributed object activities (the OGC things), and some of the assumptions of REST are violated in the grid world - for example, I'm not terribly interested in automatic
caching when my data objects are huge -10 GB+-, and write performance is as important is read performance, and latency doesn't matter because machines are doing the work. (I'm happy to provide quotes from Fielding's thesis where he lists these things as reasons for REST!)

But we don't just do big science data moving at the BADC. In trying to get my thoughts together on this, I came up with the following classification of communities based on what they are trying to do:

<table border="1" rules="all"><tr><td align="center" colspan="1">&nbsp;        &nbsp;</td><td align="center" colspan="1">&nbsp;  Strong Typing &nbsp;</td><td align="center" colspan="1">&nbsp; Weak Typing &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; Tight Coupling  &nbsp;</td><td align="center" colspan="1">&nbsp; Grid (Implicit<sup>1</sup> Typing) &nbsp;</td><td align="center" colspan="1">&nbsp; "Secured"<sup>2</sup> Web Applications &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; Loose Coupling  &nbsp;</td><td align="center" colspan="1">&nbsp; OGC (Explicit<sup>3</sup> Typing)  &nbsp;</td><td align="center" colspan="1">&nbsp; "Web 2" &amp; Mash-ups &nbsp;</td></tr>

</table><br/>

where
1. Implicit Typing: Nearly all grid applications are file based at the "usage" point or use OGSA/DAI. Either way the applications are tightly coupled to an implicit knowledge of exactly what the contents
of the data resources are - the semantic content of the data resources is known to the (human) builder of workflows. I'm not aware of any real attempt to do late binding of 
services based on the semantic content[^1] of the data resources.
1. Secured: Here I'm implying more than just the use of https as a transport mechanism. There is
usage of sophisticated AAA mechanisms which include role-based access control - but in
the final analysis the actual processes or transactions are relatively loosely coupled.
1. Explicit: The OpenGeospatial Community has built very sophisticated mechanisms of building
detailed descriptions of computational objects (features) which match onto the features of
the real world. These objects have detailed structures, multiple attributes, maybe decomposable, and
have implicit interfaces which [afford]({% post_url oldblog/2006-07-27-on_processing_affordance %}) behaviour.

(As an aside,  note that in general the tightly coupled systems have strong security. Also that recent work within the OGC community has been building SOAP bindings and strong security into the OGC web service paradigm. It's unfortunate that that work is being done in the context of a project
known as GeoDRM ... which has all sorts of bad connotations ... mostly it's about GeoAAA[^2], not DRM!). 

*All the really good arguments for REST lie in the bottom right corner of the table ... and to be fair, its also where the majority of web usage should lie too!*

The reality is that the availability of tooling plus the type of task makes decisions for me! We're building things that are a mash-up of web-services (which we secure using WS-security) and plain old XML type services (which we secure using gatekeepers that exploit WS-*). We do do some REST things. We're not using much "pure" grid tooling, because the python tooling isn't mature enough yet. But we will. 

So there is no silver bullet right now! For me, any sort of  [fundamentalism](http://ianfoster.typepad.com/blog/2006/11/the_web_thought.html) sucks. The final word belongs to [Nelson Minar](http://www.somebits.com/weblog/tech/bad/whySoapSucks.html):
<blockquote>Truly, none of this protocol fiddling matters. Just do something that works.
</blockquote>

(**Update**, 4th Dec. Aaargh: the material in italics above somehow got lost presumably because I missed the last seconds of my wireless time in the great southern  [blackspot]({% post_url oldblog/2006-11-30-wireless_internet_blackspot_-_australia %}).)

[^1]: Where I'm meaning semantic content at the level of detail exposed by, for example, GML Application Schema

[^2]: Authentication, Authorisation, Access


#### trackbacks (2)

*[Service Orientated Architecture - Two Years On!]({% post_url oldblog/2006-12-07-service_orientated_architecture_-_two_years_on %}) (from "Bryan's Blog" on (on Thursday 07 December, 2006)*)

I've been blogging for slightly over two years. After I wrote my SOA article earlier today, I realised that my second ever blog post was on SOA. Then, as now, I had been reading Savas's blog. ...

*[Whither service descriptions]({% post_url oldblog/2008-01-22-whither_service_descriptions %}) (from "Bryan's Blog" on (on Tuesday 22 January, 2008)*)

... there is a long tail of activities for which the abilities of web services to open up interoperabilty is being hindered by the difficulty in both service and data description ...

#### comments (2)

*[bill@dehora.net](http://www.dehora.net/journal) (on Monday 04 December, 2006)*

"by those who think REST is the one true way."

Not me. You need to read what I said in the context. It started out with roughly, REST is a tinkertoy, and worked its way to here. 

*Bryan (on Wednesday 06 December, 2006)*

Sorry Bill ... but it's quite hard to get all your posts in context. Especially that one :-)
