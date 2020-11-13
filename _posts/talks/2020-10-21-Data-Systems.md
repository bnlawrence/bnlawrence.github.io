---
title: ESIWACE2 Mid-Term Review
when: October, 2020
location: GotoMeeting
layout: talk
categories: talks
tags:  HPC exascale esiwace
talks: Data Systems at Scale, Mid-Term Update
image: assets/images/2020-10-21-s3netcdf.png
---

Data Systems at Scale
---------------------

Presentation: [pdf](/assets/talks/201021_esiwace2_wp4.pdf) (0.5MB)

This was a presentation given as part of the [esiwace](https://www.esiwace.eu/) mid-term review. It describes some of the progress made in one of the work packages,  WP4, which is about data systems at scale. Here the definition of "at scale" means "for weather and climate simulation on exascale (and pre-exascale) supercomputing" _and_ for downstream analysis systems. 

I have an [older post]({% post_url /talks/2019-03-12-Data-Systems %}) linking to a talk describing the work package objectives.

In this presentation I highlighted 
 - our work on ensemble handling. Amongst other activities we have demonstrated "in-flight ensemble data processing" with a large high resolution ensemble (10 member global 25 km resolution using 50K cores).
 - progress with the Earth System Data Middleware ([ESDM](https://github.com/ESiWACE/esdm)), which includes NetCDF interface and some new backends, and 
 - work by our industry colleagues, Seagate and DDN both on ESDM backends and on new active storage systems which will be able to do simple manipulations "in storage",  and
 - our work on [S3NetCDF](https://github.com/cedadev/S3-netcdf-python), a drop in extension for netcdf-python suitable for use with object stores.


