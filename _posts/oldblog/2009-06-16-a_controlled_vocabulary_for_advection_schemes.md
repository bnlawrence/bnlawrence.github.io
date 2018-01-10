---
layout: post
title: A controlled vocabulary for advection schemes
last_modified: Tuesday 16 June, 2009
tags: metafor ndg curation badc cmip5 environment
categories: computing
---
Anyone who collects metadata for a living knows the problem. We ask a bunch of folk to give us metadata, and the results are variable, and not much use for searching and comparison.

Here's an example, colleagues in the [Curator](http://www.earthsystemcurator.org/) project asked a bunch of folk to provide a name for their advection scheme in a dynamical core comparison project. This is what they got:

![Image: IMAGE: static/2009/06/09/advectionNames.jpg ](/assets/images/2009-06-09-advectionNames.jpg)

(sorry about the crap quality screenshot, but that was off a shared desktop an Adobe Connect session).

In an attempt to do something approaching science, I offered to help untease these in the [Metafor](http://metaforclimate.eu/) controlled vocabulary work (needed for [CMIP5](cmip5)). In metafor we've potentially got a bunch of places to put this information, as part of the Metafor dynamic core description, including potentially:
* advection name (Prather etc)
* advection type (Semi-Lagrangian)
* accuracy order (1st order etc)
* conservation fixer type 
* conserved properties etc 

In the rest of the dynamic core we currently have sections on the basic approximations, time-stepping framework, horizontal discretization, horizontal diffusion, boundary conditions, and conservation methods. We clearly need to decide how much the conservation properties are part of the total equation set, or the advection scheme alone). We also need to distinguish between advection for tracer transport, momentum transport, and advection within component models (such as chemistry models).

I also need to comb the literature for some key papers, to construct some a priori expectations for default names.

This will be rather more fun than my normal day job!

(By the way, this is not for an effort to describe models in enough precision to rerun them, it's in an effort to describe what has been run ...)
