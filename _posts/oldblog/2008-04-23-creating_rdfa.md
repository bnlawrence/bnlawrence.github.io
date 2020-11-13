---
layout: post
title: creating RDFa
last_modified: Wednesday 23 April, 2008
tags: metadata ndg metafor
categories: computing
---
Let's just assume for a moment that I want to create RDFa in XHTML. Just how should I go about it? It appears that there are no html authoring tools that are "RDFa aware"!

I want to play wth RDFa but I'm not going to author it in raw HTML. I'ts just not worth it. Can I programme my
way out of it? If I wanted to modify my wiki software to support (some) RDFa [assertions](http://www.w3.org/TR/2008/WD-rdfa-syntax-20080221/#s_Syntax_overview) what might I consider as important?

####  Basic Syntax  

There are six XHTML attributes:1. @rel: provides forward predicates (subject is the enclosing entity, object is
pointed to by a scoped URI aka CURIE)1. @rev: provides inverse predicates (subject is pointed to, object is enclosing
entity)1. @name: provides a predicate as a plain literal.1. @content: a string for supplying a machine readable version of an object rathe
r than the enclosing element content (displayed to humans).1. @href: a partner resource object (eg remote html link),1. @src: a partner resource object which is embeddable (eg an image).

(Just what I mean by enclosing entity needs definition too.)

 There are five RDFa specific attributes:
1. @about: can provide a URI which gives a subject.1. @property: can provide URI(s) used for expressing relationships between the subject and some literal text (predicate)1. @resource: a resource object which is not clickable ...1. @datatype: a uRI defining a datatype associated with1. @instanceof

And we need to declare namespaces.

So, it's all about applying attributes to html entities. For the moment we could reduce
the problem to using the RDFa attributes verbatim, but introducing a notation
for how to do that in (my) wiki syntax.

####  Methodology?  

I might want to be able to make namespace definitions with scope for a document
and scope within specific blocks.
* An expedient way forward would be to only allow namespace definitions once, at the beginning of a document. This would result in conformant documents and solve the 80-20 for this issue.

I want to add RDFa assertions to entities? How? We can start with the syntax examples ...

Example one was adding page level metadata. Assuming I want to do that at the blog entry level, and assuming for the moment I can't use atom as the container format, then the container needs to be an
html div which already takes us into a version of example three. At this point,
we could introduce a page level syntax which looked something like:<pre>
@@
xmlns:foaf="http://xmlns.com/foaf/0.1/"
xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:cc="http://creativecommons.org/ns#"
xmlns:cal="http://www.w3.org/2002/12/cal/ical#"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
property="dc:creator" content="Bryan lawrence"
rel="foaf:workplaceHomepage" href="http://home.badc.rl.ac.uk/lawrence"
@@
page content</pre> which should result in<pre>
&lt;div xmlns:foaf="http://xmlns.com/foaf/0.1/"
xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:cc="http://creativecommons.org/ns#"
xmlns:cal="http://www.w3.org/2002/12/cal/ical#"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
property="dc:creator" content="Bryan lawrence"
rel="foaf:workplaceHomepage" href="http://home.badc.rl.ac.uk/lawrence"&gt;
page content
&lt;/div&gt;</pre>
To repeat example three, taking in account the limitation to namespaces only at
the page level, we could
enhance the wiki link with attributes:<pre>
This document is licensed under a
[http://creativecommons.org/licenses/by-nc-nd/3.0/ Creative Commons
License @rel=cc:license]</pre> to clearly instantiate the predicate relationship of the link to the calling page.

Similarly, we could write the fourth example:<pre>
I'm holding @@property=cal:summary@ one last summer Barbeque@@</pre> to achieve the<pre>
I'm holding &lt;span property="cal:summary"&gt; one last summer Barbecue&lt;/span&gt; ...</pre> example. Here we're using @@ to introduce the enclosing entity (span since
it appears inside
a block level entity) and @@ to close it, with @ used to terminate a specific attribute, allowing to have
multiple attributes as required (@@blah=blah@blah2=blah2@ content @@) etc.
* We could add these as attributes to a block level entity by simply beginning
the block level entity
with the @@ syntax (i.e. paragraphs starting on new lines, list items, quotes) and terminating the block level attributes (rather than the block) with the @@. See the example a bit further below.

The next example is to have what is displayed different from the machine readable substrate, so
we have<pre>
... on @@property=cal:dtstart@content=2007-916T1600-0500@datatype=xsd:datetime@
September
16th at 4pm@@.</pre>
which would give:<pre>
... on &lt;span property="cal:dtstart" content="20070916T1600-0500"
            datatype="xsd:datetime"&gt; September 16th at 4pm &lt;/span&gt;.</pre> (Note that if we needed an @ within a property, we would escape it with a backslash to have \@ ).

The next example is to introduce the instance of attribute so that all the properties of a block
level object are associated with it. That's straightforward:<pre>
...previous paragraph.

@@instanceof=cal:Vevent@@ I'm holding @@cal:summary@ one last summer barbeque@@
on @@property=cal:dstart@content=20070916T1600-0500@datatype=xsd:datetime@ September
16th at 4pm @@.

Next paragraph ...</pre> Note the first @@ has no content after the attribute and before the closing
 @@ so it applies to the block level entity.

The final example in that section has the ability to make a remote document the
subject
of the association. We could do that using the same contact notation:<pre>
I think @@about=urn:ISBN:0091808189@instanceof=biblio:book"@ White's book 'Canteen Cuisine@@
is well worth ...</pre>
####  Summary  

So, in terms of new wiki syntax it would appear that if we don't try and shorten
 the attributes themselves
(which is worth considering, but not in this discussion), we can get away with using @@ in three
different ways:1. When @@ appears on it's own, it is intended to start a &lt;div&gt; which will carry
on to the end
of the current document and provide a page level scope for RDFa attributes.1. When @@ begins a block level entity (paragraph, list item, description) it is
used for block
level attributes, unless it encloses text after the last attribute, in which case it is being used for inline
attributes ...1. which is the last type, which creates a span around some content to enclose the attributes.

In addition, we allow @ inside the standard square bracket link syntax.

Now I reckon that lot would be straightforward to implement!

Why hasn't anyone else introduced a wiki syntax? (Have they and I'm just not aware?)

#### trackbacks (1)
*[Implementing my RDFa wiki code]({% post_url oldblog/2008-04-25-implementing_my_rdfa_wiki_code %}) (from "Bryan's Blog" on (on Friday 25 April, 2008)*)I claimed it would be straightforward to add the RDFa syntax to my wiki ...

#### comments (3)
*[Mike Linksvayer](http://wiki.creativecommons.org/User:Mike_Linksvayer) (on Thursday 24 April, 2008)*
xmlns:cc="http://creativecommons.org/licenses/"

should be

xmlns:cc="http://creativecommons.org/ns#"*Bryan (on Thursday 24 April, 2008)*
Thanks Mike. You're right of course - copying and pasting without the brain involved. I've fixed it in the text.*[LocalHero](http://localhero.biz/) (on Sunday 27 April, 2008)*
My website 

http://localhero.biz/

already does this as you can locate an article and then the database outputs the location in XHTML+RDFa. However I am currently overhauling the backend database structure so it will support rdf natively so in therory anything could be asserted. 