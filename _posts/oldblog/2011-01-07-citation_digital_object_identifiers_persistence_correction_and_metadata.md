---
layout: post
title: Citation, Digital Object Identifiers, Persistence, Correction and Metadata
last_modified: Friday 07 January, 2011
tags: metadata claddier badc curation identifiers dois
categories: computing
---
CEDA now has a mechanism for minting Digital Object Identifiers (DOIs). This means we need to finalise some decisions of rules of behaviour, which means we
have some interesting issues to address.

####  Traditional Journal View  

Let's start by considering how DOIs actually work for traditional journal articles:1. User dereferences a DOI via https://doi.org/
1. doi.org redirects to a *landing page* URL. (This is the entire job of the doi handle system done!)
1. Publisher owns the landing page, and prominent on that page is some metadata about the paper of interest, J', (author, abstract, correct citation etc), and a link to the actual object of interest (J, generally a pdf). NB: There maybe a paywall between the landing page and the object of interest.

Publishers can change the landing page any time they like, but conventionally you had better be able to get to your digital object from there. There are some other de facto rules too:
* If there is a new version of the paper, a new DOI is needed.
* Landing pages can have query based links to other things (papers which cite this one) etc ...
* The metadata (J') shouldn't change (since it is indelibly linked to the paper). I suppose if the metadata had inadvertently left out an author, a publisher might update it and hope no one noticed ... but there is an important thing to understand about this metadata:
    * It describes the digital object and represents it faithfully. It ought not change, since any change to it, ought to reflect a change to the digital object (and that should trigger a new DOI) ...
    * and the original landing page can indicate that a newer version of J exists, but it should still point to the older version!

So the DOI system is effectively used as follows:
<blockquote>A DOI resolves to an *representation* of a record that describes a digital object which is *retrievable in its own right*, and that representation can carry lots of other extraneous stuff including material built from interesting queries related to the object of interest.
</blockquote>

(In most cases the primary representation of the landing page is html, but other representations, including rdf, might exist.)

####  Data Publication  

OK, now consider the data publication version of this story.

Consider a real world observation (O), which used a process (P) to produce a result (R). (Aficionados will recognise a cut down version of O&amp;M.) Expect that we have described these things with metadata O', P' and R', which describe the observational event, the process used, and the result data (syntax mainly).
You might think of it like this:

![Image: PackagingMetadata.png ](/assets/images/2011-01-07-PackagingMetadata.png)

So what does data publication actually mean in this context? Sure we can assign a DOI to each of the O', P', R' entities, but why would we do that, what value would that have over using a URL?

We believe ([pdf](/assets/papers/2011/LawEA11_original.pdf)) that the concept of Publication is an important one, which is distinct from publication (making something available on the web). Publication (with the capital) denotes connotations of both persistence and some sort of process to decide on fitness of purpose (peer review in the case of academic Publication).  

So how do we peer review data? In our opinion you can't Publish data without Publishing adequate descriptions of at least the observation event, the process used, and the resulting data. That is, we want to see a form of peer review of the (O',P',R') triumvate. (O&amp;M aficionados: for the purpose of this discussion I've collapsed the phenomenon , sampling feature, and feature of interest into the result description, don't get hung up on that.)

Strictly, in the O&amp;M view of the world, the process description can be reused, so we might assign DOIs to each process (P').  

Clearly we can assign a DOI to R', but we would argue ([Lawrence et al 2009](https://doi.org/10.1098/rsta.2008.0237)) that without O' and P', the data is effectively not fit for wide use (and hence Publication). So, better would be to assign a DOI to O' and ensure that O' points to R' and P' (as it must do, since that's how it's defined).

(Not having a DOI for R' is consistent with the O&amp;M use of composition for R as part of O, but actually I think that's a bit broken - in O&amp;M - for the case where we want to have observations which are effectively collections of related observations, but that's a story for another day.)

The html representation of O' itself (not to be confused with the landing page for O') could link to R' and P', or it could directly compose their content onto the page.

Now we have some interesting issues. Can we imagine R' being updated because of incompleteness or inaccuracy? Well, yes, but hopefully it's about as likely as journal metadata changes. From a practical point of view, a cheeky change in R' wouldn't affect the conclusions that one might make about how and why someone used R itself. So, we might get away with fixing R' in place, but in principle one shouldn't.

What about changes to our description of P'. Someone following a citation to O' might get entirely the wrong idea of why someone used R (or misunderstand the usage). Hence, the right thing to do would be to:
* create a new description of P (call it P<sup>+</sup>),
* create a new description of O (call it O<sup>+</sup>), and ensure it composes P<sup>+</sup>.
* review these new descriptions, then
* mint a new DOI for O<sup>+</sup> (and one for P<sup>+</sup> if desired as well).,
* create new landing pages accordingly, and
* update the landing page for O' (and the landing page for P' if it exists separately) to indicate that a superceded version exists.

