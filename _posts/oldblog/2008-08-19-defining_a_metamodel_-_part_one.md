---
layout: post
title: Defining a Metamodel - Part One
last_modified: Tuesday 19 August, 2008
tags: metadata metafor ndg
categories: computing
---
I've just [introduced]({% post_url oldblog/2008-08-13-formalising_information_model_development %}) the concept of a  metamodel as being a key component of the conceptual formalism required to come up with a conceptual model of the world expressed in a conceptual schema.

But that's not enough, or at least, it wasn't enough for me. To move forwards we need to understand the relationship between metamodels, vocabularies and ontologies, and when we've done that we can get to grips with the basic entities that would have to exist in our metamodel.

There is a pretty good stab at definining these things in an [article by Woody Pidcock](http://www.metamodel.com/article.php?story=20030115211223271) at [metamodel.com](http://www.metamodel.com).

My summary of the key aspects of the key concepts is:

<table border="1" rules="all"><tr><td align="center" colspan="1">&nbsp; Controlled Vocabulary  &nbsp;</td><td align="center" colspan="1">&nbsp; A list of terms that have been enumerated explicitly, which have unambiguous definitions, and which is governed by a process &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; Taxonomy  &nbsp;</td><td align="center" colspan="1">&nbsp; A collection of controlled vocabulary terms organised into a hierarchical structure, with
each term in one-or-more parent-child relationships &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; Ontology  &nbsp;</td><td align="center" colspan="1">&nbsp; A formal representation of a set of concepts within a UoD and the relationships between those concepts. In principle the list of concepts and relationships itself forms a controlled vocabulary. &nbsp;</td></tr>
<tr><td align="center" colspan="1">&nbsp; Meta-Model  &nbsp;</td><td align="center" colspan="1">&nbsp; An explicit model of the constructs and rules needed to build models within a specific UoD. A valid meta-model is an ontology, but not all ontologies are modelled explicity as meta-models. &nbsp;</td></tr>
<tr><td align="center" colspan="2">&nbsp;  (Uod: Universe of Discourse) &nbsp;</td></tr>

</table><br/>

In particular, Woodcock points out that a meta-model can be viewed from at least two perspectives: as a set of building blocks and rules to build models (which is the sense I have used it 
[thus far]({% post_url oldblog/2008-08-13-formalising_information_model_development %})), and as a model of a domain of interest (as might happen if one produced a heirarchy of conceptual models). Clearly, an ontology constructed as a conceptual model describing a particular universe of discourse is much more likely to be the latter than the former, although one might well construct one of the former on the way ...

Which brings me to the next step. 

For metafor, we're starting with quite a bit of prior art, including, but not limited to our own [NumSim](http://proj.badc.rl.ac.uk/ndg/wiki/NumSim), the [Numerical Model Metadata](http://ncas-cms.nerc.ac.uk/trac/NMM/), and most importantly, the [ Earth System Curator ontology](http://swiki.cc.gatech.edu:8080/Curator). But we're endeavouring to avoid the mistakes of the past, and going back to some fundamentals I listed [a long time ago]({% post_url oldblog/2005-08-11-metadata_xml_and_dejavu %}), and in particular "reusing blocks from widely adopted standards". One obvious set of standards are the ISO19000 series of geographic information standards.

These last include a set of metamodels (19103, 19109 etc ), as well as the more widely known content and syntactical standards such as 19115/19139 and 19136 (GML). My next step is to consider the information infrastructure we're likely to have in place (e.g. controlled vocabularies, ontologies) and the basic types we're likely to need in our metamodel, in the context of serialising both to XML and RDF, each of which may play different roles in producing and consuming content.

#### comments (3)

*Robert Muetzelfeldt (on Friday 10 October, 2008)*

Hi Bryan,

I've recently joined the [martafor] list, and thought I'd have a quick look at your blog.  Big mistake! - I can see myself spending too much time on it.

I'm not sure this is the right place to post this comment, but here goes:
It seems to me that the names for environmental variables frequently have a compound nature: 
"air temperature", 
"annual maximum of daily mean air temperature", 
"mean air temperature from 1st Jan 2000 to 31 Dec 2004", 
"grass leaf carbon" "nitrogen uptake per unit leaf area", etc etc.  

Now, the metadata schemes which I have come across see to be quite happy with a controlled vocabulary with atomic names for variables.   This seems to me both non-scalable and unprincipled.

It is non-scalable because we will end up with huge numbers of terms in our controlled vocabulary, as we struggle to cope with all the combinations of the base terms.

It is unprincipled because we have failed to abstract out the base elements of each term.

It is clear that the answer must be to allow variable names to be represented as compound terms.   This will be far more parsimonious (hence scalable), and far more principled.   However, the way we should do this is not obvious: we need a language (syntax and semantics) for specifying how base terms can be combined together, and this is a real challenge.

You might argue that this view is in principle covered by the ontology/metamodel end of the spectrum.  Possibly.  However, in practice I am not aware of any effort within the environmental metadata community to come up with a coherent scheme.  If you are aware of any efforts in this direction, I'd very much appreciate hearing about them (a blog post?).

Finally, much the same applies (and more obviously) to units: e.g. "m sec-1".   Most of the environmental metadata schemes seem to treat compound units as atomic terms, which is clearly silly.   At least here there is a much more obvious underlying theory, and initiatives to mark up units as compound terms: e.g. http://www.w3.org/TR/mathml-units/ and http://unitsml.nist.gov/.


*Robert Muetzelfeldt (on Saturday 11 October, 2008)*

That should of course be "... the [metafor] list..." in the first line of my previous comment!

*Bryan (on Wednesday 15 October, 2008)*

hi Robert

Have you seen the CF convention? (http://www.cfconventions.org).
Some of the issues you describe are correctly addressed within that, but not all. 
