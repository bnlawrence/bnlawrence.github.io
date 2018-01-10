---
layout: post
title: On Access Control
last_modified: Tuesday 15 August, 2006
tags: ndg
categories: computing
---
As part of the [dews](http://www.dews.org.uk) project, we need to deliver access control for OGC Web Services. In particular, we're planning on limiting access to resources delivered by [geoserver](http://docs.codehaus.org/display/GEOS/Home). The current concept for dealing with this is displayed in some simple UML:
![Image: IMAGE: static/2006/08/15/LegacyApplications.jpg ](/assets/images/2006-08-15-LegacyApplications.jpg)

The bottom line is that a normal request will first involve a redirection to establish a security context, followed by a re-request using it, and then  calling the application itself. More details are on the [ndg trac site](http://proj.badc.rl.ac.uk/ndg/wiki/Security0607).

#### trackbacks (1)

*[Access Control]({% post_url oldblog/2006-12-19-access_control %}) (from "Bryan's Blog" on (on Tuesday 19 December, 2006)*)

I've said it before, and I'll say it again. If you have high volume or high value real resources on the web, you need access control!...
