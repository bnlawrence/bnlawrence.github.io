---
layout: post
title: A proposal for profiling ISO19139
last_modified: Thursday 30 November, 2006
tags: ndg metadata iso19115
categories: computing
---
I've been flagging issues with profiling ISO19139 for some time - see  [Oct 19]({% post_url oldblog/2006-10-19-on_substitution_groups_and_iso19139 %}) and
[Aug 15]({% post_url oldblog/2006-08-15-to_extend_or_not_to_extend_... %}) and especially the comments in the latter.

Over this week a group of us (Rob Atkinson, Simon Cox, Clemens Portele and myself) have been reviewing the reality of problems with profiling ISO19139 and
conforming with appendix F of ISO19115.

The following is my summary of what I think we agreed. 

####  extensions  

We believe the situation is relatively straightforward for
extensions to ISO19139:
1. A given community decides on a profile
1. The extensions are defined and documented in UML, so that
an extended element/class is a specialised class which
     1. lives in a specific profile package
     1. has a  different name, and 
     1. has an attribute which documents which iso type it is intended to replace.
1. This new package is then serialised into a new schema,
    * where the new class retains the different name from the UML
definition and maintains the gco:isoType attribute to identify the parent (extended iso) element.
1. and instances are validated against that schema using standard
mechanisms.
1. Interoperability requires that when these instances are made
available outside of the community for which the profile is 
understood, either the producer should transform the document back
to vanilla ISO19139 (easily done since all extended elements
can be renamed using the iso-type attribute along with removal of material 
from the new namespace).

####  restrictions  

We believe that most communities will be profiling ISO19139 by restriction.

Typical restrictions will include (but not be limited to):
* limiting the cardinality of attributes (e.g. making an optional
attribute mandatory), 
* restricting the type of some attributes (e.g. forcing something
to be a date where currently a date or a string is allowed).
* replacing string options with codelists

In all these cases, the resulting instance documents ought conform
directly to the parent ISO19139 schema since these restrictions
have not introduced new semantics to any element/class - they
are simply constraints.

