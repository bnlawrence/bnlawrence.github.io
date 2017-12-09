---
layout: post
title: On CMIP6 and DOIs
last_modified: Friday 09 August, 2013
categories: computing
tags: cmip citation
---
There is clearly a lot happening at the CMIP6 meeting, however, as is often the case, only [Gavin](https://twitter.com/climateofgavin) is tweeting. That's a shame. Many of us couldn't get to the meeting (or were not invited, or both). So thanks Gavin!

Just a quick historical perspective.

CMIP5 is the current international model intercomparison project (the fifth).  CMIP5 consists of more than 50 different "experiments" each of which define criteria for what models need to do to take part. For example, the famous experiments are the [RCP experiments](http://en.wikipedia.org/wiki/Representative_Concentration_Pathways), which require the use of specific greenhouse gas concentrations to be used in projections for the future, with state of the art models. Others, include ones designed to recreate the past, and to evaluate clouds in models ... etc.

Modelling groups then run their models in accordance with the experimental criteria, or as near as they can, and that "simulation" process results in datasets. CMIP5 prescribes how the datasets are organised and the details of data formats.

Some people think CMIP5 is finished, but it hasn't, people who think it has are people who confuse the IPCC with CMIP. There was an implicit deadline by which simulations needed to be finished so that papers could include them for analysis in AR5. However, since no one really knew the timeline from data to paper, the explicit deadline for CMIP5 data *for use in AR5* was the paper deadline for AR5 ... **but that's not a CMIP5 deadline!**.

One could still run a CMIP5 experiment, and get it uploaded into the ESGF, either by joining the [ESGF](http://esgf.org/), or by uploading the model output (and model descriptions) to one of existing ESGF data nodes. For the first time, some of us with data nodes, are offering to persist the data  indefinitely. I'll get back to persistence later ... We are also tagging the datasets that were available by the IPCC deadline so one could know which data were used in papers ... We are trying to manage versioning, and yes, for some data, which is properly documented (the initial process is [documented](https://redmine.dkrz.de/collaboration/projects/cmip5-qc/wiki)), we are awarding DOIs - e.g. see http://cera-www.dkrz.de/WDCC/CMIP5/Citation.jsp

Some CMIP5 experiments were intended by be more important than others, but of course, those who had that intention were those who were interested in those experiments. For each experiment, there is a community that thinks their experiment is the most important ...

... and so for those experiments, people can and should keep adding output.

So, in truth, I'm confused as to what CMIP6 actually is going to be. Is it simply a date, or is it a set of new experiments? If so, what, and why? And what level of necessity is there for a large community to run simulations which conform to those experiments?

New models can and should run the old experiments ...

At which point we come to my grumpy twitter responses. I can't quite see the point in lots of new (long-term) scenario experiments, since we have such large scenario uncertainty it's not obvious that there is much point in doing more than a couple of extremes and a couple of middle cases. Happy to be convinced otherwise, but from the point of view of "how much of a problem" (see my previous post), we know enough on the global scale ...

... but we really are clueless on a regional scale! Where there is real scope of improving understanding is the out to thirty year experiments, where we need to get a handle on the importance of resolution and complexity (ie possible interactions with crops and chemistry, all bio-geo stuff, with a bit of anthro), and understand whether we can have any confidence at scales that directly matter with people.

And, if CMIP6 involves *a* date, I'll be grumpy too, it should involve dates (plural). If we decouple  CMIP6 from ARx, then why not stagger the dates for the experiments, and have the dates relevant to the community science requirements rather than the policy requirement (of having a bunch of simulations to write about)?

Now, back to persistence.

Another thing that makes me grumpy is people saying "we want DOIs", when what they really mean is we want a persistent identifier for a dataset but we don't care if the data is persistent. If you care about the entire persistence thing, then you have to care about who is persisting the data, how they are funded, how they are going to curate the data long term, how they distinguish between datasets etc. They need to think about how to aggregate datasets in different ways that are useful, so that one can compare citations etc. I don't have the inclination here and now to get into these things, but many people who call for DOIs need to stand back and ask why they are doing so, and what they really mean when they do so. What is it they really want, and why?

Those of us who have spent time putting things in place to do it right, wonder why the rest of you wont do the work to use it ... but we know we haven't documented all this properly either ... but then no one is funding us properly to do it, let alone document it.

#### comments (8)
*[Aslak Grinsted](http://www.glaciology.net/Home/Miscellaneous-Debris/cmip6on-demanddoigeneration) (on Friday 09 August, 2013)*

I was one person talking about DOIs on twitter.

Of course I would like persistent data. In an ideal world i'd like to be able to follow a data doi and download the exact same data files 50 years from now. But I see that as a separate issue from a doi database (and one that is harder to solve because of data volume). First I would like to be able to cite the exact data files used in a paper. So, I am happy to discover that you already have something in place. http://cera-www.dkrz.de/WDCC/CMIP5/Citation.jsp

But I suggest that you add links to it from pages such as this:
http://cmip-pcmdi.llnl.gov/cmip5/citation.html

- I still like the idea of a data citation script. If you give it a list of files then it attempts to provide you with instructions on how to cite it. I think lots of people would love this. Could perhaps be considered in datacite rather than in CMIP.

- I also like file hashes (but tracking_id's are also good, but i'd have to read how they are designed to fully appreciate them). One nice thing about using file-hashes as id's: It makes it easier to add support for existing published data from e.g. CMIP3.

-I'd like to be able to cite very specific sets of files. E.g. Monthly tas Historical/RCP45/RCP85 r1i1p* for 3 specified models. This is too many files to cite individually, and it is not the entire ensemble. In a paper at the moment i would detail all these choices in a paragraph.

Now I'll have to go play with the citation page to see how it works in practice.
http://cera-www.dkrz.de/WDCC/CMIP5/Citation.jsp

*[Gavin](http://www.realclimate.org) (on Friday 09 August, 2013)*

Hi Bryan, Thanks for commentary. I can give a little more background to the conversation here than I can squeeze on to twitter.

First off, you are absolutely right - CMIP5 is still ongoing and groups can (and should!) continue to submit simulations that fill out the matrix of requested runs. I think there is still an enormous amount of science that can be derived from the archive.

Second, you are also correct about the non-linkage between CMIP5 and IPCC. CMIP is organised by the modeling centers (and other interested parties) themselves, and neither mandated nor even requested by IPCC. Obviously, people want to write papers that use the latest and greatest models and tried to do that before the IPCC deadlines - with partial success. But in the end, that is IPCC's problem, not CMIP's.

At the CMIP6 meeting, most of the time has been taken up by talking about what is working and what is not in CMIP5, and how any future MIP projects can be managed - taking into account ever greater numbers of sub-MIPs, data storage requirements and realities of center funding. How many experimental designs can stay static, which need to be updated, dealing with discontinuities that will arise over time etc.

One of the parts of CMIP5 that has not worked satisfactorily is the doi-awarding process at DKRZ that you mention above. The manual step of QC3 has slowed the process down so that only a fraction of the datasets have doi's and as far as I can tell, only a tiny fraction (if any?) of papers published using CMIP5 data have used them. Often, the papers do not even have lists of individual rip numbers, so it is almost impossible to work out what data was used, or what version (in cases of republished or corrected data).

This situation is well-understood among the meeting participants to be unsustainable. Model centers need to be able to demonstrate that their output is being used for science purposes; and other researchers need to be able to know what went in to any analysis. Both these purposes would be well served by some variation on a doi and functionality to collate citations. There are issues of course - what level of data is granted a unique doi? what happens if there is a correction or update to all or part of that collection? etc. But any plan that involves a manual QC step (as now) is doomed. Useful identifiers need to be assigned the second a dataset is made public on whatever ESGF node. This could still be fixed for CMIP5.

*[Aslak Grinsted](http://www.glaciology.net/Home/Miscellaneous-Debris/cmip6on-demanddoigeneration) (on Friday 09 August, 2013)*

I think that my ill-considered suggestions could potentially be useful in addressing the issues which Gavin mentions in the end.

http://www.glaciology.net/Home/Miscellaneous-Debris/cmip6on-demanddoigeneration

I agree with: "Useful identifiers need to be assigned the second a dataset is made public on whatever ESGF node." I would use file hashes.

My answer to "what level of data is granted a unique doi?" would be to generate them on-demand for collections of file IDs. This means it would work from the individual file level to large collections of files.  

My answer to "what happens if there is a correction or update to all or part of that collection?" would be:

Once a DOI has been associated with a list of file ids then you can never change update it. You need a new DOI if you want to cite corrected versions of the files. This way the DOI will always point to the exact file versions used. The page displaying the contents of the DOI can alert visitors if there are/has been any updates or corrections to any of the files (or any other quality issues for that matter).

This could be developed for CMIP5 (and CMIP3, GeoMIP, PMIP, ...).

*[Stephen Pascoe](https://twitter.com/spascoe) (on Friday 09 August, 2013)*

As one of Bryan's minions from the trenches, I assure you these ideas have been much discussed within ESGF.  

Bryan and myself take the same absolutist approach as Aslak: that any DOI must refer to one set of files that never change (not even to correct a spelling mistake in the NetCDF header).  It sounds the most technically elegant solution but in practice there are enormous hurdles.  

I think it's worth separating out "data tracking and versioning" from DOIs.  They are both related but have their own distinct challanges.

Just tracking all the files in CMIP5 is a huge challenge.  We put many measures in place and only some of them have really been used.  E.g. ESGF has a versioning system but the reality has been that a high proportion of ESGF nodes have not kept to the versioning rules.  To be fare we were not able to give them the consistent guidance and tools needed to make it easy enough.  Another example is that we have lists of checksums and tracking_ids for all datasets but not a holistic set of tools that can take advantage of them.

So we could do much better on tracking in the future.  The foundations for the sort of tools Aslak describes (without the DOI generation bit) are already in place within ESGF.  

However that still leaves the question of what we do with DOIs.  Here I agree with Bryan that we need to think very hard about what we want DOIs for.  Are they a guarantee that the data is accessible? Or that the data is of some defined quality? Are they just a label for a "bag of files" so that people can cite them?

DOIs are modelled on citing papers, so the nascent DOIs-for-data infrastructure is not designed for tracking the evolution of billions of files.  Neither is it designed to deal with several DOIs representing a slight variation of the same thing (either because they are different versions of a "dataset" or because they are different "collections of convenience" from the same pool of data).  These problems are being worked on but not on the scale we'd need for CMIP5.  Much of the services being built by DataCite and others wouldn't have a hope of coping with billions of DOIs representing overlapping sets of files.  

People want DOIs for data because it is seen as the way to get their work acknowledged.  The DOI has become a brand.  However IMO they aren't always thinking through the implications.  We are not the only people observing this: I retweeted a related link a few weeks ago (http://carlboettiger.info/2013/06/03/DOI-citable.html)

*[Gavin](http://www.realclimate.org) (on Friday 09 August, 2013)*

Thanks Stephen, The 'defined quality' issue for DOIs is a red herring. There is no way to judge this objectively, and so no system to do it will be satisfactory. As we have seen with the DKRZ project, it takes too long and makes the process useless.  

Access to the data is a definite goal, tracking what was done is a definite goal, and automatic tracking of where data was used is a definite goal.

The problem with doi as a standard for data was recognised years ago - it is good for static objects that don't have relationships with other objects. Data is not like that - it gets updated, corrected, rescaled, redated etc. For CMIP, single diagnostics within a dataset can be replaced (after a problem was found), parts of the time series for all diagnostics can be replaced after a rerun, spelling mistakes or mis-specifications in the header data can be corrected. Each of these events have happened, and rightly require a new identifier. However, the link between the that identifier and the previous needs to be maintained, possibly using some kind of version control system so that differences can be flagged (for instance, if pr was replaced because of data corruption, but tas was the same, it is important to be able to know that two papers that used tas with the different identifiers  are actually using the same data).

Thus we need a doi-like object that has an associated relationship to other objects. Call this doi+ perhaps...

This is what is needed (not something precisely labelled 'DOI'). Does this exist now? and if not, when might it be available?

*bryan (on Friday 09 August, 2013)*
Hi Gavin. You've guzumped me. A fuller reply to all this is under way, but will take a day or two. Meanwhile, all I'd say is that, if you don't do quality control b4 DOI assignment, and you expect persistence of DOI's, and you've got petabytes of data, you've got an undoable task. So something gives. You want qc to give, well that's ok, but with that will go persistence. We can't keep the data you cite if you're going to have gazillions of versions. More on this anon.

*[Gavin](http://www.realclimate.org) (on Friday 09 August, 2013)*
Thanks Bryan, I look forward to your comments. I'd also be interested to know the maximum number of versions in any CMIP5 dataset. I'd guess it's a lot less than 'gazillions'. ;-)

One more point, I have no problem with QC - but it is evident that the QC procedure that was adopted for CMIP5 has crippled the ability of the doi assignment to serve any purpose whatsoever. Time to rethink what the actual point is.

*Aslak Grinsted (on Friday 09 August, 2013)*

I would like to see the DOI being used purely to point at what data files we are talking about. I don't think it should contain any other info at all. Nothing about quality or relationships to other data series.

The relationship between file versions, possible quality issues, etc. I think that should be stored in the ESGF.

The web page displaying the record corresponding to a DOI can then display the corresponding list of files used. It can then pull meta data about each file id from ESGF such as parent/child relationships, versioning, and quality flags. It can also collect a list of papers citing it.

So I don't think there is a need for a DOI+ as additional info is something which is pulled on request. I think regular DOIs are fine for this task. One nice thing would be that this kind of DOI system pointing at a file collection can be built without having to solve versioning and QC issues from the get go.

I finally get Bryans point about if you want to guarantee persistence of the data being pointed at, then you need QC first. However, in this case i would sacrifice persistence if it fails QC and storage is an issue. I know this makes science less reproducible, but there is nothing preventing people from using the data at the moment. They just struggle with citing it. When data is removed because of a QC issue then we would still have a records of its relationship to new versions. Thus the system can inform the user "sorry this file is no longer available because of some issue. A corrected version of the file can be found here."

- I have little insight into the design of ESGF, and I have not followed the citation discussions before. So I realize that I might say something foolish and unintentionally step on some toes. But I hope that you can use my point of view as a user for something. This is just what I would like to see.  
