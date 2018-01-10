---
layout: post
title: Some practicalities with ISO19139
last_modified: Tuesday 18 April, 2006
tags: metadata ndg iso19115
categories: computing
---
A number of us in the met community are rushing towards implementing a
number of standards that should improve interoperability across the environmental
sciences. One of those is ISO19139 which (we hope) will soon be standard xml
implementation of ISO19115 (the content standard for discovery
metadata).

Both ISO19139 and ISO19115 have built into them the concept that 
communities will want to build profiles which are targeted to their own uses.
Such profiles may consists of a combination of constraints (subsets of the standards) and/or extensions (to the standards). I've introduced some of these concepts before ([parameters in metadata]({% post_url oldblog/2006-01-03-whither_parameters_in_metadata %}) and   [xml and dejavu]({% post_url oldblog/2005-08-11-metadata_xml_and_dejavu %}) - and the conclusions of both still stand).

It has been suggested that this ability to constrain and/or extend ISO(19115/19139) could impact on interoperability because by definition an extended document cannot conform to the ISO19139 schema, and so one could not consume a document in an unfamiliar profile (and possibly therebye loose the benefit of a standard in the first place).

I think this is a red herring.  I don't believe anyone is going to have an archive of 
"pre-formed" xml instance documents which conform to 
ISO19139 (but see below). In nearly all cases folks will have their own 
metadata, which they will export into XML instances as necessary (from something, a database, flatfiles, whatever).

Where those xml instances are going to be shared by a 
community, they will be in the community profile - which can 
use xml schema to validate according to the community schema 
 (which had better have all the extension material in a new 
package in a new namespace). But that package can import the 
gmd namespace (gmd is the official prefix of the iso19139 specific schema).

So, these will be valid instances of the schema against which  they are declared, which means the xml schema machinery (love 
it or hate it) will be useable. Consumers of these instances can either parse the file 
for stuff they understand, or exporters can choose to ensure 
that they are ?transformed from the community profile into vanilla
iso19139 on export from the source, or from the community 
profile instance.

The first option (consuming an instance of a schema which we don't fully
understand but which imports and uses - significantly - a namespace that we do understand) is that discussed by Dave Orchard in [an xml.com article](http://www.xml.com/pub/a/2004/10/27/extend.html).

Orchard has some useful rules, of which number 5 is relevant:
<blockquote> 5. Document consumers must ingore any XML attributes or elements in
a valid XML document that they do not recognise. 
</blockquote>

To second option (export a valid iso19139 document from your profile when sharing outside your community) will be much easier if those who create community profiles always produce an accompanying xslt for producing  vanilla iso19139 ... this shouldn't be overly onerous for  someone who can build a valid schema in the first place :-).

This last option will be absolutely necessary when considering the role of community, national and international portals. They *will* have archives of ISO19139-like documents, and it will be encumbent on the data providers to ensure that they can harvest the *right* documents - I don't think it makes sense to rely on the portals consuming non-specific documents and then processing to get the right records for their portals! (*This paragraph added as an update in response to email from Simon Cox who reminded me about this application*).

But all this technical machinery is the easy part. The hard part is defining a dataset so we can decide what needs an ISO19139 record! (Some if the issues for citing a dataset are discussed [here]({% post_url oldblog/2005-12-22-data_citation %}) and most of them come down to *What is a dataset?*) 


#### trackbacks (1)

*[On substitution groups and ISO19139]({% post_url oldblog/2006-10-19-on_substitution_groups_and_iso19139 %}) (from "Bryan's Blog" on (on Friday 20 October, 2006)*)

I have bleated already about the difficulties of using ISO19139 with restrictions which introduce new tag names. ...

#### comments (3)

*John Hockaday (on Thursday 11 May, 2006)*

I think that you misinterpret the importance to identify what is a "dataset".  ISO 19115 metadata is for all types of data.  There are already 16 different types of data defined in ISO 19115 that can have metadata ranging from attributes right up to series as well as software, services and "nonGeographicData".  Therefore, ISO 19115 can and should be used for all data.

*bryan (on Friday 12 May, 2006)*

Hi John. I think you've misunderstood why I think the question is fundamental. All our data should be catalogued by ISO19139, but at what level? We have tens of terabytes of data. Do we catalogue each byte individually? Each day's data? Some of the issues are discussed in the context of data citation at {% post_url oldblog/2005-12-22-data_citation %}

*Rob Atkinson (on Thursday 28 September, 2006)*

Two comments: 
1) ISO19139 is relatively hard on implementations - you cant traverse the schema to build a data model, because there are funky little xs:anyType placeholders. (am working on a solution for Feature-level metadata within Geoserver - hard, but not impossible, and probably worth doing)

2) Profiles in general need some thought. In particular, constraining a schema to use values from an externally defined vocabulary. We need a generalised "the term comes from that register" mechanism. See https://www.seegrid.csiro.au/twiki/bin/view/AppSchemas/MetadataProfiles
