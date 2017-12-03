---
layout: post
title: confusion on dois
last_modified: Tuesday 13 August, 2013
categories: computing

---
The discussion on twitter and my blog about DOIs and CMIP5 and what did and didn't work reflects a bunch of different perspectives.

These include not only:

* the modeller who wants a metric of their data usage (the producers)
* the scientist who wants to accurately describe the data they used in some study (the consumers),

but also (at least):

* the organisation/group/individual responsible for data publication (as opposed to Publication),
* those of us who distinguish between publication and Publication (e.g. see [Lawrence et al 2011](http://dx.doi.org/10.2218/ijdc.v6i2.205)),
* journals in which one might want to use DOIs,
* service providers for DOI machinery, and
* those of us trying to persist the AR5 and CMIP5 archives.

As usual, all these folk are using the same words to describe different objectives (this behaviour has been constant since the dawn of time, and
[a thread]({% post_url oldblog/2004-12-22-VerifyableStatements %}) on this blog since I started blogging, [as has citation]({% post_url oldblog/2005-12-22-data_citation %})). It would help a lot if folk defined what they meant by "we want DOIs".

When done, which I'll try to do a bit below, we find that from some of those perspectives, the problem seems tracticable and easy (e.g. Gavin's "it can't be *that* hard"), but if we take them all on board, it gets hard (e.g. Stephen's "These problems are being worked on but not on the scale we'd need for CMIP5").

Apologies in advance. I didn't have time to write anything shorter.

Taking these in turn. I think

* The modeller ("producer") wants identifiers for their data, which others cite, and wants those citations to be countable (and perhaps, where those citations occur, to be identifiable). They want this to work over time, and they know that a URL wont work, since a) their data appears at more than one URL, and b) URLs aren't persistent, so where their data appears in a URL changes with time. Everyone wants the granularity of these objects to be "appropriate" for credit.
* The scientist ("consumer") wants an identifier-like tool which unambiguously defines what data they used, and some scientists would like this to show when similar data was used. (That is, I used some data, and you used some data, and most of our data was the same, so it'd be nice that the fact that most of our data was the same was somehow recognisable easily via the identifiers).  Many consumers also respect the necessity for giving producers credit. If we unpick this requirement even further, we find sub-requirements:
    * The urge to have an appropriate citation to the data used in a particular work, and
    * The urge to have a record of what data was used in a particular work, and maybe even
    * The urge to have a manifest that could take part in some future workflow.
* The publisher wants to be able to handle getting the data "out there" efficiently, and with the minimum of human intervention. Sadly, dealing with version control is low down on their requirements ("what, you changed one minor thing, and I have to republish tens of thousands of files, *and* you want the old ones to remain?").
* We already have a defacto concept of digital publication (here defined as "being available on the internet") in citation: journals allow you to use URLs, and everyone knows those are "weak" citations, and no one counts them (properly). We also have Publication (here defined as "available after going through a review process and persisted"). Published items appear in bibliographies and are counted by citation services.
* Journals are picky about what they allow in reference lists, for good reasons which are about trying to make sure that "references" are "obtainable". If we want data p/Publications in reference lists, then we need to ensure that they meet appropriate standards - otherwise they can (IMHO should) languish in footnotes and parentheses like URLS.
* Digital Object Identifiers are **expected** to be persistent, so that if the location of the object changes, you can still dereference the object. That's pretty much the entire purpose of them ... so if we are going to stand up a DOI, we have to have some machinery behind them that take the DOI reference to the actual digital objects. That machinery has to be reliable and predictable, which in software terms means it has to have well defined characteristics and maintainable software.
* In the context of CMIP5 we already have the Data Reference Syntax(DRS, [pdf](http://cmip-pcmdi.llnl.gov/cmip5/docs/cmip5_data_reference_syntax.pdf))? that provides a consistent URL naming scheme, which if the hostname is left off, unambigously defines the data files, and some pre-defined aggregations. In the context of the IPCC AR5 archive (the CMIP5 data available on the cut-off date), we want to have DOIs for the simulations. We think simulations (which include ensembles) are about the right granularity. To make this manageable, in both cases we have some versioning rules, and for DOIs, we expect the data to have passed enough quality control that it is unlikely to need multiple versions; that really matters if we want to persist at petascale.

Ok, now to revist the recent discussion, this from Gavin:
<blockquote>(1)  The problem with doi as a standard for data was recognised years ago - it is good for static objects that don't have relationships with other objects. Data is not like that - it gets updated, corrected, rescaled, redated etc.
</blockquote>

and earlier, when prompted to distinguish between a URL and a DOI:
<blockquote>(2) doi can be static through time, URLs not; neither deal with versioning; URL is at file level, not dataset
</blockquote>

and these:
<blockquote>(3) The 'defined quality' issue for DOIs is a red herring. There is no way to judge this objectively, and so no system to do it will be satisfactory. As we have seen with the DKRZ project, it takes too long and makes the process useless.
</blockquote>
<blockquote>(4) Access to the data is a definite goal, tracking what was done is a definite goal, and automatic tracking of where data was used is a definite goal.
</blockquote>

We also have these from [Aslak Grinsted](https://twitter.com/AGrinsted):
<blockquote>(5) I would like to see the DOI being used purely to point at what data files we are talking about. I don't think it should contain any other info at all. Nothing about quality or relationships to other data series.
</blockquote>
<blockquote>(6)  i would sacrifice persistence if it fails QC and storage is an issue. I know this makes science less reproducible, but there is nothing preventing people from using the data at the moment. They just struggle with citing it. When data is removed because of a QC issue then we would still have a records of its relationship to new versions. Thus the system can inform the user "sorry this file is no longer available because of some issue. A corrected version of the file can be found here."
</blockquote>

I think you can immediately see that Aslak and Gavin both have consumer perspectives, and legitimate ones at that, but they need to be discussed in the larger context ...

So let's take those points above:

**1)** *The problem with doi as a standard for data was recognised years ago - it is good for static objects that dont have relationships with other objects. Data is not like that - it gets updated, corrected, rescaled, redated etc.*

Sorry Gavin, you're plain wrong. Data doesn't change. But yes, it might get superseded, processed, etc, leading to new data objects. What you all want to happen *for a digital object identifier* is that when you have **used** data, we know what data you have used. You often want someone discovering that data to find it's been superseded, but if science is to be reproducible, then you want to (always be able to) find the original data. It is an additional requirement to find relationships between data objects, something to layer on top of a reliable identifier system. What you've asked for here is precisely what the linked data paradigm was invented to address, but linked data is all about making typed links between digital objects, and yes, they need identifiers. So, DOIs are not the solution to the problem you outline, but they (can) be a key part of the solution (as can other types of identifiers).

**2)** *doi can be static through time, URLs not; neither deal with versioning; URL is at file level, not dataset*

Gavin wrote this in answer to a question of mine that was prompting him to say something like this. It was intended to be a bit of a rhetorical trap, and given the 140 character limit, it worked in that Gavin's answer is a wee bit wrong. DOIs are **meant** to be static in time, but they should point to landing page which itself points to one or more URLs to the object in question. One expects to change the landing page if the URL where the objects can be found change ... (and indeed, one can, by convention add other stuff to the landing page, like links to related objects, such as a new version).  It's important to note that URLs can point to anything you can dereference on the web, and that could include a file system directory (as opposed to a file), so neither URLs nor DOIs know the difference between a file and a collection of files. Those who allocate the DOIs get to choose the granularity (or level of aggregation) by convention.

The point being that **all** a DOI is, is a mechanism for making a link between some notion of a resource (the object with the DOI identifier as described by the landing page), and it's current location (URL). Thus it turns out that if you don't want persistence and a resource description, there is NO DIFFERENCE BETWEEN A URL AND A DOI. (However, there is one extra thing usually involved with a DOI, and that's an individual or organisation that allocates the DOIs and manages the landing pages, we might call them the publisher! A publisher can add value to a DOI, but the notion of publication can be maintained with URLs as well, so it's not that big of a discriminator ... except that the publishing world generally recognises that there **is** a publisher for a DOI, whereas, there **might** be one for a URL, and so not anyone can allocate a DOI).

**3)** *The "defined quality" issue for DOIs is a red herring. There is no way to judge this objectively, and so no system to do it will be satisfactory. As we have seen with the DKRZ project, it takes too long and makes the process useless.*

Room for disagreement here. My definition of quality control for the AR5 archive is that "the data is not likely to be superceded because of easily identifiable errors in the format and/or science". Experience tells us that MIP data is **often** superceded, and simple QC catches most of those errors. Most is good enough here. The QC is **not** about science quality per se, and we **can** define the sort of QC we want. However, Gavin is right, the process for CMIP5 has been too slow, and that's partly because no one is paying for this (so no one has a day job to do the QC), and partly because the modelling groups themselves have never bought into it properly (so necessary metadata isn't always finished).
* I'm sure Gavin could respond and say that the metadata we asked for was not what was needed, and to some extent he'd be right, but the bottom line here is we need consistent metadata, and right now [this](http://q.cmip5.ceda.ac.uk) is what we asked for ... and it's not possible to keep chopping and changing requirements and deliver a service ...

**4)** *Access to the data is a definite goal, tracking what was done is a definite goal, and automatic tracking of where data was used is a definite goal.*

