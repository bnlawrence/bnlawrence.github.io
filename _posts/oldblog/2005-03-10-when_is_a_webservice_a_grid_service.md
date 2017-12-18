---
layout: post
title: When is a webservice a grid service?
last_modified: Thursday 10 March, 2005
tags: computing ndg
categories: computing
---

I often get asked what is this thing called a grid. Soon after, I get asked, so what is the difference between a web service and a grid service. The short answer is nothing ... the slightly longer answer is a grid service is a web service packaged up to deal with state, notification, and pointers to objects with state. The following schematic outlines a model of a possible transaction I could have with some data.

![Image: IMAGE: static/2005/03/11/DataFlow.png ](/assets/images/2005-03-11-DataFlow.png)

The concept is that I obtain some data, do some processing on it, produce a picture, and keep the picture. I could do this with instructions following the 1,2,3 route in the schematic ... with the data following the same route. If the data was voluminous, then this is a bad idea.

However, if the data follows the A,B,C route, then things are far more efficient. For that to happen pointers to data have to be passed along the A,B,C route. Often this will be asynchronous - the things happening in Processing may take a while. The VIz service may need to be notified when something is available to be visualised ... so we need state, notification and pointers. This needs to be done in a secure manner.

Now, I could do all this with webservices, passing context tokens around ... but better yet, I can use grid services which have many of the interactions implicit in the tookit of services.  As an aside, the information flow may still be using 1,2,3, but the data flow is going A,B,C ... this is one of the reasons why we avoid attachments as a method of achieving data flow.
