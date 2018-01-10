---
layout: post
title: On SQL and XML
last_modified: Tuesday 18 September, 2007
tags: ndg computing metadata
categories: computing

---
I'm going to write about [CouchDB](http://couchdb.org/) sometime, there seems to be enough hype for me to record something for my own benefit (no, not you dear readers, some of this blog writing is mainly for me :-) But before I do, in some of the current furore is interesting in it's own right, not just because of CouchDB per se. For example, [Assaf Arkin](http://blog.labnotes.org/2007/09/12/conflicting-reads-and-writes/):
<blockquote>Relational databases have failed the software industry in much the same way XML, Java and client-server failed the software industry. In other words, no failure to see here, move along. Those are all excellent technologies for solving a wide range of problems. Just that there are some problems they?re particularly poor at solving.
</blockquote>

Take home message? There is no one solution to all problems!

Of more relevance to the subject of this post:

[Damain Katz](http://damienkatz.net/2007/09/system_overload_1.html):
<blockquote>SQL is great when you have highly structured data. The problem is much of the data we generate day to day isn't easily extractable into carefully planned schemas and are challenging to represent and query in a SQL databases. That means lots of useful data that could be stored and queried ends up unused or lost because we don't have the time and resources to build schemas to store them. 
</blockquote>

and
<blockquote>I'll tell you the one thing XML is good for (and I could be wrong because I really don't know many alternatives), it's good for marking-up textual documents. For anything else, ESPECIALLY PROGRAMMATIC INTERFACES, it's a goddamn nightmare. I finally saw the light. JSON also has warts, but it has been an absolute dream in comparison.
</blockquote>

Both of which points I had understood vaguely, but now absolutely understand after slaving away on the NDG over the last couple of months. I wish I had **known** these things before, it may have saved us significant grief.

Now, do I believe that XML is the right tool for data models?

#### trackbacks (1)

*[Whither service descriptions]({% post_url oldblog/2008-01-22-whither_service_descriptions %}) (from "Bryan's Blog" on (on Tuesday 22 January, 2008)*)

... there is a long tail of activities for which the abilities of web services to open up interoperabilty is being hindered by the difficulty in both service and data description ...
