---
layout: post
title:  M2Crypto Woes 
last_modified: Friday 25 February, 2005
tags: python computing
categories: computing
---

Guido (he of python fame), [has a rant](http://www.artima.com/weblogs/viewpost.jsp?thread=95863) about M2Crypto. This is a worry from an NDG point of view. In it he also
makes the following comment about SWIG as well:<blockquote>... I've yet to see an extension module using SWIG that doesn't make me think it was a mistake to use SWIG instead of manually written wrappers. The extra time paid upfront to create hand-crafted wrappers is gained back hundredfold by time saved debugging the SWIG-generated code later.
</blockquote>

We've only been exposed to SWIG in a big way once, and it was a nightmare. The code involved worked on one platform, not on another, on same days, and not on others. Repeatable problems they weren't ... but to be fair, in that case it might not have been SWIG's fault, but then, we couldn't tell!