Accordingly, where a community profile wishes to restrict a given
element class we recommend that:
1. The restrictions are defined and documented in UML, so that
an restricted element/class is a specialised class which
     1. lives in a specific profile package
     1. has a different name, and 
     1. the constraints are modelled using the Object Constraint Language ([OCL](http://en.wikipedia.org/wiki/Object_Constraint_Language)), and
     1. the specialisation is stereotyped as a &lt;&lt;restriction&gt;&gt; to guide
serialisation
[^1][^2].
1. These constraints are then serialized as [schematron](http://www.schematron.com/)[^3] commands, which are
maintained separately from the profile schema (if it exists - a purely
restrictive profile would not require a new schema).
1. Instances are then validated using the standard XML techniques
(which should ensure that they are valid ISO19139) *and* by
a schematron processor.
1. Interoperability of these instances is trivial given they directly 
conform to ISO19139 (there is no requirement by the consumer
of such a profile to see the constraint serialisation).

For example:
![Image: IMAGE: static/2006/11/30/iso19139_restriction.jpg ](/assets/images/2006-11-30-iso19139_restriction.jpg)

Right now, the schematron serialisation requires manual (human)
interpretation of the OCL to construct the serialisation. It
would appear that a direct serialisation of the full power
of OCL would be non-trivial, so we are recommending that
1. communities attempt to use the most simple OCL commensurate
with their restricting requirements, and
1. publicise their best practice, so that eventually
1. it would be possible to codify the best practice into a
"recommended OCL for profile restrictions" document, which would
then be amenable to
1. the development of an automatic parser (that, for example
could be built into a future version of [shape change]).

Thus far the only significant criticism of this schematron 
serialisation approach is that
it might not be possible to trivially build a metadata editor which
conforms to any arbitrary profile since such tooling would
need to be able to both parse the schema and the schematron.

The only other possible approach would be the "clone-and-modify" 
approach at serialisation. In this case, at serialisation
time the schema name changes
and the element definitions are directly restricted in the 
new schema. This new schema then looks like, and behaves like
ISO19139, but isn't ISO19139: we believe that
inevitable governance issues would arise in the maintenance
of the serialisation. Further, like the extension case,
instances would need transformation when shared outside the 
community.

However, it would appear that deploying schematron constraints
may not be that difficult in some tools. For example [tools exist](http://www-128.ibm.com/developerworks/xml/library/x-xfrmschematron/) that can use schematron with xforms.

Further, it is our belief that it will be more easy to deal with
hierarchical (and even multiple-inheritance) profiling
using the OCL approach as well. For example, an organisation
generating metadata may belong to multiple governance
domains (e.g. the BADC is a British institution, producing
atmospheric data: one might expect our ISO19139 profiles
to conform to both the British and WMO standard profiles).
It would be easy to test this for restrictions, we simply
validate using both schematrons independently!

[^1]:The use of a stereotype for serialisation guidance is the methodology
followed in ISO19139 itself. We've chosen *restriction* here. Although
we're not totally comfortable with the particular choice of word, none
of us could come up with a better one.

[^2]: It was suggested that
we could do without the stereotype since the serialisation code
could simply identify targets for serialisation into schematron alone
simply by the fact that the specialisation consisted of OCL alone. However,
it is possible that profile maintainers might choose to create *real*
specialisations in an extension (for example, by categorising a particular
class into a number of different restricted specialisations, each of which would need
to be named). Although that's an extension case, the parser needs to be
agnostic as to whether it's an extension or restriction as it processes each
element from the UML.

[^3]: It may be there are other ways of implementing OCL, but schematron seems to be the tool of choice at the moment


#### comments (10)

*Jeremy Tandy (on Friday 01 December, 2006)*

OK ...

I agree with your comments on extensions.

But I'll try to summarise the restriction issues (which thus far have been been causing me problems) ...

1) Understand HOW you want to use ISO19115 within your community ... this means picking over the ISO standard with practicioners to decide which bits are useful. As you state - most people will ONLY want to 'profile by restriction'. Noting that ISO19115 declares elements as MANDATORY, CONDITIONAL and OPTIONAL, could a profile (for example) add a restriction such that a mandatory element is no longer required / permitted? I think not, as this would break conformance with the parent standard ... but can we clarify? 

[As an aside, does this suggest the ISO19139 (the ISO19115 serialisation) should be packaged with a set of schematron constraints that can be used enforce the mandatory-ness (or conditional-ness) of elements?]

Basically - at this point we have an agreement on the INFORMATION MODEL of our profile.

2) Model the agreements in UML ... I won't reiterate what you wrote as it's pretty clear. However, questions spring to mind ...
(i) we create a new class (in the profile package) with a new name ... I guess this is simply a placeholder for the OCL constraints? In this case, I guess it has NO properties of it's own? If this is true, we should be explicit about this in our 'UML profile'.
(ii) a new class created ONLY as a container for constraints is NOT instantiatable ... it will NEVER appear in the serialised application schema
(iii) UML allows me to override a property when I specialise a class, XML does not ... at least not across a namespace boundary (I'll not go into the details here as I think they've been discussed adequately elsewhere). What do I mean? Example (illustrative only) ... ISO19115 class 'EX_Extent' has a property 'geographicElement', which is of type 'EX_GeographicExtent'. 'EX_GeographicExtent' (an abstract class) is specialised by 3 classes - implying that the property 'geographicElement' can be one of these types. In my profile, I want to restrict EX_Extent such that property 'geographicElement' can ONLY be 'EX_GeographicBoundingBox'. In UML, I could do this by overriding the property geographicElement:EX_GeographicExtent with geographicElement:EX_GeographicBoundingBox. However, the mismatch between UML & XML makes this diffeicult to implement. Your suggestion is that a constraint be used to implement this type of restriction. We should EXPLICITLY disallow restriction by overriding (sa is commonly used within UML).

3) We use a software parser to 'eat' the UML model, spitting out a GML application schema containing extensions (if there were any) and a schematron file with the profiling constraints. I guess we could use the name of the 'faux' class used a placeholder for the constraint as a title for each constraint block?

4) & 5) etc.

Alternative approaches ... I agree with your dislike of 'clone and modify'.

