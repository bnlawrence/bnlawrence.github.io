---
layout: post
title: Data Citation
last_modified: Thursday 22 December, 2005
tags: badc curation claddier metadata
categories: computing
---
One of the aims of [CLADDIER](/projects/claddier) is to establish methodologies for data citation.  There are a lot of issues, some of which have been addressed before, by projects, like for example [a German pilot experiment](http://www.doi.org/news/TIBNews.html). The way I see it, things we have
to address include:
1. **How do we deal with dataset transience?** My first reaction to this question was to say that one has to make *dataset* publication final - if one wants to change the dataset, one should publish a new version. However, it doesn't take long to realise that while that might make sense for datasets that are in some way canonical, it isn't a general solution. Many scientific datasets are subject to more or less continual revision as more data is collected (for example, covering a wider spatial or temporal domain), or data is revised as quality control is improved.  In the case of most of our data, the latter situation should result in revised datasets - which was the situation I had envisaged - but in a gene database for example, that doesn't make nearly as much sense if one plans to cite the *database*, which one expects to change as new sequences are added and old ones revised. This leads us to1. **How do we cite something within a database/dataset?** Here I think the answer is that database contents should be thought of consisting of features in the OGC/ISO sense; that is, of objects which are instances of some named class which is well defined (with the class definition being well described and lodged in some registry). In that case, all such instance objects should be described by a unique identifier and thus citeable in some way. However, it is important that as such instances are revised/improved/replaced, not only do the new instances carry new identifiers, but the old instances must carry information that they are obsolete.1. **What metadata is needed to publish a dataset (as opposed to, say, a book)?**
In the [ndg](ndg) project, we have been investigating metadata, and we think there are at least four categories of metadata, one needs to deal with, which we have briefly summarised as:
    * A (for Archive): what you need to understand the *format* and *direct content* (i.e. what quantities are actually stored).
    * B (for Browse): what you need to understand the context of the data, and to allow you to choose between otherwise similar datasets (hence Browse).
    * C (for Character or Citation): what you need to support annotation of the data.
    * D (For Discovery): what you need to find the datasets  - broadly similar to the catalogue records in a library, but enhanced because we're dealing with data.1. **If substantial amounts of metadata are needed, how do we deal with the definition of authorship for datasets?** In the four categories above, one might expect the data originator to supply A, and some of the B metadata, but in reality it is rare for a dataset collector to provide enough B metadata ... they have too much institutional wisdom which they fail to encode. Hence, to my mind, dataset publication will involve significant efforts from third parties (not the collector, nor necessarily, the publisher), and that effort will be in the form of material which were it in a standalone document, would be reflected with coauthorship ... I think however, for data, we need a recognised categories of authorship which clearly delineate between the collector/compiler, and the metadata creators, but which reflect the academic aspirations of both.1. **If we want reputable data citation systems, how do we deal with refereeing?**
Clearly we (the BADC) could publish datasets ourselves, and indeed, we intend to do so, however, what guarantee of quality will our users get? Obviously we can do internal quality control, but that can only deal with compliance of the data to some schema, e.g. it has the right metadata, the numbers are within bounds, etc. What we can't do, and what we need refereeing for is to comment authoritatively on, for examples: 
    * the suitability of using a particular instrument to make a specific measurement, or
    * the suitability of a particular algorithm for combining data.1. **How do we deal with persistence of the digital objects that we cite?**
This is a whole topic in itself, but all objects which we expect to be citable, have to have identifiers which are live as long as the objects, and in particular, are independent of the storage mechanism, or the interfaces.

#### comments (4)
*Bruce Westcott (on Monday 15 May, 2006)*
Re: Your Point 3 (above).  I think a more full discussion of this is needed, specifically in light of the ISO-19115 treatment of (mandatory and optional) "core" elements.  The cost/effort your organization invests in metadata should be related to the enterprise business purposes to be served by the metadata, and some broad categorization of these purposes will help producers consider their choices.  A good discussion can be found at http://www.nsdiindia.org/organisation/workg/Documents/mr6.htm

*Bryan (on Tuesday 16 May, 2006)*
Thanks for pointing out the link to the Indian National Space Data Infrastructure. I think the discussion there mirrors the discussions we've had that resulted in our taxonomy ...

It's also obvious that ISO19115 does not cover *all* the metadata elements one needs (which is why the word *metadata* is generally so useless).

*Chris (on Wednesday 19 July, 2006)*
I've been reading around your blog etc for the data citation posts; this seems the best place to hang this comment. Elsewhere you refer to ISO 690-2 with the Stats Canada reference (but don't allow comment on that post). It's not quite clear to me if ISO 690-2 from that site (with a copyright date of 2004) is exactly the same as ISO 690-2:1997, or if it is part of a revision-in-progress!

I'm particularly interested in Parts and Contributions (ie any portion less than the whole dataset). ISO 690-2 suggests that a part is a dependent portion that requires the context of the "host document"; if it could be treated independently it would be defined as a contribution. Does tend to treat a database like a document.

Probably of more interest in many ways (at least they are more specific) are the National Library of Medicine Recommended Formats for Bibliographic Citation Supplement: Internet Formats, July 2001, available at http://www.nlm.nih.gov/pubs/formats/internet.pdf. Section 3 of that document has a substantial discussion with the same 3 key concepts (entire, part and contribution); it differs in some details from 690-2, but is more complete and consistent.

They suggest you should cite the whole database "when it is desirable to make the reader aware of the existence of a particular database... and by whom it was produced". From this it seems clear that you could have a stable citation of a changing database (eg the CIA World Factbook)... but in that case you should probably not be using the contents of the database in any detail to bolster your argument (this bit feels like quoting a "work" in FRBR terms).

They say "if you wish to cite an individual record or other portion of a database or system, see... Parts of... or Contributions to..."

Parts are "separately identified sections or portions... such as individual records". They "generally are constructed by the database/system builders and do not have a distinct authorship". Contributions are "separately identified sections or portions of databases... that are provided by individuals or organisations other than the database builders and thus have a distinct authorship" (you will note the difference from the 690-2 definition). "Examples of contributions are citations to journal articles residing in a bibliographic database" (it's possible this bibliographic orientation has affected the whole approach).

The parts and contributions elements don't work well in the face of change, other than including the date of citation (inadequate). Peter Buneman has been doing some work on citation of portions of a database in the face of change for IUPHAR, and has given a paper on his suggestions for citation in these circumstances at a database conference, see "How to cite curated databases and make them citable", http://homepages.inf.ed.ac.uk/opb/homepagefiles/harmarnew.pdf  . The key argument to me is that a citation on which an argument is based should lead you to the version cited!

(BTW Note the link to CLADDIER in this post doesn't work, I think you need to take out the RL bit...)

*Chris (on Wednesday 19 July, 2006)*
No doubt it's bad form to comment on one's own comment, but I found out a bit more about the ISO 690 situation. I had not appreciated (but should have) that ISO 690-2:1997 is actually part 2, adding information about citing electronic sources to ISO 690:1987. I think the CollectionsCanada (not StatsCanada, sorry) version of 690-2 you mention in another post is an edited reduction of the offical standard, and not an updated version. The Subcommittee involved is currently working on an update to part 1, a draft is available at http://www.collectionscanada.ca/iso/tc46sc9/docs/sc9n413.pdf . I could not see any reference to any activity on updating part 2. So this leaves us with an offical standard that is not entirely useful.
