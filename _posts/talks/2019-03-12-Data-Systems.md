---
title: ESIWACE2 Kick-Off
when: March, 2019
location: Hamburg
layout: talk
categories: talks
tags:  HPC exascale esiwace
talks: Data Systems at Scale
image: /assets/images/2019-03-12_data_systems_at_scale.png
---

Data Systems at Scale
---------------------

Presentation: [pdf](/assets/talks/190312_esiwace2_wp4.pdf) (0.5MB)

This was a presentation given as part of the [esiwace2 kickoff](https://www.esiwace.eu/events/joint-meeting-2019/esiwace-annual-meeting-and-esiwace2-kickoff-meeting). It describes one of the work packages,  WP4, which is about data systems at scale. Here the definition of "at scale" means "for weather and climate simulation on exascale (and pre-exascale) supercomputing" _and_ for downstream analysis systems. We expect I/O performance and data volumes will limit their exploitation without new storage and analysis libraries.

This work package describes an ambitious programme of work, building on lessons learnt from ESiWACE. It will address a range of issues in workflow, from modifications to a workflow engine ([cylc](https://cylc.github.io/)) and a scheduler ([slurm](https://slurm.schedmd.com/)), to new I/O libraries and data handling tools. Some integration with [pangeo](https://pangeo.io/) is likely. There is a key role for ensemble analysis tools to mitigate aqainst writing data in the first place.

A key goal will be to deploy these new tool in real workflows, within the project, and elsewhere, and to develop them in a way that has a credible path to sustainability. In practice deployability is likely to involve three key facets:

* portability, to ensure a wider range of stakeholders,
* containerisation, to deliver as much as possible within userspace, and
* vendor engagement alongside open-source products, allowing differentiation in the market and realistic business models for those developing customised high-performance storage solutions.

The work package is being led from the University of Reading (Computer Science, and NCAS), with partners from CNRS-IPSL, STFC, Seagate, DDN, DKRZ, ICHEC, and the Met Office.

(See [mid-term update]({% post_url talks/2020-10-21-Data-Systems %}) for an update on progress.)

