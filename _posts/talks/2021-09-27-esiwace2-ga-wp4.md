---
title: ESiWACE2 2021 General Assembly
when: September 27, 2021
location: Gotomeeting
layout: talk
categories: talks
tags:  HPC exascale esiwace  
talks: 
    - WP4 Data at Scale 
image: assets/images/2021-09-27-Objectives.png
---

An update on progress in the ESiWACE2 fourth work package, WP4, data (systems) at scale. 

<span class="presentation-link"> Presentation: [pdf](/assets/talks/2021-09-27-esiwace2-ga-wp4.pdf) (4 MB) </a>

We discussed the WP4 objectives and our progress on three different pieces of technology: support for in-flight ensemble diagnostics, semantic storage tools, and the Earth System Data Middleware (ESDM). I gave a description of the first two, and [Julian](https://hps.vi4io.org/about/people/julian_kunkel) described the ESDM and accompanying activities. 

For my bits:
 -  We showed some great results from our use of XIOS for ensembles, with scaling results from a one-hundred member N96 system and sixteen-member N512 system. We're convinced that when we do this for real for high-resolution models the extra work to do the ensemble diagnostics will be lost in the noise. We have more work to do to do it for real though, including setting up real diagnostics for each member, and the new ensemble diagnostics. We've got a cool new CYLC system to handle an ensemble member crashing during the run.
-  We also showed our plans for moving forward with semantic storage technologies as part of both the rest of ESiWACE2 and ExCALIBUR. There will be work on a new tape and object store interface for deployment on HPC platforms remote from the storage and analysis platform (e.g. for use on ARCHER2 writing to JASMIN), and on our new aggregation syntax (of which much more in the future). 