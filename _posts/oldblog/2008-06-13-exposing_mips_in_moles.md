---
layout: post
title: exposing mips in moles
last_modified: Tuesday 17 June, 2008
tags: moles metafor curation badc
categories: computing
---
In my [previous posting]({% post_url oldblog/2008-06-12-the_anatomy_of_a_mip %}), I should have pointed out that the MIP of interest is the
RAPID thermohaline circulation model intercomparison project ([THCMIP](http://www.cgam.nerc.ac.uk/rapidthcmip/)).

In this post I want to enumerate the membership of some of those classes I introduced last time, and think through their relationships with MOLES and some of the practicalities for implementation. Doing so exposes a few problems with the current MOLES draft.

I start by considering how the MIP entities map into the existing MOLES framework (by the way, I will come back to observational data and do the same thing for an observational data example or two).

There are five model codes involved: CHIME, FAMOUS, FORTE, HADCM3 and GENIE.
There are four experiments involved HOSING, CONTROL, TRH20 and CRH20.
There are at least four time averaging periods involved: daily, five-day, monthly and yearly. 

Some groups have done seasonal, some have done different experiments, but we'll ignore those for now.

So in practice, using MOLES vocabulary, we have at least 5x4x4=80 different granules of data to load into our archive, and there are 5 data production tools (models) + 4 experiments (*where do we put these?*)+ 1 activity which need comprehensive descriptions ie 10 new information entities. We might argue there are 20 primary data enties (being the model x experiment x observation station) combinations (remembering that the model runs might have been carried out on different architectures).

Of course  we ought to support multiple views on this data, but we ought not have to load any more information to support those view. (Views like:
* A data entity which correponds to data from each experiment (4 of these),
* A data entity which corresponds to data from each model (5 of these),
* A data entity which consists of the granules from all models with specific time averaging for one experiment (there are 16 of these), etc

The data entities themselves should not need any specific properties; these they ought to inherit from the combinations of other entities (models, runs etc). This situation is tailor made for RDF to support views which arise from facetted browsing, but a legitimate question is what *views should be offered up for discovery (that is, positions from which one can start browsing)?*.

In any case, we start with ingesting 80 model runs, and generating their [A-archive](papers/roysoc/LawEA08.pdf/) metadata (which gives us the temporal and spatial coverage along with the parameters stored). We'll assume that process was perfect (i.e. all parameters were CF compliant and all data was present and correct. Of course in real life that's never the case - all parameters are never CF compliant, all data is never present, and often it's not correct, that's what the process of ingestion has to deal with).

Each of those granules has the additional properties of temporal resolution and parent run. We probably ought to allow an optional spatial resolution in case the output resolution was different from the model resolution and potentially even different from a required resolution in an experiment description).

(These next three paragraphs updated 17/06/08): The run itself is an entity, which corresponds to a grab bag of attributes inherited from the other entities which we want to propagate to each of the constituent granules. If that were all it were it could be an abstract entity, which might correspond exactly to the MOLES data entity (which isn't abstract). However, somewhere we need to put the runtime information (configuration, actual initial conditions etc). 

Currently we have the concept of a deployment which links a data entity to one each of activity, data production tool and observation station. This has a number of problems: some of the views described above produce data entities associated with multiple data production tools etc. I've been arguing for some time that deployments are only associations and not entities in their own right, in which case a deployment really is an aggregation of associations, but it doesn't need to exist .... even as an abstract entity. The proof of this is in the pudding: the current MOLES browse never shows deployments it simply shows the links which are the associations. Sam has argued that deployments could have some time bounds attributes, but when we explored why, what he was defining was in fact a sub-activity. We did think the runtime might go here, but it could also go into the provenance of the data entity, or we could have more subtle structures in the experiment.

So let's think about the attributes of a data entity itself. The data entity will have an aggregated list of granule bounds, parameters, resolution etc. It will also have associations with multiple other moles entities. If I hand you that data entity, *what metadata do you want to come with it?*  Before we get carried away, remember that we've started with 20 data entities which we might naturally document, but we have identified many more (e.g. above) which we would rather like to be auto-generated. These wouldn't necessarily have common runtimes.

I've said elsewhere that I want all the moles entities to be serialised as atom entities, so we have some attributes we must have. The question is *from where will they come?*. Clearly we need some rules combining other attributes. These rules probably should also encompass which entities are discoverable.

Food for thought. (You might have thought we had done this thinking: well we had done some, so we know what is wrong with our thinking :-)