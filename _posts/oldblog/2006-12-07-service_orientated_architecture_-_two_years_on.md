---
layout: post
title: Service Orientated Architecture - Two Years On!
last_modified: Thursday 07 December, 2006
tags: ndg
categories: computing

---
I've been blogging for slightly over two years. After I wrote my SOA
article earlier today, I realised that my [second ever blog post]({% post_url oldblog/2004-12-20-SOA %}) was on SOA. [Then](http://savas.parastatidis.name/2004/12/19/d5f3232e-759a-4064-8685-22bc8fe1f5df.aspx), as [now](http://savas.parastatidis.name/2006/12/02/1dd88c4b-0336-48be-94d2-424f57af3b8b.aspx), I had been reading [Savas's blog](http://savas.parastatidis.name).

Unfortunately, in the intervening time two things have happened:
* I have spent more and more time down the SOA hole, to the detriment of my Atmospheric Science, and 
* I forgot this:
<blockquote>Share schema and contract, not type (avoid the baggage of explit type, allow the things on either end to implement them how they like).
</blockquote>

This was in a discussion of distributed objects versus service orientated architectures. I should have reread that entry and the links within (especially [this one](http://savas.parastatidis.name/2004/12/19/d5f3232e-759a-4064-8685-22bc8fe1f5df.aspx)) before [wading into deep waters]({% post_url oldblog/2006-12-01-no_silver_bullet_exists %})! It would have helped focus my argument.

Going back then we have from the [original article that inspired my second blog](http://hyperthink.net/blog/PermaLink,guid,3e6852e9-26fb-4561-90c5-1357cbf026cd.aspx):
<blockquote>The motivation behind service-orientation is to reduce the coupling between applications.
</blockquote>

Well, I'm not so sure about that, I think it's really about what Lesley Wyborn in her SEEGRID III presentation called "decomposition" - and the reason why we want decomposition is so that we can have "orchestration". So it's actually about
reducing the coupling **within** applications so the components of application(s) can be reassembled to do new and interesting things - potentially across system and/or organisational boundaries. Having done so, we might still want strong typing (although [this](http://hyperthink.net/blog/CommentView,guid,1c407222-5849-4fd0-a026-341633859105.aspx) paints an interesting perspective on typing and the use of xml schema).

Anyway, I need to get back to thinking about other activities here for a while and forget about SOA details. Fortunately Simon Cox sent me a photo which puts SOA in a proper perspective, and he's kindly allowed me to put it up here:
![Image: IMAGE: static/2006/12/07/SOA.jpg ](/assets/images/2006-12-07-SOA.jpg)

#### trackbacks (1)

*[Whither service descriptions]({% post_url oldblog/2008-01-22-whither_service_descriptions %}) (from "Bryan's Blog" on (on Tuesday 22 January, 2008)*)

... there is a long tail of activities for which the abilities of web services to open up interoperabilty is being hindered by the difficulty in both service and data description ...

#### comments (2)

*[Allan Doyle](http://think.random-stuff.org/FrontPage/archive/2006/02/24/trackback-rss-and-opml) (on Friday 08 December, 2006)*

Some very incomplete thoughts about your posting.

- SOA is very much oriented towards "enterprise", not towards "mashup". If we're building for the enterprise, I suspect we may all have been better off sticking with CORBA and not relearning the same thing many different ways. Trouble is, personally, I'm not so interested in "enterprise".

- The more complex things are, the more strongly typed, the less you will see "reassembly to do new and interesting things". That's why there were no CORBA mashups, and I suspect there will be no SOA mashups.

- Maybe strong typing is a form of avoiding the difficult task of making data more accessible. It's easier to throw a complex schema at someone and say "here, do something with this" than it is to figure out how to distill things down to a more user friendly representation.

*[Allan Doyle](http://think.random-stuff.org/FrontPage/archive/2006/02/24/trackback-rss-and-opml) (on Sunday 10 December, 2006)*

In perhaps one of the strangest suggestions I've ever seen, this guy at ZDnet thinks Steve Jobs should step in and "make SOA a hit".

http://blogs.zdnet.com/service-oriented/?p=775