We agree on those goals. The question is how to achieve them. I hope it's clear that we can't keep every version of the data (and for some data, there have been lots of versions). So, ideally we don't have citations to superceded data in the literature. The problem is how to do it automatically. True automatic tracking would require a truly persistent data architecture, and a truly persistent workflow toolset. We don't have either ... and frankly, I don't think complete automation is the answer ... Stephen's comment addressed some of the reasons why (if an arbitrary bag of objects gets a DOI every time, then the DOI has no use **except** in workflow, since you can't compare them, it's not easy to count them (for provider credit in a way that doesn't reward providers in strange ways, and it's a huge overhead on the machinery of the service provider). The bottom line is that if you can completely automate the assignation of an identifier pointing to a bag of files, this is obviously a good thing, but it's not a DOI! (Where is the role of Publishing?). So, yes, let's consider what we need to have machinery to do this, but let's not confuse that with a DOI ...

**5)** *I would like to see the DOI being used purely to point at what data files we are talking about. I dont think it should contain any other info at all. Nothing about quality or relationships to other data series.*

Yes, the DOI job is just to point at the data. The argument about QC is just to avoid carrying too many of them, and yes, the relationships between data should lie above the DOIs per se ... however, when we think of a DOI as represented a Published dataset, we can at least include the concept of allowing later versions to be signalled on the landing page.

