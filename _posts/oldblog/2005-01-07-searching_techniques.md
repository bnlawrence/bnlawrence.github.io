---
layout: post
title:  Searching Techniques 
last_modified: Friday 07 January, 2005
tags: ndg
categories: computing
---

Serendipity is a strange thing. Two days ago we started a discussion on the internal NDG mailing list about what should or shouldn't be in our B metadata elements (the schema is nearly fixed, but would we allow XHTML markup within some elements?). The discussion broadened into what B metadata is for (B is *browse* metadata in our NDG lexicion). We were discussing what belonged in
the browse metadata and what belonged in extra (E) metadata held alongside the data. This morning, I came across [Derek's blog on Search is not Search](http://nothing-more.blogspot.com/2005/01/search-is-not-search.html), which prompted me to a) read the paper it refers to (of which more below), and b) organise my own thinking a bit more.

My own thinking is, of course, about searching, browsing, locating and utilising environmental data. In the NDG, we have distinguished between searching (utilising harvested D-discovery metadata), and browsing (utilising local to the data B-browse metadata). The B metadata I envisage will help users understand what the data is, and how it relates to other datasets. As such it includes both contextural data about the data (I say data about data to avoid the IR guys writing it off as simply indexing material) and linking data to other similar datasets. (Some more info about B can be found at [in my blog]({% post_url oldblog/2004-11-30-b-schema %}) and in various documents on the [NDG site](http://ndg.nerc.a.cuk).)

I have to confess that I've not read much of the searching literature before, and have mainly relied on a number of exercises we've undertaken asking users about what they want and how they think as well as useful conversations with our peers (for example, the [nasa global change master directory](http://gcmd.gsfc.nasa.gov/), GCMD, folks reported at a meeting I attended that roughly half their web-site users find datasets via keyword and half via free text search). 

[Derek](http://nothing-more.blogspot.com/2005/01/search-is-not-search.html) refers to [a paper by Teevan et. al., 2004](http://haystack.lcs.mit.edu/papers/chi2004-perfectse.pdf), in which they discuss how people perform personally motivated searches. To some extent, that's what I mean by serendipity: here we are in NDG discussing searching issues, and a (not quite random) blog puts me onto something really relevant. Anyway, Teevan et al provides a number of interesting snippets:<blockquote>... participants used keyword searches in only 39% of their searches, despite almost always knowing their information needs up front.
</blockquote>

(As an aside, this is comforting confirmation of the rough statistics from the GCMD folks, and made me feel better about not having read much literature on this). Teevan et al go on to discuss how the other 61% seem to go, which is in a pattern they call *orienteering*. Orienteering is a process of moving by small steps towards something the user(searcher) knows exists. <blockquote>The process  involves using both prior and contextural information to narrow in on the actual information target ...
</blockquote>

They contrast to something they call *teleporting*<blockquote>When a person attempts to teleport, they try to jump directly to their information target. Teleporting represents the behaviour many search engines try to support ...
</blockquote>

In the NDG lingo, I think *teleporting* corresponds to *discovery* and *orienteering* to *browsing*. One of the advantages of browsing that Teevan et al found was<blockquote>... that it gave people a context for their results. We saw our participants use the context of the information they found to understand the results and to get a sense of how trustworthy those results were. Context was often essential in helping the participant understand that they had found what they were looking for ...
</blockquote>

They went on to observe that<blockquote>orienteering had an added advantage over simply presenting keyword searches with some surrounding context: it allowed participants to arrive at their result along a path they could understand. This process enabled them to understand exactly how the search was performed, and consequently accept negative results.
</blockquote>

I think this is very important. When looking for environmental data, much of the difficulty is knowing what was in the thinking of the person who archived the data, often times you can find things by browsing in the vicinity of similar data sets ... which explains why some searches don't help - you've not thought of the right search term, but worse, your search term hasn't even picked up anything vaguely relevant. It is very useful to get into the vaguely relevant regime, and then move to where you want to be. (However, this is just like the information searching equivalent of least squares minimisation, with all the attendant risks of local minima/maxima etc).

In the implications section of their paper, they comment that<blockquote>Orienteering's prevalence could be due to the fact that search engines do not permit effective teleporting. For example, keyword search engines often fail when confronted with overly specific queries ... while search engines are expanding to include meta-data ... a better way of incorporating metadata is to use metadata for browsing.
</blockquote>

One of their suggestions was:<blockquote>... next generation source tools could learn users habitually used or trusted sources, and make them accessible ...
</blockquote>

So, it has been a useful exercise reading through this, and it has confirmed my impression of the importance of the browse phase in obtaining data. It has also emphasised to me the importance of being able to make incremental steps on the way to finding data. The state of the art at the moment for data is google/or GCMD followed by the 
[Live Access Server](http://ferret.pmel.noaa.gov/Ferret/LAS/ferret_LAS.html) or an OGC web service, so we have much yet to do ...