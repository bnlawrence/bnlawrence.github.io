---
layout: post
title:  Internet Explorer REALLY Sucks 
last_modified: Monday 28 February, 2005
tags: computing
categories: computing
---

I've been aware that my blog didn't render properly on internet explorer.
I thought it was probably because my CSS and/or my XHTML weren't standards
compliant. So, I've done some testing. My new wikiBNL code and my style sheed have 
been tested with 
* An XHTML [validator](http://www.htmlhelp.com/tools/validator/)
* A CSS [validator](http://jigsaw.w3.org/css-validator/)

It passes both. Now, all newer pages should render correctly, but perhaps I can understand it if the older (non standards compliant) ones don't. And what was the problem? IE didn't like comments in the CSS file (which stopped
it being valid CSS, but didn't stop other browsers from getting it right).

I'm obviously not the only person with major problems with
Internet Explorer.  I think this [open letter](http://www.theregister.co.uk/2005/02/11/hakon_on_ms_interroperability/) to Bill Gates says it all.