One thing that we MUST ensure is that any tooling provided to enable people to CREATE metadata instances can READ the profile (GML application schema extensions AND schematron restrictions). This suggests that we need a formal meta-model for a profile, describing the entities contained therein (extensions, restrictions etc.) so that tools know how to interpret the profile. Rob Atkinson has undertaken some work on behalf of the WMO driving down this track ... but there's plenty left to do! Perhaps the schematron - xform tooling is the way to go?

Finally, any profile must also identify specific controlled vocabularies that MUST be used ... fleshing out the content model. For example, you may wish to say that 'at least one keyword must be from NASA's GCMD science keyword list'. How do we 'bind' the controlled vocabulary (often an externally managed entity, far to large to be enumerated) to the profile? Gut feeling is that some form of constraint (serialised as schematron) is in order ... but this needs to be formalised.

*Rob Atkinson (on Monday 04 December, 2006)*

1) I think it is valid profile to make an optional element mandatory. Instances are still valid, so doesnt invalidate conformance as far as I can see.

2) We dont want to allow extension and lose the ability to do restrictions, so we need to determine behaviour - but essentially it makes no sense to use the <<profile>> (I prefer to <<restriction>>) stereotype and extend the class. Maybe you need to extend the <<restriction>> class. More experience required here I think.
In any case, I think that we should support the UML type-restriction override rather than support a OCL syntax for this. This can be serialised into schematron quite happily from the model.

3) the Faux-class name is intended to be the name of the set of constraints

and - agree we need to back this up with  tooling. This doesnt look too hard though. 

Also, agree with Jeremy that we need the  externally managed vocabulary binding as a constraint. This means currently an OCL constraint binding the codespace element of a ScopedName data type - but I'm not quite sure how we bind to a subset of a vocabulary - maybe the codespace needs to be a URN that can express a node in a taxonomy.

*Simon Cox (on Tuesday 05 December, 2006)*

From a closer reading of Annex A.4 in ISO FDTS 19139 I now believe these rules are pretty much in place already. 
As it was not until my fourth or fifth read-through that I spotted it (and in the context of this discussion), this is definitely not presented clearly enough! 
But it is there.  

The first paragraph of 19139 describes how restriction is accomplished in the UML in 19139(*), and the reader is directed to examples in clause 9. 
The mechanism is "This is ... done by ... adding an annotation to the UML". 
Then "some tool in addition to an XML Schema validator must be used to enforce the ... condition". 
The conventional UML method of overriding types or cardinalities is not explicitly prohibited, but also not described or otherwise allowed for, while the "annotation" method is. 
However, there is no guidance on how the "annotations" are formalized, and in the examples they are _not_ OCL constraints. 

Then the second and final (one-sentence) paragraph in the sub-clause directs the developer of a _user profile_ to use the same mechanism. 
The actual sentence is long and elliptical: 
"Just as restriction of external implementations is done through annotation in UML and enforced via a tool other than an XML Schema validator in the namespaces defined in this Technical Specification, any user profile restrictions should also use this restriction mechanism." 
But it appears to be definitive, and essentially matches what is proposed here, modulo some implementation details, the latter of which I think we are (usefully) tightening up by proposing OCL and Schematron. 

On to the detail of the proposal: I now agree with Clemens that using a tagged value is more appropriate than a Stereotype. 
Yeah, I know these are not so obvious in the digram (though EA at least does allow you to make the Tagged Values box visible in a classifier). 
But tagged values is where implementation-specific directives are indicated. 
Stereotypes are conceptual extensions, yes which may have implementation specific consequences but that is secondary. 
Since the "no new element name" rules is XML-specific, it would be wrong to pollute the UML model with it since other platforms may be able to cope with a new class name ... 

(*) However, important context is that 19139 is essentially a UML representation of XML Schema, with stereotypes like <<XCGE>> used to tie specific XML Schema patterns to UML classes. 
So it is not actually intended to represent a "conceptual model", so there may be some apples and oranges here in projecting a mechanism developed for a graphical "XML schema" language into a model ... sm.*Simon Cox (on Wednesday 06 December, 2006)*
In his aside above Jeremy wrote "[As an aside, does this suggest the ISO19139 (the ISO19115 serialisation) should be packaged with a set of schematron constraints that can be used enforce the mandatory-ness (or conditional-ness) of elements?] "