**6)** *I would sacrifice persistence if it fails QC and storage is an issue. I know this makes science less reproducible, but there is nothing preventing people from using the data at the moment. They just struggle with citing it. When data is removed because of a QC issue then we would still have a records of its relationship to new versions. Thus the system can inform the user "sorry this file is no longer available because of some issue. A corrected version of the file can be found here."*

I don't see why you would bother with a DOI if you take away persistence, what value does it offer over a URL?

&#151;

So the bottom line in my responses to both: if you are willing to throw away persistence (Aslak) and you think the identifier has to be automatic *hide* versioning (Gavin), then neither of you want a DOI per se, you want something else ...

I think both of you might be happier with some sort of automatic manifest wrapping up DRS URLS, itself available at a URL. I think that would satisfy your provenance citation, but I don't think it would hit many of the other requirements. I think we'd want DOIs as well!

In summary, the identifiers you need for workflow provenance are probably not the same ones you need to support the scientific neeed to cite. I don't think there is any value for citation in completely opaque identifiers to arbitrary grab bags of files (as I've argued above). I can see the value of them in workflow, but not citation.

Finally, one last point, for Aslak, and everyone else. It's not silly to ask questions, or promulgate solutions, I'm really glad you are, please keep doing it. The only silly questions are the ones we don't ask (since it's silly not to ask a question if you don't know the answer and want to know). It's also not silly to propose answers to questions, again, that might be the only way to find there is a well known better answer etc ... (or to bring enlightenment to those of us stuck in the trenches, we sometimes need to lift up our eyes).


#### trackbacks (1)
*[A citation and provenance system for climate modelling]({% post_url oldblog/2015-03-02-a_citation_and_provenance_system_for_climate_modelling %}) (from "Bryan's Blog" on (on Monday 02 March, 2015)*)What would a modelling citation and provenance system need to do?

