---
layout: post
title: Bibliographic References, ISO19115 and NumSim
last_modified: Friday 20 January, 2006
tags: curation ndg claddier metadata iso19115
categories: computing
---
One of the things one can imagine our [NumSim]({% post_url oldblog/2006-01-13-new_version_of_numsim_available %}) discovery metadata to support is the ability for someone to identify that a particular model component (say the atmosphere) has a bibliographic reference associated with it that describes some part of the system. Having done that, to find all other simulation datasets for which the atmosphere is associated with the same citation. What this implies is that1. We need to support bibliographic references associated with particular parts of the NumSim extension (as opposed to simply listing them as part of the parent DIF), and1. We should describe such references in a standards compliant manner, and in such a way that we can format the reference both for automatic discovery and for humans to view on the screen (or paper).

The first of these is in the current schema simply by having reference elements (of type xs:string)  in a reference list itself a subelement of the model components.

Given NumSim is aimed eventually at ISO19115, I thought I'd take a look at the machinery for supporting this "properly", which I naively thought would be "obvious". Within ISO19115, it's clearly the [CI_Citation](/assets/images/ISO19115_CI_Citation.jpg) datatype. Ideally then, we should have references of type CI_Citation. At the same time, within [CLADDIER](/projects/claddier) we know we have to be able to map between the library communities standard ways of referencing citations ... which we might assume to be based around Dublin Core and/or [ISO690](/notes/ISO690).

Currently in NumSim we might have:<pre>
&lt;NS_Reference&gt;
Pope, V. D., M. L. Gallani, P. R. Rowntree and R. A. Stratton, 2000:
The impact of new physical parametrizations in the Hadley Centre climate model -- HadAM3.
Climate Dynamics, 16: 123-146.
&lt;/NS_Reference&gt;</pre>
How would we code that in ISO19115[^1]? Well, it looks horrific.
I think the clear intention is that authorship should be through the CI_citedResponsibleParty element (see [CI_ResponsibleParty](/assets/images/ISO19115_CI_ResponsibleParty.jpg)), so let's lay this one out in psuedo XML:<pre>
&lt;CI_Citation&gt;
&lt;title&gt;The Impact of new physical parameterizations &lt;/title&gt;
&lt;citedResponsibleParty&gt; Pope ...&lt;/citedResponsibleParty&gt;
&lt;citedResponsibleParty&gt;Gallani ... &lt;/citedResponsibleParty&gt;
&lt;series&gt;&lt;name&gt;Climate Dynamics&lt;/name&gt;&lt;issueIdentification&gt;45
&lt;/issueIdentification&gt; &lt;page&gt;123-146&lt;/page&gt;</pre>
well that makes some sense (but what about using collectiveTitle for the journal title?), but we need to dive into that citedResponsibleParty some more.
Presumably we should have, for example,:<pre>
&lt;citedResponsibleParty&gt;
&lt;individualName&gt; Pope, V.D. &lt;/individualName&gt;
&lt;role codeList=? codeListValue-?&gt;
&lt;/citedResponsibleParty</pre>
which is what I think is what the version I've got of ISO19139 would have, i.e., we have to jump off to someone else's code space (Dublin Core), so this would be a DC.creator tag? This seems rather unfortunate and cumbersome. If we're going to someone else's code space, then why not avoid the CI_Citation type for a bibliographic entry anyway, and go straight to Dublin Core or ISO690?

Note that if we stick with this stuff there's no sensible way to format this stuff either, because we can't put the initials in their own tag, so when we go to xhtml we can have the first author surname first, and others thereafter.

Alternatively, we could do this (ignoring the XML representation for a moment):<pre>
CI_Citation.title=The Impact of new physical parameterizations ...
CI_Citation.identifier=doistring
CI_Citation.identifierType=doi
CI_Citation.otherCitationDetails=the reference string which is our "standard reference".</pre>
In which case we could use [ISO690](ISO690) to get the last string "right", but relying on the DOI will only work for "modern" references in *some* journals.

Either way, it's not a great advertisement for ISO19115, reference lists are a must for any metadata standard. While I appreciate CI_Citation supports a number of citation mechanisms throughout ISO19115, you would have thought making bibliographic citations easy would have been a fundamental requirement! I'm tempted to use an xml schema version of bibtex like [this one](http://bibtexml.sourceforge.net/), which I suppose could legitimately be built in via an extension.

If anyone can give me a cleaner example of how it **should** be done, I'd be grateful!
Even better, some public domain xml schema to go with the examples.

[^1]: here I'm hopping between the content standard, and a draft of ISO19139 dated September 2005
