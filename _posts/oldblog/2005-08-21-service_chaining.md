---
layout: post
title: Service Chaining
last_modified: Wednesday 14 December, 2005
tags: computing ndg
categories: computing
---
Having spent the last four years as part of the UK e-science community, and buying into the wonders of what "the grid" can do for me, I've just spent a bit of time looking into exactly what is in the ISO19119 standard for geographic information services. Despite my colleague Andrew Woolf telling me how important this was, I've never really looked into this standard (despite running round banging on about how important standards are, and going on about how good they are in the metadata world, I hadn't had time to read this one ...). Anyway, it turns out to describe what most of the e-science world has been reinventing, and redocumenting in an adhoc manner for the last few years. Oh why oh why do standards organisations hide their wonderful products so successfully that no one uses them?

I thought the following was an inciteful analysis of patterns of workflow management. Essentially, they describe three types of workflow management:
* Transparent: user sees all of the services
* Translucent: workflow aids the user
* Opaque: aggregate service hides services

These three modes are described in three UML diagrams in the standard, only one of which is necessary to get the flavour, e.g. the translucent case:

![Image: IMAGE: static/2005/08/21/translucent.jpg ](/assets/images/2005-08-21-translucent.jpg)

The transparent case differs in that the workflow is set up by the user after looking at catalogue descriptions, and the opaque case the catalog describes the result of a series of workflow activities which are, as the name suggests, opaque to the user.

While this isn't a great leap forward, I claim it's inciteful because it discriminates simply between the various things we as a community have been building, and clearly identifies how workflow will be useful to us. Now, if only someone was building workflow engines based on the ISO service metadata descriptions in this standard ...