Note that none of this discussion depends on the detail of the underlying representation(s) of each of O',P',R', P<sup>+</sup>, or O<sup>+</sup>, these could utilise any technology (including OAI/ORE etc). However, for each object, one of the representations should represent the (apparently) *immutable* digital object linked via the landing page and the DOI. If that particular representation became unavailable, the replacement representation would become effectively a new editions of the digital object, and the landing page modified accordingly. It might be acceptable, and probably has to be for practical reasons (since such changes are likely to be associated with software changes), that the original DOIs resolve to landing pages that no longer point to the old primary representation - but they had better make the evolution clear.  

(Note that one would not countenance the data object R itself being allowed to change format without resulting in a new DOI.)

In terms of the physical infrastructure, one could imagine the landing pages being dynamically generated from the metadata records they are linking to, along with queries making other associations etc. One could even imagine multiple representations of the landing page itself (e.g. XHMTL, multiple dialects of XML, RDF etc). Such different representations could be available by content negotiation - but to reiterate once again - even if multiple representations are available for the digital objects of interest, only one is *the* object for which the DOI was assigned.


#### comments (6)
*Chris Rusbridge (on Friday 07 January, 2011)*
This is interesting, Bryan. I've been concerned about the DOI for data issue, but for different reasons.

I'm not sure this is an issue, but in the above you use R as a result (data) from an observation O (an event). There's a feeling in my mind of an implied singleness about this and the discussion. But don't we more often expect to cite collections of results (datasets) referring to multiple observations? Do we have a DOI for each result/observation (a VERY large number of DOIs in many cases)? Or a DOI for each dataset? If the latter, we have to find ways of dealing with the non-immutability of the dataset (see for example Peter Buneman's paper on database citation, less the strange XML citation format)...

Perhaps I should re-read this more carefully tomorrow...

*Bryan (on Sunday 09 January, 2011)*

What is a dataset? Our favourite question. In the context of DOIs and implied credit, that has to be a discipline specific decision as to how many (single) observations are needed to correspond to something worthy of a DOI.

That's not a problem for O&M though!

O&M is cast in the context of a single observation, but that observation could exploit a sampling feature which is a coverage (in time and/or space) ... so the event, might even be associated with a cruise, or year of data collection.

There is also the concept of related_observations, which is behind my cryptic comment about collections ... which we certainly can and do have. I'll write more about collections at a later date.

*Arif Shaon (on Monday 10 January, 2011)*

Hi Bryan,

A quick question about the DOI metadata, in particular re "It describes the digital object and represents it faithfully. It ought not change, since any change to it, ought to reflect a change to the digital object (and that should trigger a new DOI) "  What is the definition of a digital object in this context?

If it represents a form of "package" or "container" consisting of a data object (e.g. a publication in PDF) and its corresponding metadata (e.g. an RDF record), then I do agree that the changing the metadata would in effect alter the digital object (according to the OAIS model, it's fixity info would change).
However, if the term "digital object" only refers to a data object, then as far as I understand, changing metadata wouldnt necessarily alter the data that it describes.  An example of such a scenario could be adding a new keyword or a new related resource (possibly a "seeAlso" link for linked data) to the metadata record associated with a publication.

*Bryan (on Monday 10 January, 2011)*

Hi Arif

I tried to address exactly that point in the article. Sorry it wasn't clear. In the above example, you *could* have a DOI pointing to R' which is essentially just the bare metadata describing (say) a netCDF file. If you change something else (e.g. P' to become P+), then of course you didn't change R', and *that particular DOI* shouldn't change. However, we think you should have a DOI pointing at P' either directly, or via O' (with P' encapsulated) ...

I personally don't think there is much to be gained by having DOI's which point directly to R' - and if you do, they certainly shouldn't have academic credit. Hence the specific statement that best practice should be that the DOI points to O' (which itself points to R'). In other words, without appropriate metadata, data is useless!

The bottom line then is I don't think we should end up in the second of your two examples! (But if you do, I tried to covered it explicitly anyway: the landing page is the one with queries on it, so adding new "see also" links should be a landing page issue.)

*Arif Shaon (on Friday 14 January, 2011)*

Hi Bryan,

Thanks for the clarification. I have now read the second paragraph of your article in more detail, and I can now see that it does address my points.

*Brian Matthews (on Tuesday 18 January, 2011)*

Very interesting Bryan, and fits well with the approach we have been taking with ISIS where we are also setting up DOI minting and allocation.  DOIs will be assigned at the granularity of "Investigations" or a run - essentially a beamtime allocation, and the equivalent of your Observations, so the landing page will have O' equivalent.  As in your model, this might have a number of individual Result sets, reflecting individual shots, but they are "bare" as you say and thus DOI-less (though with some well maintained URI).  P is relatively simple as the collection process is highly constrained in the context of a beamline, and the P' metadata is folded into O'.

Some to me open questions.  There are issues around when to assign DOIs - as early as possible, but this runs into the mutability question as all the (meta)data may not be there.

And P should decompose for derived data - for provenance tracing.  Is that what the related_observations can do?

Reminds me that I should look at O&M again....
