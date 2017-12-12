---
layout: post
title: Meteorological Time
last_modified: Tuesday 07 March, 2006
tags: curation badc
categories: computing
---
One of the problems with producing standard ways of encoding time is that in meteorology we have a lot of times to choose from. This leads to a lot of confusion in the meteorological community as to which time(s) to use in existing metadata standards, and even claims that existing standards cannot cope with meteorological time.

I think this is mainly about confusing storage, description and querying.

Firstly, let's introduce some time use cases and vocabulary:
1. I run a simulation  model to make some predictions about the future (or past). In either case, I have model time which is related to real world time. In doing so, I may have used an unusual calendar (for example, a 360 day year). We have three concepts and two axes to deal with here: the **Simulation Time** axis (T) and the **Simulation Calendar**. The **Simulation Period** runs from T<sub>0</sub> to T<sub>e</sub>.  We also have to deal with real time, which we'll denote with a lower case *t*.
1. Using a numerical weather prediction model.       
    1. Normally such a model will use a "real" calendar, and the intention is that T corresponds directly to *t*.     
    1. It will have used observational data in setting up the initial conditions, and the last time for which observations were allowed into the setup is the **Datum Time** (*t*<sub>d</sub> - note that datum time is a real time, I'll stop making that point now, you can tell from whether it is T or *t* whether it's simulation or real).
    1. The time at which the simulation is actually created is also useful metadata, so we'll give that a name: **Creation Time** (*t*<sub>c</sub>).     
    1. The time at which the forecast is actually issued is also useful, call it **Issue Time** (*t*<sub>i</sub>). So: t<sub>d</sub> < t<sub>c</sub> < t<sub>i</sub>
    1. A weather prediction might be run for longer, but it might only be intended to be valid for a specific period called the **ValidUsagePeriod**. This period runs from *t*<sub>i</sub> until the **VerificationTime** (*t*<sub>v</sub>).      
    1. During the ValidUsagePeriod (and particularly at the end) the forecast data (in time axis T) may be directly compared with real world observations (in time axis *t*), i.e., they share the same calendar. So now we have the following:
    T<sub>0</sub> < *t<sub>c</sub> *but* t''<sub>d</sub>  can be either before or after T<sub>0</sub>!
        * Note also that the VerificationTime is simply a special labelled time, this doesn't imply that verification can't be done for any time or times during the ValidUsagePeriod.
        * Note that some are confused about variables which are accumulations, averages, or maximum/minimum, all over some **Interval**. These do not have a special relationship with these variables. When I do my comparisons, I just need to ensure that the intervals are the same on both axes.     
    1. We might have an ensemble of simulations, which share the same time properties, and only differ by an **EnsembleID** - we treat this as a time problem because each of these is essentially running with a different instance of T, even though each instance maps directly onto *t*. But for now we'll ignore these.
1. In the specific case of four-dimensional data assimilation we have: T<sub>0</sub> < t<sub>d</sub> < t<sub>c</sub> < t<sub>i</sub> < t<sub>v</sub> < T<sub>e</sub> -
confused? You shouldn't be now. But the key point here is that there is only one time axis, and one time calendar both described by T! All the things which are on the *t* axis are metadata about the data (the prediction). 
1. If we consider observations (here defined as including objective analyses) as well, we might want some new time names, it might be helpful to talk about      
    1. the **ObservationTime** (*t*<sub>o</sub>,the time at which the observation was made, sometimes called the **EventTime**).     
    1. the **IssueTime** is also relevant here, because the observation may be revised by better calibration or whatever, so we may have two identical observations for the same *t*<sub>o</sub>, but different *t*<sub>i</sub>.     
    1. a **CollectionPeriod** might be helpful for bounding a period over which observations were collected (which might start before the first observations and finish after the last one, not necessarily beginning with the first and ending with the last!)
1. Finally, we have the hybrid series. In this case we might have observations interspersed with forecasts. However, again, there is one common axis time. We'd have to identify how the hybrid was composed in the metadata.

I would argue that this is all easily accommodated in the existing metadata standards, nearly all these times are properties of the data, they're not intrinsic to the data coverages (in the OGC sense of coverage). Where people mostly get confused is in working out how to store a sequence of, say, five day forecasts, which are initialised one day apart, and where you might want to, for example, extract a time sequence of data which is valid for a specific series of times, but is using the 48 hour forecasts for those times. This I would argue is a problem for your query schema, not your storage schema - for that you simply have a sequence of forecast instances to store, and I think that's straight forward.

I guess I'll have to return to the query schema issue.