#### comments (10)
*[Gavin](http://www.realclimate.org) (on Tuesday 13 August, 2013)*
Hi Bryan, thanks for the comments. I agree this is better expanded in a blog post than discussed over twitter!

The reason I pinged you in the first place is because we've had this conversation before (a meeting in the UK maybe 5 years ago? longer?). My frustration with how this worked for CMIP5 specifically is that all of the issues have been known about and discussed since then, and yet the solution that ended up being chosen fulfills none of the requirements.

So here is an idea that could be implemented easily as part of the ESGF publishing system, and perhaps could be done relatively quickly.

Each simulation (not ensemble!) (a unique model, experiment, rip number) is associated with a DOI. This DOI is technically a collection of unique tracking IDs (one per file) AND any related DOIs (perhaps a small number of classes). The classes of related DOIs could be a previous version (with either trivial or substantive changes to one or more of the individual files) or to DOIs in the same ensemble. Think 'sibling' or 'parent' DOIs perhaps.

This gets assigned for every simulation on publication and is under the control of each ESGF node. If some data gets corrected, you get a new DOI, but it may be that most of the tracking IDs are the same and so people who didn't use the corrected file will be able to see that the data they used was the same. The original DOI is part of the collection, and whether people use the original or subsequent ones, you could build an easy tool to see whether your DOI was cited as either a parent or sibling DOI in other collections.

So, the DOIs (which contain only to tracking IDs and other DOIs) are persistent. They allow a unique mapping to the data as used, but also to any updates/corrections. Groups can use them to see who used their data, they can be assigned automatically. The only metadata required are trivially available via the filename structure.

What's not to like? ;-)

*[Nick Barnes](http://climatecode.org/) (on Tuesday 13 August, 2013)*
This margin is far too narrow to contain my thoughts on the subject.

Firstly, URLs do not denote files.  They denote resources.  Essentially by coincidence they resemble pathnames, and in some common circumstances the resource denoted by a URL is indeed a file on a server which (on that server) has a pathname related to the URL.  This is neither necessary nor, often, desirable (it's a common noob error to hand out URLs like http://my.server.here/then/a/path/to/freds/place/spondulicks.tar.gz).  The resource denoted by a URL may be looked up by the web server in almost any kind of data store (the filesystem is just an easy way of doing this), and may be subject to all sorts of on-the-fly processing, caching, etc.

All of this goes for DOIs as well.  In fact, DOIs are simply a different kind of identifier, with pretty much all the same properties as URLs, except for (a) a different set of cultural baggage, and (b) a gatekeeper (the IDF and the registration agency system).  When talking about what one can do with URLs and DOIs, it is generally a mistake to use the word "file".  They have nothing to do with files or directories.

Secondly, the use of a DOI is no kind of guarantee of persistence.  I *think* that users want a DOI to be readily resolvable to a persistent "landing page" which provides some human-readable metadata (e.g. authorship, provenance, history, links to related items).  Ideally with machine-readable metadata too.  Well, that can be arranged (by the DOI RA), and it can equally be arranged for URLs (by whoever serves the domain).  In fact, the technical infrastructure would be pretty much identical.

Thirdly, if publishers are really complaining about "what, you changed one minor thing, and I have to republish tens of thousands of files, and you want the old ones to remain?" then you need to find better publishers.  Ones who can count to twenty without taking off their shoes.

So much more to say, but I'm on vacation.

*[Nick Barnes](http://climatecode.org/) (on Tuesday 13 August, 2013)*
Here is a trivial example. Someone (Bruce, in this instance) changed one minor thing, and tens of thousands of files were automatically republished, at essentially zero marginal cost and with no human intervention.  Shocking, but it happens millions of times every day.

https://github.com/dylan-lang/opendylan/commit/5c5f648bc39dfd37ae7a135fe76dac47fdf8f3d5

Also, FWIW, it's a persistent URL, which I strongly suspect will still be valid after some DOIs are dust.  And there's an API for metadata.  It's not a perfect system, and it's hardly the cutting edge of innovation, but it suggests to me that some scientists need to lose their preconceptions about what a URL (or a DOI) means, and what it can do.

*bryan (on Tuesday 13 August, 2013)*
@nick: you really don't get what it means to republish at tera- or petascale with any sort of persistence (and have to pay for it). (As to the rest of your points re urls and dois, I'm guessing you didn't read this all with care given you're on hols. We can have a proper conversation when you're back).

@gavin. I'll provide a full response in the next day or so.

*[Nick Barnes](http://climatecode.org/) (on Tuesday 13 August, 2013)*
Terascale is cheap. Petascale is different, I'll absolutely grant you.  But what do you mean by "what it means to republish ... with any sort of persistence"?  What's the "re" in "republish"?  I guess what I'm not understanding is your set of use cases.

My point about github is simply this: the only thing you need to store for a change is the delta.  Resources or parts which don't change should not be duplicated.  You know this too.  So what's with this "changed one minor thing"?

Drop me a line, we'll talk about this some more in a couple of weeks.

*[Stephen Pascoe](https://twitter.com/spascoe) (on Tuesday 13 August, 2013)*
@nick:
Adding some technical detail to Bryan's response.  The git commit may have republished tens of thousands of files (by some definitions of publish) but those files weren't each GBs in size.  Git is well known to not cope well with large files.  That said, using git for manifests of filenames, tracking_ids and hashes is a possibility.  Therefore git could play a role as part of an architecture we are discussing but couldn't do it alone.

On DOIs as just another identifier.  I used to hold this belief but seeing how DOIs are gaining traction in research has changed my mind.  DOIs include a social contract where we expect the DOI landing page to be maintained and trust it to refer to the "same object" (deliberately left undefined here).  I agree that technically this could be achieved with just URLs if sufficient trust existed in those running the domains.  However, as Bryan says: "the publishing world generally recognises that there is a publisher for a DOI, whereas, there might be one for a URL".

Another way of expressing this is that github.com is the de facto trusted domain for publishing open source software.  dx.doi.org is the de facto trusted domain for publishing citable digital objects; at least in science.

@bryan: A fantastic read, although I'm used to following your train of thought ;-).  I almost started disagreeing with you in the middle but you won me round by the end.

*[Stephen Pascoe](http://home.badc.rl.ac.uk/spascoe/blog/) (on Wednesday 14 August, 2013)*
@nick: I realise I may have miss-understood your point.  Your git example is a change to the code not a change to the output.  So maybe you are arguing that we should just version control the model codes.

IMO that's a fantastic goal but a long road.  It would require end-to-end continuous integration of the entire data production pipeline, including model code, configuration and several steps of post-processing.  Something to aim at maybe.

If you do mean storing deltas of data, that would still mean a lot of data and you can't just throw standard tools at it.  Actually, I have been thinking about storing deltas to old versions for future data archival.  Something using rdiff or xdiff.

Nick, you're on vacation so no need to respond if you like.  I just wanted to correct myself.

*[Aslak Grinsted](http://www.glaciology.net) (on Wednesday 14 August, 2013)*

When I say I am willing to "sacrifice persistence", then what I mean is that I want a "doi" regardless of whether somebody else has decided that this data is too expensive to keep around. Regardless of whether data has been deleted, then I still want to be able to point to it regardless. In that case I still want meta data on what it was, relationships, and reasons for deletion displayed on the doi landing page. So I would like the meta data to remain persistent.

I want all this info from a publisher that I trust. I absolutely agree with Steven that the reason to prefer a DOI  over an url or another id-system is exactly because of the social contract. URLs might be sufficient for the job but why would you prefer that over a DOIs?

Shouldn't the QC step be done even before the data becomes available to anybody? The moment they have been downloaded and used then I think they should be citable. As I have stated then I think on-demand generation of DOIs would be useful. People would probably exclude obviously wrong data from the analysis and thus not cite them. Ofcourse in some cases you might want to report on the data quality problem, and in this case it would also be useful to have a DOI.






*John Graybeal (on Thursday 15 August, 2013)*
Thanks for making this a public conversation re DOIs, very useful. Hope you don't mind an outsider comment.

Re "Digital Object Identifiers are expected to be persistent, so that if the location of the object changes, you can still dereference the object. " If *all* that changes is the location, yes you can dereference it, _using a URL_. DOI's require the same persistent maintenance of URLs that URLs require. (And if that's the resolution referred to by the "social contract", that favorable social contract only looks good because DOIs are newer; resolution will fade quickly with time.)

"URLs might be sufficient for the job but why would you prefer that over a DOIs"?" Because URLs are cheaper, introduce fewer technologies, and trivially recognizable and resolvable by a larger user community. (Granted, the last may not be of concern for a highly targeted scientific product.)*Bryan (on Friday 23 August, 2013)*
@gavin: Full response at http://home.badc.rl.ac.uk/lawrence/blog/2013/08/23/gavin%27s_proposal
