---
layout: post
title: CMIP5 - The Federation
last_modified: Thursday 11 December, 2008
tags: cmip5
categories: environment
---
Next week there is a meeting which I hope will finalise the data requirements to participate in [CMIP5](http://www.wmo.ch/pages/prog/wcrp/documents/WCRPnews_20081015.pdf). I can't go, but there are a number of issues on the table which I care about, I'll try and write about each in it's own blog post, which you'll be able to find by looking at my (new) [CMIP5](CMIP5) category page.

[PCMDI](http://www-pcmdi.llnl.gov/) is leading the development of a global data archive federation to support CMIP5. It needs to be global: conservative estimates of the volumes of data to be produced for CMIP5 are that there will
be PB produced in the many modelling centres involved in producing conforming simulations. Within those PB of data, certain variables, periods, and temporal resolutions of output are going to be defined to create a core archive. We hope that it will be about 500 TB in size.

The global federation being put together will federate 
* three copies of that core (one at PCMDI, one here at BADC, and one at the [World Data Centre for climate at DKRZ](http://www.mad.zmaw.de/wdc-for-climate/)), and 
* as much of the data held in the individual data providers as is possible.

Schematically we see something like this
![Image: IMAGE: static/2008/11/14/cmip5.federation.png ](/assets/images/2008-11-14-cmip5.federation.png)
where 
* each colour is meant to represent the data from one modelling centre,
* the outer ring represents the federation
* the inner ring represents the core
* there are some modelling groups who have data in the federation and in the core, and
* some groups who are not part of the federation, yet have data in the core.

(the schematic has nine modelling groups, six in the federation, but in reality there will be many more and the distribution between the camps is not yet known, in particular, while the diagram shows an equal distribution between
modelling centres and cores, we expect PCMDI to ingest most of the data directly as was done for CMIP3). (Clarification added 11/12/08.)

BADC expects to have three roles in this activity, we will be
1. representing the [Met Office Hadley Centre](http://www.metoffice.gov.uk/research/hadleycentre/) (holding as much data as possible, whether in the core or not),
1. holding simulation data on behalf of the NERC community as a federation partner, again, whether in the core or not, and
1. as a core federation partner, holding a core copy.

I hasten to add, all the core partners will be deploying services to help prospective users by producing simple diagnostics and subset the archive in may different ways - so as to avoid crippling download volumes!
