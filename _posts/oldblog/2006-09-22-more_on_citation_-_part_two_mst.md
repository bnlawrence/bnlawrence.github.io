---
layout: post
title: More on citation - part two, MST
last_modified: Friday 22 September, 2006
tags: claddier curation metadata
categories: computing
---
[Yesterday]({% post_url oldblog/2006-09-21-more_on_citation %}) I started talking about how I think one should cite data we hold on behalf of someone else. That discussion isn't yet finished, issues of citing within datasets, and other "standards" for citation still need to be discussed (including how we parse and store them [electronically]({% post_url oldblog/2006-01-20-bibliographic_references_iso19115_and_numsim %})), and I still haven't gotten to addressing any of my points from the [original blog entry]({% post_url oldblog/2005-12-22-data_citation %}). Before we go there, it's helpful to discuss our [mst](http://badc.nerc.ac.uk/data/mst/) radar data set.

The [mst](http://badc.nerc.ac.uk/data/mst/) radar dataset consists of data from 1990 to the present. Over time the data format and methodology of data collection (i.e. how the raw radar returns are converted to, for example, wind) have changed. Nonetheless, one can imagine someone wanting to cite a timeseries extending back to the beginning or a particular days data, or perhaps the whole thing.

Do we publish the data?  We will hold the data in perpetuity, and make it available for scientific use, so in some senses yes [^1](http://en.wikipedia.org/wiki/Publish) thinks so: "*Publishing is the activity of putting information into the public arena. ..."*] (In the same sense as we publish the ashoe data). I'm going to get back to this issue of what I think publication should be for data.

Meanwhile, how should one cite this? Still using the U.S. National Library for Medicine recommendations ([pdf](http://www.nlm.nih.gov/pubs/formats/internet.pdf)), we should probably consider this as an online database.

Things to think about:
* Our first issue is: "Who is the author?". I think this is a case where this is a NERC facility, so it is NERC.
* What is the title? Well at the BADC we call it "The NERC Mesosphere-Stratosphere-Troposphere Radar Facility at Aberystwyth", but actually I think we should consider renaming the dataset to something which is n't about a facility, or a funder. Better would be the "The Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth"
* What is the urn, what is the update date, what is the actual url of the data? Actually, despite being a data centre, the answer to none of these three questions is especially obvious. It should be ... but that's part of what [claddier](/projects/claddier) is about, to expose these sorts of issues.

The whole thing would then be, for example:<blockquote>Natural Environment Research Council, Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth, [Internet], British Atmospheric Data Centre (BADC), 1990-, urn http://badc.nerc.ac.uk/data/mst/, [updated Mar 15 2006, downloaded Sep 21 2006, Available from http://badc.nerc.ac.uk/getdata/data_browser/badc/mst/data/mst-products-v2/cartesian]
]
</blockquote>

Well, that's obviously horrible. Let's just for a moment imagine our retrieval system was a bit more citation friendly.
* We might, for example, have a clean urn which helps identify the version and length of the data. Ideally it might look something like: `badc.nerc.ac.uk/data/mst/v3/upd15032006`. In which case we don't need the updated phrase.
*  We might have a cleaner url to the location of the data, which hides the method of download

In which case the following would be legitimate:<blockquote>Natural Environment Research Council, Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth, [Internet], British Atmospheric Data Centre (BADC), 1990-, urn badc.nerc.ac.uk/data/mst/v3/upd15032006, [downloaded Sep 21 2006, available from http://badc.nerc.ac.uk/data/mst/v3/]
</blockquote>

(In all this, note that in all this, today and yesterday, I have completely removed any reference to the physical location of the database (eg, London, or in our case, The physical location is **so** irrelevant. It made sense to include when one could physically go to an archive and get a copy of a document, but you can't do that with our data. Coming here will get you nothing. Further, we could move the badc from Chilton to Oxford tomorrow, and it would make **NO** difference to the accuracy of the citation. Why include it then? I think the location convention has to die when applied to electronic retrievals).

Well, that's enough for now. Next we'll consider citing into that archive, and some of the other issues ...

#### trackbacks (1)
*[Citation, Hosting and Publication]({% post_url oldblog/2006-10-20-citation_hosting_and_publication %}) (from "Bryan's Blog" on (on Friday 20 October, 2006)*)Returning to my series on citation (parts one, two, and three).

My last example was an MST data set held at the BADC, and I was suggesting something like this (for a citation) ...

#### comments (2)
*Chris Rusbridge (on Tuesday 07 November, 2006)*
'Our first issue is: "Who is the author?". I think this is a case where this is a NERC facility, so it is NERC.'

I've been very interested by your series of blogs on data citations (including later ones; I wasn't sure where best to place this comment). If we are to change behaviours, we need to look at the motivating factors for scientists to do difficult things with data, regarding it as important as the words they write in their articles. I think data citations are a critical part of this. But all your examples, as in the quote above, imagine only a corporate author. This might be appropriate for MST data (although shouldn't the scientific leadership get some credit for the work they do in this particular form of endeavour rather than others?), but we know there are cases where at least parts of (or contributions to) the data are made by individuals that are worth crediting.

Would you consider adding examples with personal authorship, and also finer granularity, in your later thoughts on this?

*Bryan (on Tuesday 07 November, 2006)*
Certainly personal authorship is where we want to go ... but regrettably nearly all our datasets are not organised so the actual authors pop out (for example, individual's datasets are generally aggregated into thematic programme holding datasets).
That's one of the key changes we in the archive need to achieve ...
but yes, I will eventually get personal author examples up!
