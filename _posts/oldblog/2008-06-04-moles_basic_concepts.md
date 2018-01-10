---
layout: post
title: moles basic concepts
last_modified: Wednesday 04 June, 2008
tags: ndg metadata metafor moles
categories: computing
---
[Another]({% post_url oldblog/2008-04-01-more_moles_version_two_thinking %}) **interim** version of MOLES, the main changes here are to 
* make clear that dgEntity and dgBase are abstract (never instantiated),
* for the moment at least, not all moles entities are discoverable
* explicitly include attributes necessary for the mandatory ISO elements.

I expect the next version will move to specialising from Atom entities rather than GML feature types (although we'll explicitly allowing GML feature types to be encapsulated in the atom content).

Anyway:

![Image: IMAGE: static/2008/06/04/moles-main.png ](/assets/images/2008-06-04-moles-main.png)
