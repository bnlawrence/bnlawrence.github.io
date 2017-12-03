---
layout: post
title: Citation, Hosting and Publication
last_modified: Friday 20 October, 2006
tags: claddier metadata ndg curation
categories: computing
---
Returning to my series on citation (parts [one]({% post_url oldblog/2006-09-21-more_on_citation %}, [two]({% post_url oldblog/2006-09-22-more_on_citation_-_part_two_mst %}), and [three]({% post_url oldblog/2006-09-26-more_on_citation_-_part_three_delving %})).

My last example was an MST data set held at the BADC, and I was suggesting something like this (for a citation):<blockquote>Natural Environment Research Council, Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth, [Internet], British Atmospheric Data Centre (BADC), 1990-, urn badc.nerc.ac.uk/data/mst/v3/upd15032006, feature 200409031205 [http://featuretype.registry/verticalProfile] [downloaded Sep 21 2006, available from http://badc.nerc.ac.uk/data/mst/v3/]
</blockquote>

which I could also write like this to give some hint of the semantics:
~~~~~ xml
<citation>
<Author> Natural Environment Research Council </Author>
<Title> Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth </Title>
<Medium> Internet </Medium>
<Publisher> British Atmospheric Data Centre (BADC) </Publisher>
<PublicationDate status="ongoing"> 1990</PublicationDate>
<Identifier> badc.nerc.ac.uk/data/mst/v3/upd15032006</Identifier>
<Feature>
<FeatureType>http://featuretype.registry/verticalProfile</FeatureType>
<LocalID>200409031205</LocalID>
</Feature>
<AccessDate> Sep 21 2006 </AccessDate>
<AvailableAt><url>http://badc.nerc.ac.uk/data/mst/v3/</url></AvailableAt>
</citation>

~~~~~

The tags are made up, but hopefully identify the important semantic content of the citation. As I said last time, there is some redundant information there, but maybe not (there is no guarantee that the Identifier and the AvailableAt carry the same semantic content).

Inherent in that example, and my meaning, was a concept of publication, and I introduced that distinction by comparing the MST and our ASHOE dataset (which is really "published" elsewhere). In the library world, there is a concept of "Version of Record", which isn't exactly analogous, but I would argue BADC holds the dataset equivalent of the version of record for the MST, and NASA AMES the equivalent for the ASHOE dataset.

Generally, in scholarly publication, in the past one distinguished between *the refereed literature*, the *published literature* and the *grey literature*[^1], where the latter might not have been allowed as a valid citation.  The situation has become more complicated with the urge to cite digital material, but one of the reasons for the old rules was about attempting to ensure permanence and access - something that is obviously [becoming a problem again]({% post_url oldblog/2005-05-11-citation_decay_rate %}). Thus, we should explore
the concepts of publication and version of record a bit further, before we create new problems. Cathy Jones, working on the CLADDIER project, has made the point in email that *a
publisher does something to the original that adds value*, and I think in the case of digital data, that something should include at least:
* provision of catalogue metadata
* some commitment to maintenance of the resource at the AvailableAt url
* some commitment to the resource being conformant to the description of the Feature
* some commitment to the maintenance of the mapping between the identifier and the resource.

And so, in a reputable article  (whatever that means), or in the metadata of a *published* dataset, I wouldn't allow the citation of a dataset that didn't meet at least those criteria, but once we have met those criteria, then that first version should be the version of record, and copies held elsewhere should most definitely distinguish between the publisher and the availability URI.

Arguably the 2nd and 4th of these criteria could be collapsed down to the use of a DOI. While that's true, I think the use  of both helps the citation user (just as I think it best to do a journal citation with all of the volume, page number and DOI). However, if the publisher does choose to use a DOI, it would help if the holders of other copies did not! Whether or not it's true, the use of a DOI does imply some higher level of ownership than simply making a copy available.

Implicit in my discussion of the metadata of a *published* dataset, is the idea that just as in the document world, we could introduce the concept of some sort of kite-mark or refereeing of datasets. A refereed dataset would be
* available at a persistent location
* accompanied by more comprehensive metadata (which might include calibration information, algorithm descriptions, the algorithm codes themselves etc)
* quality controlled, with adequate error and/or uncertainty information

and it would have been
* assessed as to it's adherence to such standards.

There might or might not be a special graphical interface to the data and other well known interfaces (e.g. WCS etc) ought probably be provided.

Datasets published after going through such a procedure would essentially have come from a "Data Journal", and so in my example above, such the &lt;Publisher&gt; would become the name of the organisation responsible for the procedure, and the &lt;Title&gt; might well become the title of the "Data Journal".

[^1]: Grey Literature:  i.e. documents, bound or otherwise, produced by individuals and/or institutions, but which were not commercially available, and therefore, by implication, not very accessible.


#### trackbacks (3)
*[Persistence]({% post_url oldblog/2006-10-23-persistence %}) (from "Bryan's Blog" on (on Monday 23 October, 2006)*)Just after I wrote my last post on data citation, I found Joeseph Reagle's blog entry on bibliography and citation. He's making a number of points, one of which was about transience. In the comments to his post ...

*[Citing data with ISO19139]({% post_url oldblog/2006-10-25-citing_data_with_iso19139 %}) (from "Bryan's Blog" on (on Wednesday 25 October, 2006)*)I thought I might try and work out exactly what tags I might use for my previous citation example, if I was using ISO19139 (i.e. in the metadata of another dataset).

*[Citation and Claddier]({% post_url oldblog/2007-05-21-citation_and_claddier %}) (from "Bryan's Blog" on (on Monday 21 May, 2007)*)For some time now, we've been narrowing down how best to do scientific data citations. Last week we had a workshop where we concentrated on a number of issues associated with data publication...

#### comments (7)
*[Joseph Reagle](http://reagle.org/joseph/) (on Friday 20 October, 2006)*
Boy, this reminds me of discussions at the W3C on the Semantic Web and persistence of identifiers and such. Commitment to maintain a dated resource at a given URI certainly has my vote! Unfortunately, few do that, but fortunately, there is the WayBack Machine for some resources...

*Chris Rusbridge (on Thursday 30 November, 2006)*
I've got a couple of comments on this (I'm not sure if there is any mechanism for Bryan finding out about these very late comments, but no doubt I'll find out), and I'll make them separately, since I've only got this little box.

Yesterday I was at an AHRC seminar on sustainability of data resources. David Bates and Jane Winters reported in part on a survey on peer review and evaluation of digital resources (URL). In section 4.3.3 on post-publication peer review and evaluation of digital resources, they report on the idea of kite-marking:

"A kitemarking scheme was initially viewed as a potential solution to the problem of identifying authoritative digital resources. A simple mark or logo might be included on an ‘approved’ website, to indicate that the resource had met a particular standard. This suggestion was relatively popular among survey respondents, and was welcomed by a minority of focus group participants.70 However, this project concludes that a kitemarking scheme of this type is not a practicable solution to the problem of evaluating digital resources."

Why did they decide this? They give several reasons, but they concluded:

"... it was felt that kitemarking was not compatible with the concept of peer review: ‘A kitemark implies that there is some body somewhere that is empowered, like the inquisition, to say what’s good and what is bad. Peer review doesn’t work like that … Peer review works by spreading the authority’."

It was also pointed out in discussion that in the journal world, people make quite subtle distinctions about the status and usefulness of peer-reviewed materials. So if something is rejected by the top history journal, but ends up in a much lower ranked journal, it may still be useful. I'm not _quite_ sure how this translates into data, but it tends to speak against a binary system of kite-mark or no kite-mark.

Even though this is a different domain, I found the arguments persuasive, and would suggest not using the "kite-mark" word!*Chris Rusbridge (on Thursday 30 November, 2006)*
Sorry, I didn't fill in the missing bits. The paper was "Peer review and evaluation of digital resources for the arts and humanities", at http://www.history.ac.uk/digit/peer/Peer_review_report2006.pdf.

The Appendixes contain some nice guidelines for reviewers.*Chris Rusbridge (on Thursday 30 November, 2006)*
    * provision of catalogue metadata
    * some commitment to maintenance of the resource at the AvailableAt url
    * [...]
    * some commitment to the maintenance of the mapping between the identifier and the resource.

[...]

Arguably the 2nd and 4th of these criteria could be collapsed down to the use of a DOI."

This is the bit I am arguing with here. A DOI provides no persistence unless the 4th criterion holds, where "identifier" becomes DOI! There's no magic here; the commitment to persistence is still required, and is not provided by the International DOI Foundation.

So, you can provide criteria 2 and 4 yourself by using URLs and re-direct tables (if you need to re-structure your URIs), or you can get someone else to do it by using DOIs, and telling them when the resource "moves" (so they can alter their re-direct tables)!

So I don't think the DOI helps here...

*Chris Rusbridge (on Thursday 30 November, 2006)*
Why am I niggling away at this? Because I think you have an important point here about citations and publication, that you refer back to from later postings... but I have not been comfortable with all of the details.

So this time, "Version of Record". I can't get a good fix on how this is used, although it sometimes seems to refer to the different stages in the publication process. However, NISO has a working party with ALPSP looking at journal versions (see http://www.niso.org/committees/Journal_versioning/JournalVer_comm.html),  and they have a nice diagram that links the Version of Record both with the publication stages, and also with a parallel universe of working paper, conference presentation, blog (!), powerpoint, etc. This is closer, but perhaps still not the relationship that you imply between BADC and the ASHOE dataset.

I'm left wondering if the relationship isn't in fact closer to that between a publisher and a library. BADC holds a (presumably) exact copy of the publisher's resource, for the convenience of its clientele, and some incidental preservation benefits resulting from the redundancy.

Sam Peploe in the talk at the DCC Conference, based on the BADC paper, made it clear that there are resources he has to care about, and others he doesn't have to worry about too much; if he loses them, he can get them again.

If this "library" analogy applies, presumably the BADC would not appear in the citation, other than possibly in the "AvailableAt" field. Even there, it's possible you should be advising people to cite the "Version of Record", ie the NASA URL, with maybe an "AlternativeSource" record linking to BADC?

*Bryan (on Thursday 30 November, 2006)*
Thanks Chris.

Much to think about here.

(I do get automatically notified of content).

I'll be getting back to thinking about this in a couple of weeks.

Cheers
Bryan

*Chris Rusbridge (on Friday 01 December, 2006)*
OK, my last comment, I think, on this page (really these comments relate to the cluster of pages on citations; I apologise if they are a little incoherent, but it's hard to see them all... and mostly I suspect I'm finding myself pretty much in agreement, after a little digging!).

You've caused me to think more about "data publishing". I can't find a good definition of it anywhere. I've tended to be simplistic and think that "making data available to the public" was a good enough definition, but I think your colleague is right and it needs more than that.

That great reference volume in the sky, Wikipedia (caveat lector!) suggests that "academic publishing" consists of two stages: peer review and production. Paul Ginsparg, in one of his "blurbs" about ArXiv (section 3 of the one on peer review at http://people.ccmr.cornell.edu/~ginsparg/blurb/pg02pr.html) is extremely careful not to use the word "publish" for what ArXiv does: he uses "distribute". I remember that careful distinction, which relates in part to the fear that journals would decline to publish articles based on pre-prints that had already been "published".

When it comes down to the lack of peer review in ArXiv, he wrote: "It has been remarked [7] that physicists use the arXiv site and do not appear concerned that the papers on it are not refereed. The vast majority of submissions are nonetheless submitted in parallel to conventional journals (at no "cost" to the author), and those that aren't are most frequently items such as theses or contributions to conference proceedings that nonetheless have undergone some effective form of review. Moreover, the site has never been a random UseNet newsgroup-like free-for-all. From the outset, a variety of heuristic screening mechanisms have been in place to ensure insofar as possible that submissions are at least of refereeable quality. That means they satisfy the minimal criterion that they would not be peremptorily rejected by any competent journal editor as nutty, offensive, or otherwise manifestly inappropriate, and would instead at least in principle be suitable for review (i.e., without the risk of alienating or wasting the time of a referee, that essential unaccounted resource). These mechanisms are an important -- if not essential -- component of why readers find the site so useful: though the most recently submitted articles have not yet necessarily undergone formal review, the vast majority of the articles can, would, or do eventually satisfy editorial requirements somewhere. Virtually all are in that grey area of decidability, and virtually none are entirely useless to active physicists."

I have also hear it said that simply belonging to the High Energy Physics community is itself subject to pretty stringent peer review; you don't get time on an accellerator without it!

So, after all this, is BADC the publisher of the MST data? I think so: I suspect there are at least two stages of peer review (NERC in setting up and continuing to fund the project, and BADC in applying some, even if minimal, quality checks to the data). You organise the data, supply metadata, and make it available to the "public". What else could a publisher possibly do? (Ginsparg, in the article above, makes it clear that peer review doesn't certify the research as "correct"!)

Perhaps there should be a wikipedia page on data publishing??
