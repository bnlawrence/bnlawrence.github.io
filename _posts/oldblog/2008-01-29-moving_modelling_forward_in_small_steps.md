---
layout: post
title: Moving Modelling Forward ... in small steps
last_modified: Tuesday 29 January, 2008
tags: climate modelling_futures
categories: environment
---
I'm in the midst of a series of "interesting" meetings about technology, modelling, computing, and collaboration ... Confucian times indeed.

Last week, we had a meeting to try and elaborate on the short and medium-term NERC strategy for informatics and data. For some reason, NERC uses the phrase "informatics" to mean "model development" (it ought to be more inclusive of other activities, and perhaps it is, but it's not obvious that all involved think that way). As it happens, we didn't spend much time discussing data, in part because from the point of view of the research programme in technology, the main issue at the moment is to improve the national capability in that area (i.e. through improvements and extensions to the [NERC DataGrid](http://ndg.nerc.ac.uk) and other [similar programmes](http://www.resc.rdg.ac.uk/)).

Anyway, in terms of "informatics" strategy we came up with three goals:
* In terms of general informatics, to avoid loosing the impetus given to environmental informatics by the e-Science programme,
* To try and increase the number of smart folk in our community who are capable of both leading and carrying out "numerically-rich" research programmes (i.e. more people who can carry our model development forward). We thought an initial approach of more graduate students in this area followed by a targetted programme might make a big difference.
* To try and identify some criteria by which we could evaluate improvement in model codes (in particular, if we want adaptive meshes etc, which ones, and how should we decide?). (Michael you ought to like that one :-)

This was in the context of trying to ensure that NERC improves the flexibility and agility (and performance) of its modelling framework so it can start to answer interesting questions about regional climate change. Doing so will undoubtedly stretch our existing modelling paradigms, particularly as we try and take advantage of new computer hardware.

During the meeting we all had our list of issues contributing to the discussion. This was my list of things to concentrate on:
* Improving our high resolution modelling (learning from and exploiting [HIGEM](http://www.higem.nerc.ac.uk/)).
* Improving our (the UK research community outside the Met Office) ability to contribute to AR5 simulations.
* Improving our ability to work with international projects like [Earth System Grid](http://www.earthsystemgrid.org/) (data handling) and [PRISM](http://www.prism.enes.org/) (model coupling). (We - the UK - are involved with both, but not enough).
* Data handling for irregular grids.
* Model metadata (a la NumSim, PRISM, METAFOR).
* Future Computing Issues in general, but in particular:
    * Massively parallelism on chip ... where we might expect memory issues: "Shared memory systems simply won't survive the exponential rise in core counts." ([steve dekorte](http://www.dekorte.com/blog/blog.cgi?do=item&amp;id=3188) via [Patrick Logan](http://patricklogan.blogspot.com/2008/01/and-now-for-something.html).)
    * Better dynamic cores
    * Better use of cluster grids and university supercomputing (not just the national services, will require **much** more portable code than we have now, and not a little validation of the models on each and every new architecture).
        * i.e. better coding standards ...
    * Better ensemble management and error reporting (Michael's [bad experience](http://pencilscience.blogspot.com/2008/01/life-in-trenches-iii.html) is not dissimilar to folk here with the Unified Model).
    * Learning the lessons of the [GENIE](http://www.genie.ac.uk/) project(s).
    * Handling massive increases in data volumes.
        * With consequential issues for transport and archival
        * and the requirement to better exploit server-side data services
    * Much better model componentisation and coupler(s).

And like everyone else, I wanted to know where are the smart folk to do all this?

Then today, we had an initial discussion about procuring a new computing resource with the Met Office (which, by the way, doesn't preclude our involvement in other national computing services, far from it). There isn't much I can say about this discussion, as much of it was in confidence, but suffice to say, it was all about how we can exploit a shared system on which we would be running the met office models for joint programmes ... of course it's that very same model which most certainly needs a technology refresh :-)

On Friday, we'll be discussing the new NERC-Met Office joint climate research programme ... (which will be one of the programmes exploiting the new system).
