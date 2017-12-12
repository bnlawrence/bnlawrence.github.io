---
layout: post
title: Numerical Observation Time
last_modified: Friday 07 January, 2011
tags: metafor metadata
categories: computing
---
Over four years ago I had a series of conversations with colleagues, that led to my [blog posts]({% post_url oldblog/2006-04-13-more_meteorological_time%}) on meteorological time.
Jeremy Tandy has subsequently refined our thinking of all those years ago in a [cogent proposal](http://metafortrac.badc.rl.ac.uk/trac/attachment/wiki/tickets/920/OGC%20Met-Ocean%20DWG%2BIts-about-time%2B2010-12-10%20%28TANDY%29%20v2.1.pdf) intended for both OGC and WMO which casts the discussion of "forecast time" in an [observations and measurements](http://metafortrac.badc.rl.ac.uk/trac/attachment/wiki/tickets/920/Observation%20Core.png) framework.

Jeremy's proposal is detailed and well thought through, but I don't think it fully covers all the edge cases, so this post is by way revising my post from 2006 in the context of Jeremy's proposal. In doing so, I guess I'm suggesting some minor changes to Jeremy, but I'm also writing this for the benefit of both myself and metafor.

By way of context then, here is my 2006 figure, redrafted to remove some implicit assumptions in what I wrote then:

![Image: ForecastDataSets4.png ](/assets/images/2011-01-06-ForecastDataSets4.png)

The diagram shows a number of different  datasets that can be constructed from daily forecast runs (shown for an arbitrary month from the 12th til the 15th as forecasts 1 through 4. If we consider forecast 2, we are running it to give me a forecast from T<sub>0</sub>(day 13.0) forward past day 14.5 ... but you can see that the simulation began (in this case 1.0) days earlier, at a simulation time of 12.0.

(NB: all symbols as defined in this post, not any previous one. Note that all times shown are times in the forecast reference frame, even though the diagram shows a progression of such times marked as real time ... the diagram doesn't show when the runs were actually completed.)

The key concepts are that:
1. Forecasts begin with an assimilation period delineated by an initialisation time and a time of last possible observational data input (also known as the datum time, T<sub>d</sub>).
    * In the diagram, the initialisation time is 24 hours before T<sub>0</sub>, but it could be any period - including no period of assimilation at all.
    * Some forecasts simply continue as model runs with no new data acquired after T<sub>d</sub>, in this case T<sub>0</sub> is the same as T<sub>d</sub>.
    * (Thus far these times are all in the forecast reference frame. Jeremy's presentation is hot on these distinctions!)
1. *Analyses* are generally produced for some time in the observation window (aka assimilation window), sometimes, but often not at the end (see for example [ECMWF 4D Var](http://www.ecmwf.int/products/forecasts/guide/The_4DVAR_analysis_procedure.html)).
    * Analyses are used for many things, but one of the most important, is the initialisation data for a future forecast, as shown here in the case of using them to initialise the next days run. Another possibility is that an analysis from within the window is used to start a current forecast with a different resolution or version of the model. (As a consequence, we often find the assimilation portion of the run is not archived with the forecast portion.)
1. Sometimes *Analysis Datasets* are produced by using the actual analyses with higher frequency data provided by taking data from the forecasts in a consistent way.
    * Two examples are shown in the diagram for T<sub>0</sub>, where we have assumed for convenience that the analysis time is the same as the datum time.
        * In case *a*, data from the *last* forecast is used to provide the interim data points. In this example this data is from the free running model after assimilation. This is often a good thing to do for physical variables which are not being directly assimilated - these are often more physically in balance after the assimilation window.
        * In case *b*, data from the *next* forecast is used to provide the interim points.

OK: with that language in mind, we can turn to Jeremy's OGC proposal.

Jeremy makes the key distinction between times *of the observation event* (which belong on the observation entity), and times *of the result of the observation*. (In this context the Observation is the Simulation).

Looking at Jeremy's times of interest, we have:
1. The result times which appear in the result coverage. These are straight forwardly the times that the simulation thinks it is valid for (we'll come back to validity).
    * The  bounding box of these times, the duration of the run, should appear in the MD_Metadata associated with the observation!
    * It should also appear as the phenomenonTime in OM_Observation.
    * We could have multiple datasets extracted from the forecasts above which had exactly the same result times and result bounding boxes (e.g. day 13 to day 14 from forecasts 1, 2 and 3 - noting the latter would include data from the assimilation period - or a composite analysis of days 13 to 14 via routes a or b).
1. Jeremy rightly states *It is the metadata about the simulation event that enables us to distinguish between these results*
    * (From a metafor point of view, that clearly tells us our "simulation" class needs to be a specialisation of OM_Observation.)
    * We sometimes talk about a *reference time* which is often associated with the *analysis time* (T<sub>0</sub> in our case), but it could be the initialisation time T<sub>init</sub>, or even the datum time (T<sub>d</sub> is not always equal to T<sub>0</sub>).
        * These are not standard O&amp;M concepts, and would need to go in as named parameters, and this is where I differ from Jeremy: Because the reference time is somewhat ambiguous (is it T<sub>0</sub> or T<sub>init</sub>), I would explicitly distinguish between them (even though often they are the same since the assimilation and forecast runs are separate). To distinguish, I would have a referenceTime which was explicitly defined as T<sub>init</sub>, and add an optional datum time (and it's absence would indicate no assimilation).
    * OM_Observation also has validTime, which could be confused with the phenomenonTime in the case of forecasts - but it isn't intended to be the same as validity time in the meteorological sense. If we use it, it should indicate a period in the *real time* reference frame (not forecast time reference frame) for which the forecast is intended to be used.
    * OM_Observation also has resultTime, which is the time at which the event "happened". Jeremy unpicks this well in his document. The bottom line is that it should correspond to when the result became available ... in the *real time* reference frame.
1. Jeremy suggests that observation mashups (like the horizontal dataset constructed using T<sub>0</sub> output plus either *a* or *b* data would not retain any semantics. In this I disagree, since these are "effective observations". The process will of course describe the detail of the mashup methodology, but I think the observation has to give some hint via it's time attributes how it was done. The interesting thing there is the output dataset consists of a series of {analysis field followed by 1.. n forecast field} sets.
We need a notation for that. Which is more than I'm going to do today ...

By way of summary, this blog post summarises some things from Jeremy's proposal, and makes some minor quibbles. Overall I think it's an excellent proposal.

#### comments (2)

*Jeremy Tandy (on Tuesday 11 January, 2011)*

Bryan - thanks for the feedback. Reading through your comments, you've unpicked a level of complexity that I don't often see in the 'operational meteorology' context that I am most familiar with ... here, most folks don't really *care* about T-init or T-d (to use your terminology) as the same pattern repeats every day. It's the analysis time (T-0) that folk refer to. However, thanks to your descriptions, I can now see that this additional metadata does provide additional utility in other contexts.

I will attempt to incorporate your feedback into an update version of the proposal ready for a second pass through the BNL gateway!

One point to check my understanding - where 4DVar assimilation is used, can T-d be AFTER T-0? In my operational context we fudge this detail by refering to T-0 as the 'nominal analysis time'.

*Bryan (on Sunday 30 January, 2011)*

Yes! The ECMWF example shows exactly that.
