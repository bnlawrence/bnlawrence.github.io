---
layout: post
title: Can we put distributed query to bed please?
last_modified: Tuesday 09 November, 2010
categories: computing
tags: ogc
---
Yesterday I got caught in a vociferous conversation about the benefits of distributed queries. Vociferous because I was trying to convince a bunch of true believers that distributed query is an edge case - the big use case is harvest, index, and efficient query. (This in the context of exploiting metadata). Clearly Google is an existence proof that harvest+index keeps information seekers happy.
Of course that depends on Google understanding the formats, and that there is a smart way to index the data, which either

* depends on the content, or
* the links between the content

to rank the data.

Neither are immediately obviously available with many metadata entries. While we can easily enable Google to consume the content by ensuring that there are html representations any metadata (xml or otherwise), the links may not exist, at least until the html has been around a wee while.

In any case, exploiting structure within the metadata can provide additional ways for prospective users to navigate and discriminate between objects of interest. That means we can use some knowledge of the structure to do a bit better than Google ... for some specific cases. Of course, building tools which can exploit that structure depend on the presence of those structures within the harvested material: if the structures don't exist, you can't use them. By and large then, one can conclude that "structured indexing tools" or "portals" depend on "common structures" in the harvested material. Of course the same argument applies to distributed queries too: you can't distribute a query over remote resources, unless the query can be understood.

The argument we had was that the distributed folks were arguing three points:
1. one can distribute query and it can be mapped to local resources, allowing a wider domain for the query, and
1. one doesn't need google type resources to build portals, just build something that can distribute queries.
1. somehow distributing the query provides more provenance assurance.

You can imagine how I felt about the first: logically it's not different from the harvest case: either the remote resource has to deploy a mapping agent (to take a query and map it onto their resources), or they have to use a mapping agent to expose a version of their local resource in a common format.  So we can ignore that unless it's somehow easier to do the former than the latter ... (we'll get to that).

The second point might nearly be true, but let's unpick it a bit further. I think when one does that, we find out it's not materially different from the first point: if there are enough target systems out there to bother distributing your query, then there are a bunch of resources in the same format ... that could be harvested. You could run your "special query" on a centralised portal, and it would run faster.

Finally, does distributing the query improve the provenance? No! If you think of the harvested material as the index, you can always navigate to the original resource. So that buries the provenance argument.

So the issue comes down to what is easier to do? The argument came up because I just can't see the point of OGC/CSW distributed query in an Atom enabled world. Nor can I see the point of OGC/CSW or OAI/PMH for harvest.  I would argue it's far easier to expose a bunch of resources using Atom than it is to use either CSW or OAI/PMH, and it's much much easier for clients to reliably consume them - even my phone can usefully consume an Atom enabled repository provided the content payload isn't too esoteric. If it's far easier to enable harvest than distributed query, then the benefit of the latter is dubious.  Now add [opensearch](http://www.opensearch.org) to the mix ...
