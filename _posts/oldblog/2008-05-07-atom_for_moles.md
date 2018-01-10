---
layout: post
title: atom for moles
last_modified: Wednesday 07 May, 2008
tags: ndg metadata metafor
categories: computing
---
As we progress with our MOLES updating, the issue of how best to serialise the MOLES content becomes rather crucial, as it impacts storage, presentation, and yes, semantic content: some buckets are better than other buckets!

Atom ([rfc4287](http://www.ietf.org/rfc/rfc4287)) is all the rage right now, which means there will be tooling for creating Atom and parsing etc, and Atom is extensible. It's also simple. Just how simple? Well, the meat of it boils down to [one big UML diagram](http://bblfish.net/work/atom-owl/2006-06-06/img/AtomOwl-UML.pdf) or three smaller diagrams which address: 
1. The basic entities (feeds and entries), 
![Image: IMAGE: static/2008/05/07/atom-main.png ](/assets/images/2008-05-07-atom-main.png)
1. The basic content (note that the xhtml could include RDFa!)
![Image: IMAGE: static/2008/05/07/atom-content.png ](/assets/images/2008-05-07-atom-content.png)
1. and links (note that while atom has it's own link class for "special links", xhtml content can also contain "regular" html links).
![Image: IMAGE: static/2008/05/07/atom-links.png ](/assets/images/2008-05-07-atom-links.png)

These three diagrams encapsulate what I think I need to know to move on with bringing MOLES, observations and measurements, and Atom together.
