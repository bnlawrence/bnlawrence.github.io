---
title: Extreme Data Workshop
when: September, 2018
location: Jülich
layout: talk
categories: talks
tags: data-science exascale JASMIN
talks: Beating Data Bottlenecks in Weather and Climate Science
image: /assets/images/2018-09-18-extreme-data-attendees.jpg
---

Beating Data Bottlenecks in Weather and Climate Science
------------------------------------------------------

Presentation: [pdf](/assets/talks/180918_extreme_data.pdf) (6 MB)

The data volumes produced by simulation and observation are large, and becoming larger. In the case of simulation, plans for future modelling programmes require complicated orchestration of data, and anticipate large user communities.  "Download and work at home" is no longer practical for many applications.  In the case of simulation these issues are exacerbated by users who want simulation data at grid point resolution instead of at the resolution resolved by the mathematics, and who design numerical experiments without knowledge of the storage costs.

There is no simple solution to these problems: user education, smarter compression, and better use of tiered storage and smarter workflows are all necessary - but far from sufficient. In this presentation we introduce two approaches to addressing (some) of these data bottlenecks: dedicated data analysis platforms, and smarter storage software.  We provide a brief introduction to the JASMIN data storage and analysis facility, and some of the storage tools and approaches being developed by the ESIWACE project.  In doing so, we describe some of our observations of real world data handling problems at scale, from the generic performance of file systems to the difficulty of optimising both volume stored and performance of workflows.   We use these examples to motivate the two-pronged approach of smarter hardware and smarter software - but recognise that data bottlenecks may yet limit the aspirations of our science.

{% include image.html url="/assets/images/2018-09-18-extreme-data-attendees.jpg" caption="Meeting Attendees" width=600 align="center" %}

(At at a [workshop](http://www.fz-juelich.de/ias/jsc/EN/Expertise/Workshops/Conferences/Extreme-Data-2018/_node.html ) organised by Martin Schultz at Jülich)
