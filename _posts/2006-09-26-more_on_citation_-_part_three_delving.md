---
layout: post
title: More on citation - part three, delving
last_modified: Tuesday 26 September, 2006
tags: curation ndg metadata claddier
categories: computing
---
[Following on]({% post_url 2006-09-22-more_on_citation_-_part_two_mst %}) ...

In my last example, I considered a (made up) uri which was supposed to be of meaning to the BADC that would allow cleaner citing of our MST radar dataset.
The URI looked like this: badc.nerc.ac.uk/data/mst/v3/upd15032006

There are two obvious components to this uri, the first is a domain address, badc.nerc.ac.uk, the second is the string /data/mst/v3/upd15032006. This latter uri was constructed with a number of local implicit subcomponents. I've included
* "data" as a local identifier to identify the schema for my uri construction.
* "mst" identifies a dataset
* "v3" is a (made-up) version
* "upd15032006" is a (made-up) last modification date. (for some datasets updating through the date, we probably ought to have a modification time in the URI)

Now the format of this uri is rather unimportant. What I'm asserting here is that all these components are **really** useful for citing data. Rather like the concepts of volume and page number and issue date for a journal. Now I don't really care too much how different sites do their uri schemes, but I do care a lot that they contain these concepts.

This uri is an example of what I think of as a "base source". That is, I expect I might well consider citing something within this "database".  We might also worry about what I mean by "downloaded" in that citation ...

I've suggested [elsewhere]({% post_url 2005-12-22-data_citation %}) that a priori one needs a concept of a feature-type (ISO19109) before there is much point citing within a database. In this case what I mean is there is no point citing a "thingie" within a database, unless there is a (generally or otherwise) understood concept of what I mean when I say "thingie". It could be a gene-sequence, it could be a radar-profile, it could be a chemical equation ... but if it's any of those things, somewhere there is a definition of what that means, and a description of the format of the result I'll get when I go get one of those things. That somewhere is (or should be) a feature-type registry (ISO19110) in our world, but it doesn't matter if it's not, the point is that the concepts and some realisation of them must exist for citation within a database to have meaning.

This whole discussion is necessary because we have no a priori concept like page or chapter ... with documents we know what we are going to get back .. .a document ... but if we cite something that is data we don't. This is a problem. For example, take opendap, which is rather popular. If I give you an opendap url, e.g.<blockquote>http://www.cdc.noaa.gov/cgi-bin/nph-nc/Datasets/reynolds_sst/sst.mnmean.nc
</blockquote>

As the [opendap pages say](http://www.opendap.org/user/quick-html/quick_1.html):<blockquote>The simplest thing you can do with this URL is to download the data it points to. You could feed it to a DODS-enabled data analysis package like Ferret, or you could append .asc, and feed the URL to a regular web browser like Netscape. This will work, but you don't really want to do it because in binary form, there are about 28 megabytes of data at that URL.
</blockquote>

So clearly one doesn't want to go pointing at arbitrary urls without the right software and a bit of knowledge about what might exist at the url ... so in practice it's much better to cite a document which tells you about the data that was cited ... but now that document itself had better be as permanent as the data.

That being so, even better might be to have some way in the citation of doing this in a meaningful manner. If we push our MST example a bit further, what do we get?
<blockquote>Natural Environment Research Council, Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth, [Internet], British Atmospheric Data Centre (BADC), 1990-, urn badc.nerc.ac.uk/data/mst/v3/upd15032006, feature 200409031205 [http://featuretype.registry/verticalProfile] [downloaded Sep 21 2006, available from http://badc.nerc.ac.uk/data/mst/v3/]
</blockquote>

where 0200409031205 is yet another made up identifier, which points to an object of type "verticalProfile" in registry http://featuretype.registry ... while I know the identifier afficionados don't like semantics in the identifier, me, I think there should be to help with the meaning of citations, and so in this case it might be timing of the radar profile.

It looks like we have some redundant information,  because I could give the exact url of the data object (which could incorporate the uri), but remember there is no guarantee that the BADC uri and the download url are the same! Also, we may need the feature type uri to be different from either the base-source uri and the download url. (Haven't thought this bit through yet, but it seems conceptually possible).

#### trackbacks (1)
*[Citation, Hosting and Publication]({% post_url 2006-10-20-citation_hosting_and_publication %}) (from "Bryan's Blog" on (on Friday 20 October, 2006)*)Returning to my series on citation (parts one, two, and three). 

My last example was an MST data set held at the BADC, and I was suggesting something like this (for a citation) ...
