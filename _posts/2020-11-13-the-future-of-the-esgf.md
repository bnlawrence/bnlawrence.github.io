---
layout: post
title: The future of the ESGF
last_modified:
categories: computing bigdata
tags: software curation esgf cmip cmip6
excerpt_separator:
image: /assets/images/2020-11-13-esgf_world.png
---

I think most of the community who use climate projections and the products of climate model intercomparison projects depend in some way on the Earth System Grid Federation ([ESGF](https://esgf-index1.ceda.ac.uk/projects/esgf-ceda/)). The ESGF consists of data nodes which are distributed globally, holding petabytes of data:

{% include image.html url="/assets/images/2020-11-13-esgf.png" caption="The Earth System Grid Federation in late 2020, distribution of data nodes, and dataset numbers and volumes" align="center" width="800" %}

ESGF is a classic instance of infrastructure. People appreciate its existence but moan, possibly rightly, about the antiquity of some of the solution. However, I don't think people realise how successful it is as global infrastructure for data sharing; it has been and remains one of the best examples of a distributed infrastructure with distributed ownership and multiple sources of data.

Most of the data nodes are run by modelling centres, using the ESGF software which is jointly developed and maintained by an international collaboration.  That community came together in 2019 to develop a future architecture (see [Kershaw et al, 2019](https://doi.org/10.5281/zenodo.3928222)).  There are some really important planned developments, including making more use of community standards and solutions which were developed since the ESGF was first established, exploiting public cloud (especially for search and identity management), better linkage to other services (again including those deployed since the first days of ESGF), and a complete overhaul of two crucial components: the publisher and the web frontend.

The big hitters[^1] in the software maintenance and development are in the US (with Department of Energy funding to Lawrence Livermore National Laboratory, LLNL) and Europe (with European Commission funding, currently via [IS-ENES3](https://is.enes.org/)). In both cases it is soft money, and in both cases the money (and hence software and development) are at risk. The DoE has apparently just withdrawn funding from LLNL (from some time next year), and the future investment strategy from DoE is unclear. The Commission has made it clear that the funding stream that supported IS-ENES over the last decade will stop at the end of 2022. Within Europe at least half the ESGF funding is at risk and within the States it is likely even a larger fraction at risk.  The future of the ESGF is unclear! 

It is fair to say that the World Climate Research Programme and the World Meteorological Organisation have woken up to their dependency on the ESGF, but have not yet come up with a solution. The wheels are in motion, but no one knows if they will come up with a solution in time.

There are some groups that are willing to pay to help support _some_ aspects of the ESGF system (or to develop their own replacements for those aspects), but they tend to be trying to select the bits they value, without realising that strategy is akin to just buying the bit of an iceberg they can see - without the rest of the iceberg the bit they can see would be much lower in the water and wouldn't last nearly as long!

There are other groups saying "but you could use our infrastructure", but they are not facing the fact that they tend to be _at best_ regional infrastructures and we have a global problem, and again, they tend to be only offering _part_ of the solution.

These are worrying times if you care about climate model data and our ability to exploit intercomparison[^2] at a global scale.

[^1]: Of course it isn't just the DoE and the EC, others are involved too, in particular the Australian National Compute Infrastructure, NASA and NOAA, but the core impetus thus far has come the EC and DoE.

[^2]: Some of you will know that I think we do too much through the CMIP process, but that's different from saying we shouldn't have one, or that we should have a CMIP process (and hence an ESGF) that is only focussed on modellers and their problems and does not serve into the climate impacts community.


