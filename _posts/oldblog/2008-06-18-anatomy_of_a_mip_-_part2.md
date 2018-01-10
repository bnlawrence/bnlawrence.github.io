---
layout: post
title: anatomy of a mip - part2
last_modified: Wednesday 18 June, 2008
tags: metadata metafor curation moles
categories: computing
---
My [recent description]({% post_url oldblog/2008-06-12-the_anatomy_of_a_mip %}) of the key components of model intercomparison projects was done both as input to [metafor](/tags/metafor) deliberations and as preparation for a visit by Simon Cox. We spent a bit of that visit time discussing the UML describing such projects (which appeared in the previous post). In doing so, we managed a few simplifications and fixes to my UML ...

![Image: IMAGE: static/2008/06/18/anatomy-of-a-mip2.png ](/assets/images/2008-06-18-anatomy-of-a-mip2.png)

The key points to notice are 
* fixing the association to be in keeping with usual use of UML (in particular, noting that a composition association implies that if the parent instance is deleted, the child instances should also disappear).
* making more clear the association between RunTime and Experiment by adding the explicit conformsTo association.
* moving the ModelCode to be an adjunct to the RunTime so that the RunTime directly produces the Output.
* (**update**, woops missed the important one): using the view stereotype to indicate the classes which we believe will form launch points for discovery.
