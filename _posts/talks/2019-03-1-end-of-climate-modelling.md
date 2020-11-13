---
title: NCAS Seminar
when: March, 2019
location: Reading
layout: talk
categories: talks 
tags:  HPC exascale 
talks: The end of Climate Modelling as we know it
image: /assets/images/2019-03-01-cambrian.png
---

The end of Climate Modelling as we know it
----------------------------------------

Presentation: [pdf](/assets/talks/2019-03-01-uor-ncas-seminar.pdf) (15 MB)

This was a seminar given in Meteorology at the University of Reading as part of the NCAS seminar series.

In this presentation I was aiming to introduce a meteorology and climate science community to the upcoming difficulties with computing: from the massive explosion in hardware variety that we associate with the end of Moore's Law, to the fact that in about a decade we may only be able to go faster by spending more money on power (provided we have the parallelisation). Similar problems with storage arising from both costs and bandwidth are coming ...

I set this in the scene of our existing experience of decades of unbridled increases in computing at more or less the same power consumption until the last decade when we've still had more compute, but at the same power cost per flop (for CPUs at least).

Of course it wont mean the end of climate science, and it will probably take longer to arrive than currently being predicted, but it does mean a change in the way we organise ourselves, in terms of sharing data and experiment design, and it certainly means "going faster" will require being smarter, with maths, AI etc.

This seminar differs from my [last one](/talks/2019/02/supercomputing-jasmin-diversity/) in that I didn't talk about JASMIN at all, and I spent more time on the techniques we will need to [cross the chasm](https://doi.org/10.5194/gmd-11-1799-2018) between science code and the changing hardware.

I finished with some guidance for our community: we will need to become better at using the right tool(s) for the job, rather than treating everything as a nail because we have a really cool hammer:

* More use of hierarchy of models;
* Precision use of resolution;
* Selective use of complexity;
* Less use of “ensembles of opportunity”, much more use of “designed ensembles”;
* Duration and Ensemble Size : thinking harder a priori about what is needed;
* Much more use of emulation.