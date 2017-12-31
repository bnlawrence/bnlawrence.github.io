---
layout: post
title: Trackback
last_modified: Tuesday 21 December, 2004
tags: computing
categories: computing
---

Every day I learn something more about blogging, and every day I can see how utterly useful it will be in a real atmospheric science application, not just as a means of communication amongst computer geeks (myself included I suppose).

In particular, I've just discovered the moveable type trackback [spec](http://www.movabletype.org/docs/mttrackback.html). The beginners 
[guide](http://www.movabletype.org/trackback/beginners/) states:<blockquote>In a nutshell, TrackBack was designed to provide a method of notification between websites: it is a method of person A saying to person B, "This is something you may be interested in." To do that, person A sends a TrackBack ping to person B.
</blockquote>

and goes on to define:<blockquote>TrackBack ping: a ping in this context means a small message sent from one webserver to another.
</blockquote>

The explanation for why is all in the context of blogging:<blockquote>Person A has written a post on his own weblog that comments on a post in Person B's weblog. This is a form of remote comments--rather than posting the comment directly on Person B's weblog, Person A posts it on his own weblog, then sends a TrackBack ping to notify Person B.</blockquote>
<blockquote> Person A has written a post on a topic that a group of people are interested in. This is a form of content aggregation--by sending a TrackBack ping to a central server, visitors can read all posts about that topic. For example, imagine a site which collects weblog posts about Justin Timberlake. Anyone interested in reading about JT could look at this site to keep updated on what other webloggers were saying about his new album, a photo shoot in a magazine, etc.
</blockquote>

Why am I suddenly so interested?  Well, the NDG metadata taxonomy includes a class **C** for **Character annotation**. We envisaged wanting to be able to comment on a dataset which would allow the data provider to harvest the comments and display them to the data users. This is exactly what trackback is all about.

There is a [trackback wiki](http://www.intertwingly.net/wiki/pie/TrackBack) with some interesting opinions, including [Philip Win's one](http://w6daily.winn.com/001456.html) and  [James Grimmelmann's](http://research.yale.edu/lawmeme/modules.php?name=News&amp;file=article&amp;sid=1155) piece. Some quotes from the latter that are especially good include:<blockquote>What I love about Trackback is that it turns links from being one-way creatures into being truly bidirectional ... What this means is that you can only really read conversations on the Web the same way you read blogs: by going backwards in time. You find something interesting, and you chase links backwards from it ... (and only backwards)... Trackback completely cuts this Gordian knot. There are ordinary links in blog entries: these ones take you to the thing being commented on, backwards in time. But if you Trackback-ping when you make these links, you've created Trackback links in the stories you're commenting on. These Trackback links take readers from the commented-on to the comments, forwards in time. You can run down an entire conversational tree, from start to finish, just by reading Trackback links after you read blog entries. 
</blockquote>

From a data point of view, this means we can publish a dataset, and then users of the data can publish calibration data and experience, and someone finding the data after discovery can go forward from there to user experience ...
