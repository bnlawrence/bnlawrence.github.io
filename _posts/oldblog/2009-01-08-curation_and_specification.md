---
layout: post
title: curation and specification
last_modified: Thursday 08 January, 2009
tags: curation
categories: computing
---
Chris Rusbridge has a couple of interesting posts ([original](http://digitalcuration.blogspot.com/2009/01/email-discussion-on-usefulness-of-file.html) and 
[followup](http://digitalcuration.blogspot.com/2009/01/specifications-again.html)) about specification and curation. The gist is that he's reporting some conversations, which I might baldly summarise as saying something like:
1. Any application stores data and renders it for consumption (by a human or another layer of software). In the best of possible worlds, a specification for the data structure AND the application functionality should be enough to ensure that a third party could render the data for consumption at the next level without reference to the application code itself. However, certain [real world experience](http://blog.dshr.org/2009/01/are-format-specifications-important-for.html) suggests that the specifications are not enough, you need the code as well, because real implementors break their specifications.
</blockquote>

You'll not be surprised to find I have some opinions on this ...
1. I think in nearly all the cases where the specification is not enough, it's because the specification was a) not designed for interoperabilty, and b) was not the **definition** of the format and functionality. In these cases we find the spec is an *a postiori* attempt to document the format (almost certianly the problem with the Microsoft and Postscript examples discussed in the links). In particular, in those cases where we're dealing with preserving information from a format and specification from one vendor, we find both a) and b) violated, nearly all the time. What that says to me is that we should avoid trying to curate information which is in vendor-specific formats in favour of those where there are multiple (preferably open-source) implementations.

What do we do at BADC? (In principle!)
1. Preserve input data. Copy on ingest if we have to, but we prefer (for the data itself) to **demand** that the supplier reformat into a format which does conform to a) designed for interoperability, and b) where there is a specification which preserves **enough** of the information content. (Duplicates of TB of data are not viable).

So, I would argue that if you are doing curation, you have to address workflow before you get to the point of curation. If you know you want to preserve it, then think about that from the off. If you know you don't care about the future (shame on you), then yeah, ok, use your cool vendor tool ... but don't give the data to someone to curate, because curation is, in the end, about format conversion. If not now, sometime in the future INEVITABLY. If the documentation doesn't exist to do it, it's not curating. Don't kid yourselves.

All that said, much of the initial conversation was in the context of document curation, not data curation. IMHO the reason for much of what i perceive as confusion in their discussion, is not recognising the distinction! In the final analysis, I think that 
* if your object is to curate documents (i.e. what I would call the library functionality), then preserving PDF/A, latex etc, is **perfectly fine** - after all, with the spec, you're preserving with the same fidelity that documents have always been preserved. 
* if your object is to preserve the data, then it's a different ballgame, and folk need to confront the fact that curating data requires changes to the original workflow!