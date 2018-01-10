---
layout: post
title: to extend or not to extend ...
last_modified: Tuesday 15 August, 2006
tags: iso19115 metadata ndg
categories: computing
---
[A few months ago]({% post_url oldblog/2006-03-28-some_practicalities_with_iso19139 %}) I wrote a few words about practicalities with ISO1939. The key reason for using ISO19139 is that it is a standard for metadata *interoperability*. A key a priori assumption is that one has a *community who have agreed to interoperate* ... because in practice to interoperate will require a [profile]({% post_url oldblog/2005-08-11-metadata_xml_and_dejavu %}) of ISO19139 which defines *for a community* what *interoperability* means to *them*. 

Well, that's clear then. Communities will build profiles. This is a good thing, because it means ISO19139 will have direct value to those communities, providing an infrastructure where their concepts can either be specialised by limiting broad concepts in the parent schema or by extending concepts in the parent schema to add new attributes etc or both. Two communities doing this for real that I care about are the IOC and the WMO.

The problem with profiles though, is that profiles probably wont be easily consumed by *other* communities (i.e. will the WMO be able to consume the IOC instances?), but there may be things that one can do when building a profile that will help consumability (I'm trying desperately hard to avoid food puns ...) ... and I think it's going to be **really** important that the designers of these profiles think about this, because nearly all the interesting problems we have to solve in the world are on the boundaries between communities.

These boundaries are particularly important for catalogue builders, because catalogues are for finding things that you don't know a lot about already, for most of us, by definition those are things that are the furthest from our core experiences (and so are most likely to be the least likely for us to be able to build into our core profiles).

So, building for interoperability *outside* our communities should be just as important as building for interoperability *within* our communities (modulo the reality that the core communities always pay for these things).

Well, philosophy aside, what's on the table?

[Last time]({% post_url oldblog/2006-03-28-some_practicalities_with_iso19139 %}) I made the point that if you extend a schema, for interoperability it will help if you can export your records in vanilla ISO19139 as well as your custom-ISO19139.

John Hockaday was a bit more explicit in an [email](http://spatialnews.geocomm.com/community/lists/viewmessage.phtml?id=45393) to the [metadata mailing list](http://spatialnews.geocomm.com/community/lists/monthlist.phtml?list=12). If the header to an ISO19139 profile instance includes the link to the parent profile schema (as it must), then:
<blockquote>If the profiles are extensions, i.e. add extra elements to the ISO19115 metadata standard, then they will have to be translated using XSL to the ISO19139 format for other people around the world to use. The translation will remove the extra elements because ISO19139 will not recognise them as valid elements.
</blockquote>
<blockquote> If profiles are restrictive, i.e., don't allow some ISO19115 metadata records, then they should also validate against the ISO19139 XSDs without translation using an XSL except that the header will have to be changed to point to the ISO19139 namespaces or the parser is told to use the ISO19139 XSDs.
</blockquote>

He goes on to say (as I did) that 
<blockquote>I expect the common format for exchange of metadata is the ISO19139 format. All profiles should provide and XSL for translation of their profile XML to the ISO19139 XML format. This will allow exchange of any metadata to be easily achieved.
</blockquote>

BUT

I wonder whether we were right. I think we all understand that metadata translation is (generally a [lossy]({% post_url oldblog/2006-01-22-merging_metadata_always_lowers_quality %})) activity.

What do we want our interoperable records to achieve? Generally, I think we want **discovery** between communities. So the most important thing to do is **find** information. 

In practice, we can **exchange** any derivative of the ISO19139 profiles using OAI and store them in xml databases - we don't need necessarily to parse them into a relational schema or into "our" xml schema. The question should really be *How do I consume instances from someone elses schema?*. As I've said before, we should ignore what we don't understand, and look for what we do! That means my discovery tool may want to look for familiar tags, use those, but when the discovery client wants to consume the record (perhaps having navigated using the tools I've provided), they want the **original** record (without any losses introduced by translation).

So, what we need to do in practice is *index* using common tags, so ideally the developers of profiles and standards should extend/contract all they like, but if possible to do this by declaring new (specialised) elements in new namespaces, but with the same tag names!"

But the advice to the IOC includes this:
<blockquote>Some of the metadata packages have also restrictions. ?EG.
dataQuality. ?We would have expected that there should have been a
specialisation of the DQ_DataQuality class called MP_DataQuality that
shows these constraints.
</blockquote>

And every time one does this, it results in an invisible tag that wont work in a portable environment (so we will ignore it in code). What this says to me is that specialisation by restriction *and name change* leads to a lack of interoperability ... exactly where it should be easiest ... after all, the instance document should conform exactly to the parent schema too... and I had thought we would only have to change the header to make our indexes and validations work ... (as John suggested). But instead this advice results in an instance that **does** need to be transformed by XSLT.  It would be nice to avoid that where possible. Wouldn't it be better in this situation to NOT change the tag name in the new schema? Could it be that the IOC has got bad advice, or is there some subtlety in the rules for restriction that I (and presumably John) haven't spotted?

I need to get back into this for the [NumSim](http://proj.badc.rl.ac.uk/ndg/wiki/NumSim) project and for some collaborations for our WMO partners ...

#### trackbacks (2)

*[on_substitution_groups_and_iso19139]({% post_url oldblog/2006-10-19-on_substitution_groups_and_iso19139 %}) (from "Bryan's Blog" on (on Thursday 19 October, 2006)*)

I have bleated already about the difficulties of using ISO19139 with restrictions which introduce new tag names ...

*[A proposal for profiling ISO19139]({% post_url oldblog/2006-11-30-a_proposal_for_profiling_iso19139 %}) (from "Bryan's Blog" on (on Wednesday 06 December, 2006)*)

Over this week a group of us (Rob Atkinson, Simon Cox, Clemens Portele and myself) have been reviewing the reality of problems with profiling ISO19139 and conforming with appendix F of ISO19115. The following is my summary of what I think we agreed.

#### comments (4)

*Bryan (on Friday 18 August, 2006)*

... actually, I know we're only officially allowed specialisation by extension ... but if our restriction is simply to force a particular attribute which has a 0..1 multiplicity to be 0 ... I think that should be allowed. 

I had hoped to work through a proper example of this for another blog entry before going on leave, but I've run out of time ...

*Marcel de Rink (on Monday 23 October, 2006)*

Good point to address this issue. I strongly agree with you on the issue that interoperability should be guaranteed between the different metadata profiles (and other metadatastandards). I understand that you will develop a new xsd-schema for new profiles? I do also have questions about ISO 19139, but I'm thinking about using the original ISO 19139 xsd-schemas and use additional OCL constraints (in Schematron) to validate. Because the original xsd-schemas from ISO will be used, the interoperability and semantics will remain the same. Additional mandatory use of metadata elements, additional domainvalues, ect will be validated by the community itself by use of OCL constraints (or e.g. in a MD Editor). When metadata elements will be used, which aren't mentioned in ISO 19139 or related ISO 191xx standards (I can't think of any) a new metadata element or even a class can be added to the ISO 19139 model (as described in the standard). This class will indead have it's own namespace and can only be used for discovery purposes in it's community. I don’t think creating a new xsd-schema for every profile is a good solution, because then lots of stylesheets have to be developed and maintained to ensure interoperability.

*Bryan (on Monday 23 October, 2006)*

I think one is supposed to develop a new schema for each profile, and that's part of the problem ... for a restrictive extension, I simply can't see the logic in requiring a new schema, and like you think it's a bad way to go.

I like your idea of using external constraints to impose your restrictions, and leaving the resulting instance documents conforming to vanilla ISO19139!

*[Simon Cox](http://www.csiro.au/csiro/content/standard/ps205,,.html) (on Wednesday 08 November, 2006)*

Concerning profile-by-extension: 
the ISO 19139 editors anticipated the issue in Annex A.3 in the list item 4). They provide a hook to support conversion back to un-extended 19139. The "@gco:isoType" attribute should be added to any class that extends an ISO class, and in an instance its value is set to the name of the parent class. This supports a simple algorithm to rename or throw away all elements from new namespaces. 

Concerning profile-by-restriction: Many plausible restrictions can be implemented pragmatically using clone-and-modify of the ISO 19139 schemas. However, ISO 19139 Annex A.4 requires that "a tool other than an XML Schema validator" be used to test conformance with a profile. OTOH this kinda supports the notion of applying restrictions using an orthogonal constraint layer (e.g. Schematron). OTOH this could be twisted slightly as "a tool other than an XML Schema validator ... configured with the original schemas" i.e. use a XML Schema validator configured with a cloned-and-modified schema. I checked with Dave Danko and he approved of the latter strategy. 
