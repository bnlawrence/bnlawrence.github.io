---
layout: post
title: Implementing my RDFa wiki code
last_modified: Friday 25 April, 2008
tags: metadata ndg python metafor
categories: computing
---
I [claimed]({% post_url oldblog/2008-04-23-creating_rdfa %}) it would be straightforward to add the RDFa syntax to my wiki.

Actually, most of it was. The hardest part was putting the attributes into the (many different sorts of) links
that my wiki supports. So I took the opportunity to clean up the link handling code.

[This](static/2008/04/25/test_RDFaformat.py) is my RDFa wiki syntax[^1] unit test code. The attentive reader will note that I use both the format and statelessformat methods
of my wiki formatter (the statelessformat method is called by the format method in normal use). This exposes the fact that it turned out to be easiest to do the RDFa handling in two passes. The first
pass was in the normal statelessformat (which does links, simple bold, italic, greek etc). In doing that it also now marks
up inline RDFa and flags to a second pass the block and page level RDFa. These get handled right at the end of all the other wiki handling (which handles list and table state, preformatting etc) - block level RDFa gets tacked onto the previous paragraph entity, and page level RDFa gets put into a DIV that encloses everything else. 

The point about what I have done, is to try and develop a syntax that can be tacked onto (most existing) wiki syntaxes without much grief. It seemed to work. So now I have code that can create RDFa. The next step will be to
plumb it into Leonardo (shouldn't be hard), and then try and play with some real RDFa creation. That may have to wait a week or two on a) my day job, and b)my life ...
[^1]: In the code, note the slight syntax change from the previous exposition: there are no quotes around **any** attributes in the wiki text, although they appear in the output. Last time I left the quotes in for the page level stuff.


#### comments (1)

*[Michael Hausenblas](http://sw-app.org) (on Friday 25 April, 2008)*

Great job. I posted an entry on rdfa.info the other day, already. Would you mind adding your stuff to the RDFa community Wiki (http://rdfa.info/wiki/RDFa_Wiki)?

Cheers,
Michael
