---
layout: post
title: Whither service descriptions
last_modified: Tuesday 22 January, 2008
tags: ndg computing xml
categories: computing
---
(Warning, this is long ...)

Last week I submitted an [abstract](abstracts/2008/01/21/servicedescriptions) to the EGU meeting in April in the *The Service Oriented Architecture approach for Earth and Space Sciences* ([ESSI10](http://www.cosis.net/members/meetings/programme/view.php?m_id=49&amp;p_id=323&amp;PHPSESSID=c0ae24c54d)) session. I'd been asked to submit something, but I fear I may be a bit of a cuckoo in the SOA nest ... (if by SOA, we take a traditional definition of SOA=SOAP+WS-*).

The abstract can be summarised even more briefly in two sentences:
* there is a long tail of activities for which the abilities of web services to open up interoperabilty is being hindered by the difficulty in both service and data description, so 
* there is a requirement for both more sophisticated and more easily understandable data and service descriptions.

Some might argue that the latter is a heresy. Amusingly, I wrote that before I opened up my feed aggregator this week to find another raft of postings about service description languages.  Probably the best, and easily most relevant, from my point of view, was [Mark Nottingham](http://www.mnot.net/blog/2008/01/21/wadl_watching), who wrote by far the most sage stuff. I'll quote some of it below. It looks like there was an ongoing discussion that hit the big time when Ryan Tomayko wrote an [amusing summary](http://tomayko.com/weblog/2008/01/18/ws-vs-rest-sucks-nowadays) which was picked up by [Sam Ruby](http://intertwingly.net/blog/2008/01/18/Doctrine-of-Minimum-Necessary-Disclosure) and [Tim Bray](http://www.tbray.org/ongoing/When/200x/2008/01/18/Service-Doc-as-Interface-Def).

It's hard to provide a summary that is more succinct than the material in those links and adds value (to me, remember these are my notes, I don't care about you[^1]) so I won't! But I will write this, because I don't particularly want to wade through them all again.

####  On Resources  

The first point to note is that most of the proponents of service description languages (particularly those from a RESTful heritage) are finally realising that it's not just about the verbs, the nouns matter too! It's fine to argue that you don't need a service description language because we should all use REST, but the resources themselves can be far more complicated beasts than standard mime-types, and [so they need description](http://www.25hoursaday.com/weblog/2008/01/17/MythRESTfulWebServicesDontNeedAnInterfaceDefinitionLanguage.aspx) too.

Mark Nottingham said it best in his summary:
<blockquote>Coming from the other direction, another RESTful constraint is to have a limited set of media types. This worked really well for the browser Web, and perhaps in time we?ll come up with a few document formats that describe the bulk of the data on the planet, as well as what you can do with it. 
</blockquote>
<blockquote>However, I don?t mean "XML" or even "RDF" by "format in that sentence; those are the easy parts, because they?re just meta-formats. The hard part is agreeing upon the semantics of their contents, and judging by the amount of effort its taken for things like UBL, I?d say we?re in for a long wait.
</blockquote>

I've wittered on about the importance of this before, [again]({% post_url oldblog/2007-05-02-interoperability_is_just_over_the_horizon_..._always %}) and [again](blog/2007/05/08/it's_not_how_big_the_tool_is,_it's_what_you_do_with_it). However, there are fundamental problems with using XML to describe resources. I've
[alluded to this issue too]({% post_url oldblog/2007-09-18-on_sql_and_xml %}), but along with the summary by [James Clark](http://blog.jclark.com/2007/04/do-we-need-new-kind-of-schema-language.html), I liked the way that it was put [here](http://nothing-more.blogspot.com/2007/06/wadl-its-really-about-xml-apis.html): 
<blockquote>One of the big problems with XML is that it is a horrid match with modern data structures. You see, it is not that it isn't trivial to figure a way to serialize your data to XML; it is just that left to their own devices, everyone would end up doing it slightly differently. There is no one-true-serialization. So, eventually, you end up having to write code to build your data structures from the XML directly. The problem there is that virtually all XML APIs are horrible for this kind of code. They are all designed from the perspective of the XML perspective, not from the data serialization perspective.
</blockquote>
<blockquote>It gets worse. XML is one of those things that looks really easy, but is actually full of nasty surprises that don't show up until either the week before you ship (or worse.., a few weeks after). Things like character encoding issues, XML Namespaces, XSD Wildcards. It is really hard for your average developer (who makes no pretenses at XML guru-hood) to write good XML serialization/hydration code. Everything is stacked against him: XML APIs, XML -Lang itself, XSD.
</blockquote>

At [one time]({% post_url oldblog/2006-12-07-service_orientated_architecture_-_two_years_on %}), I think I understood what it meant "Share schema not type", but now I don't ...

####  On the Service Description Language itself  

Well, I've tried to review this sort of thing [before]({% post_url oldblog/2006-12-07-service_descriptions %}). Since, then [WADL](https://wadl.dev.java.net/) has hit the big time. From a semantic point of view, I can't say I understand the big differences between WSDL and WADL, although I can appreciate that the WADL syntax is much simpler (and so it's a good thing).

Some folk, sadly including [Joe Gregorio](http://bitworking.org/news/193/Do-we-need-WADL) (whose work I mostly admire), have made a big deal out of the fact that there is no point generating code from WSDL (or WADL or any service description language), because if you do, when the service changes the WSDL (should) change, and so your code will need regeneration or otherwise your service will break. I think that's tosh (it's true, but still tosh, best put in [Robert Sayre](http://www.tbray.org/ongoing/When/200x/2008/01/18/Service-Doc-as-Interface-Def#c1200710138.496593) in a comment): 
<blockquote>HTML forms are service declarations.
</blockquote>

No one is arguing that we don't need HTML forms! The fact is, that clients will break when services change! Sure, some changes wont break the clients, but *some will*! The issue really comes down to *[How well coupled]({% post_url oldblog/2006-12-01-no_silver_bullet_exists %}) are your services and clients?* and if they are strongly coupled *Will you know when the service changes, and can you fix your client if it does?* From experience of using WSDL and SOAP (yuck), I know I'd MUCH rather simply get the new WSDL, and regenerate the interface types .... than muck around at a deep level. (That said, I'm not arguing in favour of SOAP per se! Today's war story about SOAP and WSDL is one set of new discovery client developers complaining about our "inconsistent use of camelcase" in our WSDL ... it seems that they're hand crafting to the WSDL, and they want us to break all the other clients to fit their coding standards).

Of course, me wanting to use a service description language presupposes I've used my human ability to read the documentation (if it exists, or the WSDL if I really have to), to decide whether such a solution is the "right thing to do". 

####  What does this mean to me?  

At the moment we use WSDL and SOAP in our discovery service. I'd much rather we didn't (see above). It could be RESTful POX, which is how we've implemented our vocabulary service (but inconsistent camel case would still break things). It probably will change one day. More importantly, for the data handling services, we're currently using OGC services, where the "service description language" is the Get Capabilities document. This much I know (and where I violently disagree with Joe G) is that it would be **much** easier to use a generic service description language than the hodgepodge of get capabilities documents we deal with. I think OGC Get Capabilities is an existence proof that a generic service description language would be a Good Thing (TM)! In the final analysis, that's probably what I'll say in April (as well as "SOAP sucks" and "[You need both GML **and** data modelling]({% post_url oldblog/2007-05-02-interoperability_is_just_over_the_horizon_..._always %})).
[^1]:
I do really :-)


#### trackbacks (1)

*[Notes on brief service descriptions and bindings]({% post_url oldblog/2008-04-03-notes_on_brief_service_descriptions_and_bindings %}) (from "Bryan's Blog" on (on Thursday 03 April, 2008)*)

I'm coming late1 to a discussion about representing services in feeds and catalogues ...

#### comments (6)

*[Sean Gillies](http://zcologia.com/sgillies) (on Tuesday 22 January, 2008)*

I read the debate a little differently Bryan. It's not about whether services in general need description languages; everyone (whether they go for WS-* or not) agrees that the WS type of services need what is essentially a .h file (N. Minar). The debate is about what kind of description is best for RESTful web services. The bare minimum (hypertext links and forms, what is essentially a service "home page"), or a service header against which you compile a client? WADL and OGC capabilities are in this second category.

*Bryan (on Tuesday 22 January, 2008)*

Thanks. I like the succinct summary. Not sure we did read it differently, perhaps because we don't currently have any real REST services (more's the pity), the way I've summarised my interest makes it seem that I'm taking the discussion and applying it elsewhere. I think the point I'd like to have been making is that even if we recast everything we do "properly" in RESTful services, we'd want service descriptions, not only for compilation but for data description documentation (as argued by a few of the folk). However, you're right, I am going to use that message out of context, and argue that we need simplicity to make it work ... (and despite panning Joe G, there are is much to be careful of when doing that, a generic service description language doesn't mean we can build generic clients, it just means we have some tooling we can reuse).

*[Sean Gillies](http://zcologia.com/sgillies) (on Thursday 24 January, 2008)*

Did you follow up and read Nottingham's driving trip analogy? Good stuff. How do you use WADL without undercutting the goodness that comes from the REST hypertext constraint? http://lists.w3.org/Archives/Public/public-web-http-desc/2006Sep/0000.html

*[Michael Tobis](http://pencilscience.blogspot.com) (on Tuesday 29 January, 2008)*

I am reading your REST/SOA article with the sort of puzzlement that I always face in reading such articles. Some people seem to expect me to operate in this space. I am left with the same sort of bafflement that I used to face when thinking about OOP, i.e., "I have been doing this stuff for years, what on earth can these people be going on about, it seems to have nothing to do with me if it makes any sense at all". (This is the position most Fortran folks are still in.)

I suspect that the approach you are describing in your REST article is related to the one I advocate, which is not to expect any sort of universal interoperability, nor to treat each pairwise coupling as a separate problem, but to treat each pairwise coupling as an opportunity to refine your interoperability toolkit.

I am, however, biased by the well-known scripter's perspective: 

'Some people, when confronted with a problem, think "I know, I'll use XML expressions." Now they have two problems.'

I am absolutely certain that there is value in the simplest possible approach. I generally fail to see the point of the complexities of XML or web services. I'm sure there are domains where I am missing something, but of course, it having always been missing, I don't know what it is.

(Python, by the way, can serialize any object.)

*Bryan (on Tuesday 29 January, 2008)*

(do not) "expect any sort of universal interoperability, nor to treat each pairwise coupling as a separate problem, but to treat each pairwise coupling as an opportunity to refine your interoperability toolkit".

Yes ... but strive towards nirvana too :-)

(And yes, I'm sold on python long since... and am just reading your PyMCT and PyCPL paper :-)  

*[Michael Tobis](http://pencilscience.blogspot.com) (on Wednesday 30 January, 2008)*

I am reading your REST/SOA article with the sort of puzzlement that I always face in reading such articles. Some people seem to expect me to operate in this space. I am left with the same sort of bafflement that I used to face when thinking about OOP, i.e., "I have been doing this stuff for years, what on earth can these people be going on about, it seems to have nothing to do with me if it makes any sense at all". (This is the position most Fortran folks are still in.)

I suspect that the approach you are describing in your REST article is related to the one I advocate, which is not to expect any sort of universal interoperability, nor to treat each pairwise coupling as a separate problem, but to treat each pairwise coupling as an opportunity to refine your interoperability toolkit.

I am, however, biased by the well-known scripter's perspective: 

'Some people, when confronted with a problem, think "I know, I'll use XML expressions." Now they have two problems.'

I am absolutely certain that there is value in the simplest possible approach. I generally fail to see the point of the complexities of XML or web services. I'm sure there are domains where I am missing something, but of course, it having always been missing, I don't know what it is.

(Python, by the way, can serialize any object.)
