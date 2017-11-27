---
layout: post
title: Identifiers, Persistence and Citation
last_modified: Thursday 29 May, 2008
tags: metadata curation metafor
categories: computing
---
Identifiers are pretty important things when you care about curation and citation, and they'll be pretty important for [metafor](/projects/metafor) too.

At the beginning of the NDG project we came up with an identifier schema, which said that all NDG identifiers would look like this *idowner__schema__localID* e.g.
*badc.nerc.ac.uk__DIF__xyz123* where the *idowner* governed the uniqueness of the *localID*. If we unpack that a bit, we are asserting that there is an object in the real world which the badc has labeled with local identifier *xyz123* and we're describing it with a *DIF* format object. In practice, the object is always an aggregation, so in ORE terms, there is a resource map which has the above ID.

Sam would argue that we blundered by doing that, he thinks the "real identifier" of the underlying object could be thought of as *badc.nerc.ac.uk__xyz123*, and we might be better using a restful convention, so that we wrote it as *badc.nerc.ac.uk__xyz123.DIF*. One of the reasons for his argument is that over time (curation), the format of our description of xyz123 will disappear: for example, we know that we are going to replace DIF with ISO (note that we have lots of other format descriptions of objects as well). This matters, because we now have to consider how we are persisting things, and how are we citing them.  I would argue that the semantics are the same even if the syntax has changed, but I concede the semantics are more obvious in his version, so it's not too late to change, in particular, I suspect it's more obvious that *badc.nerc.ac.uk__xyz123.atom* and *badc.nerc.ac.uk__xyz.DIF* are two views (resource maps) of the same object (aggregation).

Either way, if we take the persistence issue firstly: once we bed this identifier scheme down, we're stuck with it, so what do we do when we retire the DIF format view of the resource? Well, I would argue that we should issue an HTTP 301 (Moved Permanently) redirect to the ISO view. This means we can never retire the IRI which includes the DIF, but we can retire the actual document. Note that this is independent of the two versions of the syntax above.

Secondly, what about citation? Well that's an interesting issue (obviously). You might recall (yeah, unlikely I know), that we came up with a [citation syntax]({% post_url 2007-05-21-citation_and_claddier %}) that looks like this:<blockquote>Lawrence, B.N. (1990): My Radar Data, [http://featuretype.registry/verticalProfile anotherID]. British Atmospheric Data Centre [Available from http://badc.nerc.ac.uk/data/mst/v3/ URN:badc.nerc.ac.uk/localID]
</blockquote>

and we made the point we could use a DOI at the end of that instead. That citation identifier looks a lot like Sam's form (funny that, Sam was sneaking his ideas in while I wasn't looking). A legitimate question is what is the point of the URN in that citation? If the data hasn't moved from *http://badc.nerc.ac.uk/data/mst/v3/* the URN is redundant, and if it has, how do I actually use the URN? Well, I suspect we need to make the URN dereferenceable, and it should be a splash page to all the current views - which is essentially the same functionality that you get from a DOI. The only question then is what handle system one trusts enough: a DOI, an HDL, or do we trust that even if the badc changes our name, we can keep our address and use redirects? In which case we have<blockquote>Lawrence, B.N. (1990): My Radar Data, [http://featuretype.registry/verticalProfile anotherID]. British Atmospheric Data Centre [Available from http://badc.nerc.ac.uk/somepath/badc.nerc.ac.uk/localID].
</blockquote>

with or without the *Available from* which I reckon is redundant, and noting that *http://badc.nerc.ac.uk/somepath* is semantically the same as *doi:*.  Sam's form URI wins (it doesn't necessarily have to, but it's more economical, in which case the argument for using a handler for citation economy alone is given some weight).

Incidentally, [James Reid](http://indolenceandselfdoubt.blogspot.com/) pointed out in [comments](blog/2007/05/21/citation_and_claddier) that the [Universal Numerical Fingerprint](http://thedata.org/citation/standard) which looks like a pretty interesting concept that might also be relevant. I'll get back to that one day.
