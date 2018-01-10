---
layout: post
title: Granule Concepts
last_modified: Friday 11 August, 2006
tags: ndg metadata moles
categories: computing
---
We've been struggling with a few concepts in mapping how we want variables and datasets to be related. The struggle, as in [most technical discussions]({% post_url oldblog/2004-12-22-VerifyableStatements %}) is that one needs to be very exact about what one is saying. To try and simplify our discussions (and maybe yours), I've tried to produce some UML which relates concepts like datasets and files to thing we actually deal with.

![Image: IMAGE: static/2006/08/11/GranuleConcepts.jpg ](/assets/images/2006-08-11-GranuleConcepts.jpg) 

The key relationships:
* datasets can be composed of other datasets
* datasets have discovey records
* datasets can be composed of granules
* granules are not independently discoverable
* granules are composed of phenomena
* granules are associated with (potentially multiple) files
* files can be associated with (potentially multiple) granules
* granules are associated with variables
* a phenomenon is associated with (potenially multiple) variables
* a variable has exactly one CF standard name and is associated with exactly one member of the BODC vocabulary
* a CF variable may be associated with CF coordinate variables, and if so,
* the relationship between the variable and the coorddinate may have a CF cell method associated with it.
* a CF coordinate variable is simply a special case of a CF variable
* a MOLES dgDataEntity is an implementation of the concept of a dataset
* a MOLES dgGranule is an implementation of the concept of a granule. 