The constraints that cannot be enforced using W3C Schema Validation are listed in Annex A Table 1 of ISO FDTS 19139. Yes, these are mostly co-constraints that are marked "Conditional" in 19115. 

As part of a job we did for ANZLIC recently Andy Dent wrote Schematron for all of these for which that was possible. i.e. this did not include the character-set constraints, or the uom constraints, but does check for all the others. I have requested permission from ANZLIC to make this available more widely but they have not responded yet. 

[[Sorry about the dual posting above - Bryan, perhaps you can remove the first version?]]

*Jeremy Tandy (on Thursday 07 December, 2006)*

Simon - I would be interested in seeing the ANZLIC-sponsored schematron constraints! Given that this blog post discusses the UML modeling in addition to the serialization, is there a need to annotate the original ISO19115 model with conditional constraints? (shoot me if this already exists :-) )*Simon Cox (on Friday 08 December, 2006)*
In response to Jeremy's questions:
(i) I have not yet received permission from ANZLIC to release the Schematron. I don't expect a knockback though.
(ii) adding constraints to ISO 19115: yeah, maybe, probably. 

As I noted, there is some ambiguity in ISO 19139 as to whether it purely concerns "graphical XML schema" (see stereotypes like <<XCGE>> etc) or whether it also describes practices related to conceptual modelling (particularly profiles). 

*Nick Ardlie (on Friday 08 December, 2006)*

A few quick comments.
Whilst I am largely in favour of the proposed solution, there's a mild smell to it also ;)
I think that "smell" comes from the Object-Relational impedence mismatch issue. In this case transfered to Object-XML Schema but the issues are almost the same - deceptive similarities, subtle differences!
UML-2-XML is solvable but a hard sell. UML+OCL-2-XML+Schematron makes it one big, funky party.
But I do see some very tangible benefits and, no, I can't think of a better alternative.

It is right to state that "a direct serialisation of the full power of OCL would be non-trivial". I would go further and say "impossible" or at least "nonsensical". (e.g. attempting to assert OCL preconditons & postconditions using Schematron).

Having said that, the proposal is to identify an allowable subset of OCL syntax which is certainly achievable.
I wonder if NVDL shouldn't be the intermediate or target language here. XML schema validation + Schematron validation appears to meet MOST of our current validation requirements. Does it make sense to tightly prescribe the combinaton of validation languages (beyond generic namespace validation languages)? Maybe
If XForms were to prove a valuable technology in the metadata entry tool space then the NVDL validation model would be really useful.

Not sure if there was a misinterpretation of Jeremys comment about mandatory-2-conditional restrictions above. I would have agreed that overiding parental mandatory conditions would be in violation ofany sensible restiction rules. (it enforces a one-way transformation doesn't it?)

As an addition to Simons post above - regarding the Schematron that Andy Dent wrote for ANZIC, we've been running that using oNVDL to assert the ISO19139 schema constraints and Schematron constraints through a single tool/API. It would be good to have it circulated more widely and refined as necessary. (I'm hoping we can contribute some anaysis/feedback in that space shortly)

Another issue that I feel needs addressing is the development of a best-practices model for XLink in GML application serialisations. I feel most people are thinking "self contained documents" which precludes the very real and likely scenario of fine-grained XML fragment serialisations (particularly true for enterprise metatdata systems, I would think). Validation under these conditions becomes a far more complex proposition. The tempation is to say "let the vendors sort that stuff out" whereas some work in this area would probably speed vendor uptake and result in better tools.

cheers,

Nick Ardlie
Geoscience Australia

*Jeremy Tandy (on Friday 08 December, 2006)*

Simon - thanks for the update.
++++
Responding to Nick: you were right to spot the misunderstanding regarding overriding of mandatory conditions in base standard ... this should be explicitly disallowed (and probably already is).

NVDL ... interesting, so I'll take a closer look (in slowtime).

*Simon Cox (on Sunday 04 February, 2007)*

I've pulled the threads together in a summary posted here: https://www.seegrid.csiro.au/twiki/bin/view/AppSchemas/MetadataProfiles#A_proposal

*Andy Dent (on Thursday 08 February, 2007)*

My nose seems to work the same as Nick Ardlie and I would vastly prefer something that is more readable and easier to write correctly than OCL.
