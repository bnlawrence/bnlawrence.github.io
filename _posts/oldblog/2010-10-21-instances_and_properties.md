---
layout: post
title: Instances and Properties
last_modified: Thursday 21 October, 2010
tags: metadata metafor
categories: computing
---
Someone else will probably find a better way to express this, and give me the proper language, but meanwhile, I wanted to expose something that I think is important about my meta-model of using domain modelling to produce descriptions of things, and indexes of those descriptions. It came up over lunch time at a metafor coding sprint, and someone asked me to write it down, so here it is.

These concepts should be, I think, independent of the actual modelling tool you use to encode these concepts (UML, OWL or whatever), although you would want to encode the concepts using those tools.

Most readers will recognize this as essentially repeating some of the General Feature Model of ISO19109 ... with, I think, a few additions, and possibly exposing the contradiction between that and ISO19110 (the feature catalog description ... and thanks to Andrew Woolf for bringing the latter to my attention.)

There are a few simple things in this world:
* Features which are instances of Feature Types, and which have identity:
    * e.g. I am an instance of the Feature Type Humans. You can use my openid address to unambiguously point to me.
* Feature Types, are classes of objects in the real world.
    * e.g Humans
* Features Types have properties, which characterize those Feature Types.
    * e.g. I have brown eyes.
* Properties are attributes of Feature Types which are not interesting in their own right, although they are well defined, and are very useful.
    * e.g. if you do a search on humans with brown eyes, you are interested in returning instances of human, not instances of brown. (You might be interested in doing a search on colours of eyes in humans and get brown back, but in that case, you are interested in getting members of a vocabulary back, not instances of real world things.)
    * (NB: In ISO19109 such properties are *composed* into their parent feature descriptions, which is often not very helpful, since it implies that if i use colour as an attribute of human, it might not carry the same connotation as colour when used as an attribute of a dog. This "error" causes problems with serialization to RDF from an ISO19109 compliant domain model, since one can't necessarily assume that they are the same concept, without some extra baggage, which essentially associates the properties with other entities. This extra baggage is implicit in ISO19110 which allows one to store properties independent of feature types.)
* Features have associations with other features, and may be composed or aggregated out of other features.
    * e.g. My family is a specific aggregation of humans.
* We also have to deal with a specific class of features: those with well defined life cycles
    * e.g. I was born, and will die. Someone is responsible for maintaining the description of me which carries my openid. (That might be me, but for inanimate objects, it'll be a specific person.)
    * The implication of this is that there is an authoritative description of me, there are authoritative descriptions of my family, and both are bounded by a specific composition of features and set of properties. (In metafor, these compositions are called "documents", because they themselves are important entities, with life cycles.)

Why is this important? Well, in the context of building software tools which themselves describe software tools (e.g climate models), we need to distinguish between these concepts (e.g. the models, and the language they are written in).

This matters, because we want to serialize these descriptions in both rdf
triples and XML documents for good reasons: the former yields excellent methods of indexing documents, the latter, excellent technology for document exchange (and differencing.)

(Yes, yes, I know one can compose RDF into things with the properties of documents via OWL, but XML is more useful for handing to a GUI etc, and we can talk about OWL another day.)

When we've got this in place, we want to use our RDF to index things, but in general we are interested (from a software perspective) in creating, managing, displaying, and differencing our feature instances, not their properties (humans consume those). So, our domain model - however serialized -  needs to distinguish between all these things.

#### comments (2)

*Andrew (on Friday 22 October, 2010)*

But note the NWIP 19110 removes the inconsistency with GFM wrt ownership of properties by features.

You might also want to look at 19126 which addresses the issue of feature concepts (including properties) and their definitions, separate from their construction into feature models and application schemas.

Re "authoritative description" (of you, or anything else) - the semantic web approach is rather to give you an authoritative *label* (URI), but recognise that there might be multiple representations and (partial) views of you available through (or linked to) that label.

*Stephen Pascoe (on Friday 22 October, 2010)*

It is the final point that I find the most fascinating about the RDF vs. XML.  XML documents are "bounded" whereas RDF is not.  This definitely makes management easier until you start worrying about connections between XML documents.

I'm surprised you propose that differencability is a strength of XML.  The difference between 2 RDF documents could be defined as the set-symmetric-difference of the 2 sets of triples (granted it's more complex when blank-nodes are involved but you could still define difference independent of the schema).  In contrast I could imagine many different ways of defining difference in XML -- assuming you are interested in differencing the semantics rather than just the DOM tree.
