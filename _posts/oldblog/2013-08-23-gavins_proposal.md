---
layout: post
title: Gavin's Proposal
last_modified: Friday 23 August, 2013
categories: computing
tags: cmip
---
[Gavin](http://twitter.com/climateofgavin) made some proposals in a comment on my [blog]({% post_url oldblog/2013-08-13-confusion_on_dois %}) for how he thought an easy automatic DOI system could be set up for CMIP data in ESGF.

I promised a reply in a day or so. Oh well, small unit error, perhaps week or so (or two) would have been a better promise. I had hoped to agree my reply with [Stephen](http://twitter.com/spascoe), but this is the season for not overlapping. So, here we are.

I've taken Gavin's proposal, and broken it down. We'll go through them and analyse them against what ESGF can do now, my description of what a DOI should do, and my prejudice ... (In this first section, Gavin's proposal leads each enumerated point, my responses are in the bullets). After that, I'll make a modified proposal.
1. Each simulation (not ensemble!) (a unique model, experiment, rip number) is associated with a DOI.
    * For now, let's just ask, can this be done with another sort of identifier? The answer is yes, we can do that with a URL now, and indeed, with an unambigous identifier (the DRS URL stripped of the host hame). For example, for this dataset:
    ![Figure One](/assets/images/2013-08-23-categ.png)
    (from [url at our esgf node](http://goo.gl/FtuZBT) we can follow the catalogue link to the [data metadata page](http://goo.gl/eX8AdI) and find the following ids for this dataset:    <blockquote>    cmip5.output1.MOHC.HadGEM2-A.amip.6hr.atmos.6hrLev.r1i1p1 or    cmip5.output1.MOHC.HadGEM2-A.amip.6hr.atmos.6hrLev.r1i1p1.v20110803 or
    cmip5.output1.MOHC.HadGEM2-A.amip.6hr.atmos.6hrLev.r1i1p1.v20110803|cmip-dn1.badc.rl.ac.uk
    </blockquote>
    * There is even a URL which points to a page with the tracking ids:
http://cmip-dn1.badc.rl.ac.uk/thredds/esgcet/6/cmip5.output1.MOHC.HadGEM2-A.amip.6hr.atmos.6hrLev.r1i1p1.v20110803.xml
    * Then, the next question is what value would a DOI add to that URL?
        * Well, it should add persistence. I've already argued that I'm not happy about that unless we're sure this data won't be superseded. More on this anon.
        * It would add publisher credit when used. Hmm, that introduces multiple sub-questions. Is this the right granularity? Do the publishers get too many citations?
        * It could be used by consumers? Again, is this the right granularity, how do we see this appearing in a reference list? How many of them would appear in your typical paper?
        * I'm going to save these granularity questions for later, but they're key to part of my answer (informed by prejudice, experience, and wider goals).1.  This DOI is technically a collection of unique tracking IDs (one per file) AND any related DOIs (perhaps a small number of classes). The classes of related DOIs could be a previous version (with either trivial or substantive changes to one or more of the individual files) or to DOIs in the same ensemble. Think 'sibling' or 'parent' DOIs perhaps.
    * No, it's technically a link to landing page (if it's a DOI), which then links to a real data object.  That aside, yes the digital object could be a list of tracking-ids, and a list of typed-links to other objects. It's a new kind of digital object, but there is much to like about it, not least that a list of identifiers is unlikely to be supersede-able.
    * It's not obvious to me that the first part of this (the tracking-id list) wouldn't be better to be a list of DRS URLs (including versioning) ...1.  This gets assigned for every simulation on publication and is under the control of each ESGF node.
    * This is already done in the Thredds catalogue, if *this* is a DRS URL.1.   If some data gets corrected, you get a new DOI, but it may be that most of the tracking IDs are the same and so people who didn't use the corrected file will be able to see that the data they used was the same.
    * This is already done by the ESGF software using [tools](http://esgf.org/esgf-drslib-site/) that Stephen Pascoe built, provided *this* is a DRS URL, **and most importantly**, the publisher node takes the trouble to do it. Sadly, most have not! So, a priori, we already know that *all* the publishers aren't going to do this ... because the automagic behaviour requires configuration (and file management) that thus far, folks haven't wanted to do. Caveat: what I think is required here is for the identifiers of deleted data to be kept, and I don't think our current tools do that, so there is some work to be done.1.   The original DOI is part of the collection, and whether people use the original or subsequent ones, you could build an easy tool to see whether your DOI was cited as either a parent or sibling DOI in other collections.
    * If you replace DOI with identifier in this sentence, I'm comfortable with it, but this is not a DOI (for granularity reasons I'll get to).1.  So, the DOIs (which contain only to tracking IDs and other DOIs) are persistent. They allow a unique mapping to the data as used, but also to any updates/corrections. Groups can use them to see who used their data, they can be assigned automatically. The only metadata required are trivially available via the filename structure.
    * All good, all likeable, but it then requires the development of an entirely new ecosystem of citation tools (for counting, comparison etc), and it's not equal in any sense to a traditional academic citation.

So, I don't think there are any insurmountable technical hurdles in what is proposed, but I have three substantive objections, two of which have been hinted about above.

* Respect: One of the major reasons for wanting to use DOIs (as opposed to any other identifiers), is that if we get the granularity and procedures right, all the existing citation tools, and shared academic understanding of what **a** citation means, can be used. Do something different, and we have loads of new (counting/comparator) tools to build, and more importantly, we have to convince every administration you can think of, that these new "citations" have merit (in comparison to traditional citations. Administrations include your organisation, whoever you are, will a data publication rank the same as a paper publication? I hope so, especially if it's in a data journal like one of these: [Scientific Data](http://www.nature.com/scientificdata/), [Geoscience Data Journal](http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)2049-6060), [Earth System Science Data](http://www.earth-system-science-data.net/) etc. Administrations also include journals. Will they be happy for this citation to appear in a reference list?
    * The bottom line: Does the above proposal "get the granularity and procedure right"? Do we anticipate that an ESGF DOI should rank the same as one of those? If not, why not? How will a consumer differentiate? (My answers: no; not as proposed; wrong granularity, no formal procedures; they'll not use them, so it won't be a problem.)
* Granularity: When we think about traditional publications, we have clear notions of what *a publication* actually is, and we have good concepts about how to refer to parts of publications. (We know about papers, books, chapters, pages etc.). Data is different. Why choose to cite simulations (as opposed to variables, bytes, ensembles etc)? The answer has to be that the right granularity is an optimisation of the needs of all parties (producers, consumers, publishers). A key a priori assumption is that we cannot expect it to be right for all of them, so whatever we choose, we need a method of referring into a publication unit, and we need a method of sensibly aggregating published units.
    * For reasons I'll get to, I think this proposal has the wrong granularity.
* Scientific Usefulness/Appropriateness: and now we get to the one I care about most, and the one that is most subjective. In this instance the thing I like least is giving a DOI to an ensemble member. Why not give it to an ensemble?
    * PRO: There is an obvious mechanism for referring to an ensemble member within an ensemble.
    * PRO: Most times one would expect a scientific analysis to exploit an ensemble (although occasionally one can only afford to have one member).
    * PRO: It is easy to provide more complete metadata (once) for an ensemble.
        * Disclosure: I think I think that this is much more important than Gavin, but that's because I also deal with many user communities who are not modelling experts. We both agree we have yet to get this right, but that's not a reason to give it up.
    * CON: (Anticipated) Why choose the ensemble axis to be the ensemble of one model's integrations, not a multi-model ensemble. (Answer: because many use cases are not multi-model, and we can deal with multi-model ensembles as aggregations of single-model ensembles).
    * CON: Ensembles are always being added to. When is it finished? What do I do if I want to use the data before the n'th member is available?
    * CON: The metadata for describing the difference between the ensemble members may be incomplete. (Yeah, so, ...)

OK, so what are the minimal changes I'd make to Gavin's proposal to make it something I do like? (Because it's close). What issues would arise?
1. Granularity: use ensembles, but make sure there is a well understood notation for citing into ensembles to specific ensemble members, and that there is a preprint notation for citations into ensembles which are known to be incomplete, and an edition notation for ensembles which have grown after Publication.
    * We would need to think this through for publication and Publication inside ESGF, but this ought not be hard.
    * Aggregations could be done in new publications, in the outside world, using for example, the data journals listed above.1. Version Control: I like this proposal a lot, in that it takes out the need to keep the data  (perhaps). I'd need Stephen to work out what the consequence are to Thredds and the DRS versioning library to keep tracking ids of deleted files etc, but it's doable, albeit work.1. Respect. Since this is now (nearly) automagic within ESGF, you'd want some method of ensuring that only reputable modelling groups can put their data in. I think ensembles are about the right granularity to rank with traditional publications.1. Content Standard: We'd need to come up with an appropriate manifest format for the tracking ids (or maybe DRS URLS instead, but we'd still be holding somewhere lists of tracking-ids mapping onto URLS). We'd need to control the vocabulary for relationships. All doable, but starting to look like significant work.1. Persistence. ESGF data nodes come and go. We'd need the usual suspects to commit to maintain this long-term, which means the funders to commit to the work, and the maintenance. So we'd need to work this up into a business case. (Not a grant: this would have to be underpinned by long-term money, not soft-money.)
    * The existing CMIP DOI system, is underpinned primarily by the IPCC-DDC commitments, either we get the IPCC-DDC group to agree to do this, and/or we get the relevant funding agencies in Germany, the UK and US (at least) to buy into it.

One last caveat. I happen to believe the existing DOI plan for CMIP5 is not broken, it's just under-resourced, and the community has not bought into it enough. I wouldn't want to do this new thing, and stop doing the existing activity. That has implications that need thinking through too!


#### trackbacks (1)
*[A citation and provenance system for climate modelling]({% post_url  oldblog/2015-03-02-a_citation_and_provenance_system_for_climate_modelling %}) (from "Bryan's Blog" on (on Monday 02 March, 2015)*)What would a modelling citation and provenance system need to do?

#### comments (4)
*[Gavin](http://www.realclimate.org) (on Sunday 01 September, 2013)*
Bryan, thanks for the thorough response (and apologies that I have taken so much time to respond). There is a lot of material here, and I don't think we are so far off from each other's opinions. Where we differ are in value judgements, rather than overall philosophy. I'll freely admit that I am not familiar with some of the technical details you discuss, but hopefully that doesn't matter too much.

First, my main disagreement with you is on your claim that the current system is 'not broken'. I offer a very practical example for why that is. I have a paper under review that uses almost a hundred CMIP5 simulations. Almost none of them have been assigned DOIs under the current protocol and this renders the system useless. For even the most used data (the historical simulations) only 7 ensembles have been given DOIs by DKRZ. Publications using CMIP5 data have been appearing in the literature for over a year, none of which (or at best, very few) have used the DOIs. I'm sure the people involved with this are doing their best, but it is simply not a solution that is scalable to the size of CMIP5 (or CMIP6) or the needs to of the publishers/users/consumers of this data. There is no conceivable amount of resourcing that will fix this.

My second disagreement is one where we have a value judgement disagreement. You indicate a couple of times that you feel a DOI is 'worth' something beyond the practical utility it brings. For instance, you don't want producers to have too many of them, and that in some sense the 'worth' of a DOI listing should be commensurate across all kinds of DOI listings (papers, abstracts, data in a data journal etc.). This value judgement then informs your preferences for granularity. However, I do not see this as a relevant concern in the slightest. Not all papers are equally worthy, and papers are not the same as abstracts are not the same as data. Whether someone external values them equally is up to them (though I would advise against it), and our opinions on the matter are moot. Thus decisions on granularity should be informed almost entirely by convenience to users + consumers. It therefore seems obvious that the ensemble member is the appropriate entity. Many papers are only using a single ensemble member (r1i1p1) from an ensemble, and as you note, additional ensemble members are being added to already published ensembles. Since the DOIs are associated with modeling groups, rather than individual authors, the difficultly this will make for some research evaluation exercise is minimal and easily dealt with.

So here is a modified set of guidelines that would be required:
- contents: tracking ids and relationships to related DOIs
- granularity: ensemble member level
- version control: yes (via relationships)
- respect: I have no idea what 'reputable' means in this context or how one should judge it, and so other than spam data, there shouldn't be any restrictions.
- DOI instantation: immediately and automatically upon publishing to an ESGF node.
- persistence: Yes. DOIs should not be to a specific ESGF URL but be a centrally resolvable shorthand that will persist and can have an updatable map to the data wherever it might end up. Someone does need to have responsibility for that.

The main point is that these things can be fixed and done relatively quickly - it doesn't need to wait until CMIP6. I agree that this has implications, though whether the DKRZ effort should continue is up to them (and their funders). Getting this started though is for the goverance of ESGF to organise - with input from the CMIP5/WCRP committee.

*Bryan (on Tuesday 03 September, 2013)*
No problem with delays ... we're all doing this on the side of our day jobs ... it's the nature of the problem.

I guess my main question to you is: why not use a URL then? It's available now, hasn't it got all the semantics you want? What would a DOI give you that a URL wont?

*[Gavin](http://www.realclimate.org) (on Monday 09 September, 2013)*
What we discussed above:
1) neither unique to a dataset, nor permanent
2) no clear relationship to related data (other ensembles, previous or replacing versions)
3) aesthetically clumsy (minor, but not negligible)
4) no existing tools to gather, query and follow from publications.

Most importantly, the URL html example you gave doesn't actually lead to pages with the data - even if I'm logged in - let alone for someone outside the system. And while the xml page seems to have more info, that is hardly useful at all for a human.

You are correct that the nucleus of a usable system is in place - which is all the more reason to do a little work to wrap it up in a more convenient package.

*Bryan (on Tuesday 10 September, 2013)*
Oh, I agree what we have in place is only the nucleus of what you want, but we could produce a *URL* that does what you want ...

... I just don't think you want a DOI! Or if you do, you're not willing to pay the price (that social contract requires more effort on the part of the data provider). Actually, given most of the data nodes don't even implement the versioning system we have, I'm not convinced even if we did put the machinery in place, you'd get what you want. However, I am convinced it's worth trying :-). Peer group pressure still has its place!

I'll redraw Stephen's attention to this, and ask him what, if anything, the ESGF community could do to put in place a URL system that does what you want.
