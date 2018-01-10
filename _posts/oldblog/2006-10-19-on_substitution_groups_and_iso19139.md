---
layout: post
title: On substitution groups and ISO19139
last_modified: Friday 20 October, 2006
tags: xml iso19115 metadata ndg
categories: computing
---
I have [bleated already]({% post_url oldblog/2006-08-15-to_extend_or_not_to_extend_... %}) about the difficulties of using ISO19139 with
restrictions which introduce new tag names.

Now the official way to do this is probably to exploit substitution groups in the new xml schema associated with your restriction. So, if one wanted to restrict, for example gmd:MD_Metadata one might start in your new schema with something like 
~~~~~ xml
<element name="restricted_MD_Metadata" type="ourMD_Metadata" substitutionGroup="gmd:MD_Metadata">
stuff
</element>

~~~~~

(See [w3schools](http://www.w3schools.com/schema/schema_complex_subst.asp),
the xml schema [primer](http://www.w3.org/TR/2001/REC-xmlschema-0-20010502/), or
[Walmsey, 2001](http://www.datypic.com/books/defxmlschema/chapter16.html),
to explain the syntax). Then in the instance document, one would have
~~~~~ xml
<restricted_MD_Metadata>
stuff
</restricted_MD_Metadata>

~~~~~

At this point one could use the xml schema validation machinery to ensure one had a nice valid instance of the new restricted schema. 

My beef is how we use this. The gurus will tell you there is no problem, and maybe there isn't if one wants to invest an enormous amount of time in complex handlers (even so, maybe it's [
not that straight forward for data binding](http://lists.xml.org/archives/xml-dev/200508/msg00615.html), and perhaps the tools 
aren't really 
[that mature](http://www.stylusstudio.com/SSDN/default.asp?action=9&amp;read=2948&amp;fid=23) - or weren't in 2004).

So, if I'm writing code to handle ISO19139 documents, I'm going to be writing xslt or using xpath or xquery to get at particular content or I'm going to have to invest in brute force if I want to handle things in a high level language like python (as far as I know there are no pythonic tools that get close to this sort of requirement internally).

Let's just explore the brute force method, and a simple use case: I have harvested ISO19139 profiles (I'm starting to think "variants" - complete with quotes - would be a better term :-) from a number of places, and want to deliver the titles to a web page ... so I need to find the titles. I can't assume I can use a simple xpath expression (which *is* supported in python) to find all the titles. I have to parse all the relevant schemas, and do something complex to find the new title elements. In practice, I have to support each profile as a completely different schema, they might as well not share the ISO19139 heritage - even though there are advantages in the ISO19115 content heritage. Yuck.

OK, now suppose I hand this off to an xquery engine. How easy is that? Let's assume it's not buggy ... This is essentially the use case described as 
1.9.4.7 Q7 in the **June 2006** [use case](http://www.w3.org/TR/xquery-use-cases/xquery) document. I'm not that familiar with xquery, but it appears that 
<pre>
schema-element(gmd:MD_Metadata)
</pre>
should then match any element which is linked to it via a substitution group declaration like that above. If it really is that simple, then this is much easier than the brute force method, and a good reason for passing my problems to a *real* xquery engine.

However, this may well work fine for handling document reshaping type tasks, but  returning to the use case, I could well have tens of thousands of harvested documents, if not millions, and so I may well be considering indexing.  I don't know, but it would appear that one has to rewrite all substitution group elements when producing an index - does our [eXist](http://exist.sourceforge.net/) native xml database technology do this automatically for me? I don't know, and that's the point.

All this marvellous xml technology is bloody complicated, and all to handle the case that a community wants to restrict the usage of some tags or lists! Why make all this grief? Wouldn't it be far easier to give community guidance, but accept perfectly valid ISO19139 documents which fall outside that guidance, because we could all simply follow the simple rules in David Orchard's article [article](http://www.xml.com/pub/a/2004/10/27/extend.html), and especially the one I've [highlighted before]({% post_url oldblog/2006-03-28-some_practicalities_with_iso19139 %}):
<blockquote>Document consumers must ingore any XML attributes or elements in a valid XML document that they do not recognise.
</blockquote>

We could rewrite that as:
<blockquote>Communities  should give guidance on those ISO19139  attributes or elements that need populating for usage within the community (and which might need to be handled by community tools).
</blockquote>

Job done. No complicated machinery. More tools available, easier indexing, and much easier human parsing of everything ... (from the schemas, to the instances, and all the code that handles them).

#### trackbacks (1)

*[A proposal for profiling ISO19139]({% post_url oldblog/2006-11-30-a_proposal_for_profiling_iso19139 %}) (from "Bryan's Blog" on (on Wednesday 06 December, 2006)*)

Over this week a group of us (Rob Atkinson, Simon Cox, Clemens Portele and myself) have been reviewing the reality of problems with profiling ISO19139 and conforming with appendix F of ISO19115. The following is my summary of what I think we agreed.
