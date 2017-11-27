---
layout: post
title: Metadata, Effort and Scope
last_modified: Wednesday 21 May, 2008
tags: curation badc metadata
categories: computing
---
I keep on harping on about how metadata management is time intensive, and the importance of standards.

Users keep on harping on about wanting access to all our data, and our funders keep wanting to cut our funding because "surely we can automate all that stuff now".

I've written [elsewhere about information requirements](papers/roysoc/LawEA08.pdf), this is more a set of generic thoughts.

So here are some rules of thumb, '*even with a great information infrastructure*, about information projects:
* If you need to code up something to handle a datastream, you might be able to handle o(10) instances per year.
* If you have to do something o(hundreds of times), it's possible provided each instance can be done quickly (at most a few hours).
* o(thousands) are feasible with a modicum of automation (and each instance of automation falls into the first category), and
* o(tens of thousands and bigger) are highly unlikely without both automation and no requirement for human involvement.

What about processes (as opposed to projects):

In the UK 220 working days a year is about standard. Let's remove about 20 days for courses, staff meetings etc ... so that leaves about 200 days or, for a working day of 7.5  hours, a working year of about 1500 hours.

So a job that takes a few hours per item can only be done a few hundred times a year. A case in point: in the last year 260
standard names were added to the CF conventions. One person
(Alison Pamment) read every definition, checked sources, sent emails for revision of name and definition etc. Alison works half time, so she only had 750'ish hours for this job, so I reckon she had a pretty good throughput; averaging roughly three hours per standard name.

Now that job is carried out by NCAS/BADC for [the global community](http://www.cfconventions.org), and the reasonable expectation is that names that are proposed have been through some sort of design, definition, and internal/community vetting process before even getting to CF.

So, from a BADC point of view, we have to go through every datastream, identify all the parameters, compare with the CF definitions, and propose new names etc as necessary.
If all our data hand standard names, we'd be able to expoit that effort to produce lovely interfaces where people could find all the data we hold without much effort, *if they **only** cared about the parameter that was measured.* But they don't. Unfortunately for us (workload), and fortunately for science, people do care about how things are measured (and/or predicted).  So the standard names are the the thin end of the wedge.  We also have to worry about all the rest of the metadata: the instruments, activities, data production tools, observation stations etc (the MOLES entities).

As a backwards looking project: Last year, we think we might have ingested about 20 milliion files. Give or take. Not all of which are marked up with CF standard names, and nearly none (statistically) were associated with MOLES entities. Truthfully we don't know how much data we have for which our metadata is inadequate (chickens and eggs). As always, we were under-resourced for getting all that information at the time.

My rule of thumb says our only hope of working it out and doing our job properly by getting the information is that we need to identify a few dozen datastreams (at most), and then automate some way of finding out what the appropriate entities and parameters were. If it's manual we're stuffed, Sam has another rule of thumb: if something has to be done (as a backwards project, rather than as a forward process) more than a thousand times, unless it's trivial it wont get done, even with unlimited time, because it's untenable for one human to do such a thing, and we don't have enough staff to share it out.

Fortunately, for a domain expert, some of these mappings are trivial. But some wont be, and even distinguishing between them is an issue ...

Still, I genuinely believe we can get this right going forward, and do it right for **some** of our data going backwards.  Do I believe non-domain experts could do this at all? [No I don't]({% post_url 2005-03-31-function_creep_and_institutional_repositories %}).
So where does that leave the [UKRDS](http://www.ukrds.ac.uk) which, at least on the face of it, has grandiose aims for all research data? (As the intellectual inheritor of the UKDA, I'm all in favour of it, as a project for **all** research data, forget it!)
