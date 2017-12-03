---
layout: post
title: Citation and Claddier
last_modified: Thursday 29 May, 2008
tags: claddier curation
categories: computing
---
For some time now, we've been narrowing down how best to do scientific data citations. Last week we had a [workshop](http://claddier.badc.ac.uk/trac/wiki/workshop) where we concentrated on a number of issues associated with data publication.

I introduced the workshop with some philosophical bumf ([0.75 MB ppt](/assets/talks/claddier_opening.ppt)), and
I'll probably say a lot more about it later, but meanwhile, here I want to concentrate on one aspect: We got some real feedback for my proposals for data citation ([explanation]({% post_url oldblog/2006-10-20-citation_hosting_and_publication %}) and [ISO19139 version]({% post_url oldblog/2006-10-25-citing_data_with_iso19139 %})).

The key criticisms were:
* Too many things that looked like URLs.
* Too much stuff
* The order of material could be reconsidered.
* (and the particular example I've been using could be easier to comprehend if we used examples that weren't quite so pathological).

Recall that we [had]({% post_url oldblog/2006-10-20-citation_hosting_and_publication %}) something that looked like this (no longer a "real" dataset, but simpler as an example):<blockquote>Lawrence, B.N. My Radar Data, [Internet], British Atmospheric Data Centre (BADC), 1990, urn badc.nerc.ac.uk/localID, feature anotherID, [http://featuretype.registry/verticalProfile] [downloaded Sep 21 2006, available from http://badc.nerc.ac.uk/data/mst/v3/]
</blockquote>

where this was essentially<blockquote>Author, title, [Internet], Publisher, Date, URN, feature ID, [Feature Type (from a controlled vocabulary)], [downloaded date, available from Distributor website].
</blockquote>

(It's important to remember that we believe the feature ID (anotherID) is important because we accept that with data we do expect folk to cite into them on a regular basis e.g. a record in a database etc.)

After some mucking around, the breakout group working on this came to something like this:
<blockquote>Lawrence, B.N. (1990): My Radar Data, [http://featuretype.registry/verticalProfile anotherID]. *British Atmospheric Data Centre* [Available from http://badc.nerc.ac.uk/data/mst/v3/ URN:badc.nerc.ac.uk/localID]
</blockquote>

The URN could be a DOI, and in some cases it could be simplified to:
<blockquote>Lawrence, B.N. (1990): My Radar Data, [http://featuretype.registry/verticalProfile anotherID]. *British Atmospheric Data Centre* DOI:doiaddress.
</blockquote>

We have made the following assumption, and simplifications from the previous version:
* We lost [Internet] because we thought it was redundant once the citation has a URL or DOI.
* In this case we are dealing with "formally published" data, and so there is an *expectation* that the data wont change, so the download date is redundant.
    * We thought that a formally published data set should not allowed to grow, later "editions" could provide snapshots. We appreciate that this has implications for numbers of publications etc, but the importance of citing something as it was is preeminent.
    * This is not to preclude folk referencing material on the internet which is changing, but if it is going to be "published" data, then we think we can and should handle it differently.
* We expect the target of the URL or DOI to be a *metadata* document, it should not be a binary target. There is human readable content there which provides more context and the URLs of the actual data. We have left the feature type in there though (as well as the feature ID), because it provides the human parser of a reference list a key hint about the target type[^1].
* There could be a mismatch between a dataset which could have a DOI, and the URI of the feature. (We don't expect all features to have DOIs), and so having two forms of the citation does make sense: the first form above allows a URL which points directly to the feature to be shown (not that does in this example); even if the URL isn't persistent, the URN will be, and the data object should always be accessible via the publisher,URN,featureID combination. I suppose the DOI version is cleaner[^2] provided the feature can be easily obtained from the target of the DOI.

[^1]: I'll probably come back to the "manifest" concept that is coming out of the work of Raj Bose and Guy McGarva in Edinburgh another time, but suffice to say "manifest" could itself be a member of the controlled vocabulary: a featurecollection is itself a feature!

[^2]: despite the fact I hate the way most folk create the things: anyone done the stats for how many DOIs are opaque unmemorable strings that are used in the literature and result in mistranscribed versions  which point nowhere or to the wrong place?


#### trackbacks (1)
*[Identifiers, Persistence and Citation]({% post_url oldblog/2008-05-29-identifiers_persistence_and_citation %}) (from "Bryan's Blog" on (on Thursday 29 May, 2008)*)Identifiers are pretty important things when you care about curation and citation, and they'll be pretty important for metafor too.

#### comments (3)
*[Sean Gillies](http://zcologia.com/news/) (on Monday 21 May, 2007)*
Bryan, ever since I became a librarian, citations are more and more interesting to me. I'm surprised and a bit disappointed that there is not yet a digital citation standard in the humanities either. I also think DOI and other legacy identifiers need to be put out to pasture as soon as possible. URLs win.

*Bryan (on Monday 21 May, 2007)*
(Just to be careful about terminology: there are plenty of digital citation conventions, but not many for citing non-textural targets). It seems there is a religious belief that opaque URIs are more persistent because when you put semantics in a URI (host, site, whatever), you are guaranteeing that they'll break eventually. Me, I think that putting a host name in a URI is daft, but proxying should handle the rest, and the religious belief in opaque identifiers is just that (after all, it's just a clunky form of proxying). But it's a form of religious war that I think I'll just give in and lose, there are only so many windmills out there that I can attend to :-)

*[James Reid](http://toohardtotype.blogspot.com) (on Wednesday 30 May, 2007)*
Bryan - you might be interested in what the social scientific community are doing, both with respect to research data sharing and also cittaion. See http://thedata.org/citation.
