---
layout: post
title: The vocabulary of documenting models
last_modified: Thursday 17 July, 2014
tags: esdoc metafor
categories: computing
---
Some time ago our European project Metafor migrated to a global project called [es-doc](http://es-doc.org).   During the metafor project we put a lot of effort into trying to develop materials which describe what it is trying to achieve,  but I think we never really got that right (despite a number of papers on the subject - e.g. [Lawrence et al 2012 ](https://doi.org/10.5194/gmd-5-1493-2012), [Guilyardi et al 2013](https://doi.org/10.1175/BAMS-D-11-00035.1) etc).

I'm currently in the process of trying to produce a figure on the subject for another publication, and in the process have produced these, which I think might be quite useful for understanding what es-doc is trying to document, and what the main kinds of documentation are that it produces. I'd be interested in feedback as to whether these figures are helpful or not.

In each figure, the boxes and links are not meant to correspond directly to the UML classes and associations of the (es-doc) Common Information Model (although some do) - the intention is to describe the concepts and intent of the various pieces of documentation.

####  Figure One  

![Figure One](/assets/images/2014-07-09-MIPprocess_esdoc.jpg)

The MIPS process involves designing **experiment**s which are provided to modelling centres.

Modelling centres configure model code to produce a **configured model**.

They then run one (or many) **Simulation**s to support one or more experiments. The Simulation will conformTo (NumericalRequirements) of the Experiment, and will produce Output**Data**, and was run on a **Platform**.

The output data is uploaded to the ESGF archive where is supports the MIP.

Each of the coloured boxes represents an *es-doc* "document-type".

####  Figure Two  

![Figure Two](/assets/images/2014-07-09-simple_esdoc.jpg)

Neglecting the process, we can look at the various document types and what they are for in more detail.

A simulation (which can also be an aggregation of simulations, also known as an ensemble) will have used some input data, some of which may have been defined and/or constrained by one of the numerical requirements of the experiment.  

Constraints on the simulation by the numerical requirements might require conformances - which define how those constraints affect either the data or the code (maybe a choice of a particular code modification, or via a specific parameter choice or choices).

Configured models are described by their Science Properties.

A Simulation document will include all the information coloured in yellow, so it will define which configured model was used via the **uses** relationship, which will point to configured model document, which itself describes the model.

Similarly, an experiment document will define all the various numerical requirements, and may point to some specific input data requirements.

Ideally output data objects will point back at the simulation which produced them.

####  Figure Three  

![Figure Three](/assets/images/2014-07-09-Simulations_esdoc.jpg)

In even more detail we can see that numerical requirements come in a number of flavours, including:
* SpatioTemporalConstraints - which might define required experimental start dates, durations, and/or the coverage (global, regional etc).
* Forcings - which generally define how various aspects of the system might be represented, for example, providing Ozone files for a consistent static ozone representation.
* OutputRequirements - which define what output is required for intercomparison.

Simulation conformances are generally linked to specific numerical requirements and consist of data and code-mod conformances.

ConfiguredModels are configured from BaseModel code (this is not currently implemented in es-doc). In principle they can be described both by their software properties and the science properties (and so can their sub-components).

The run-time performance of the simulation should also be captured by resource and performance characteristics (but this too is not yet supported by es-doc).

A model description document should include all the material in green, including the links.

#### trackbacks (1)

*[Updated version of the model documentation plots]({% post_url oldblog/2014-07-29-updated_version_of_the_model_documentation_plots %}) (from "Bryan's Blog" on (on Tuesday 29 July, 2014)*)I've had some feedback, and some more thinking, so here are three updated versions of those plots...

#### comments (2)
*Rupert Ford (on Wednesday 09 July, 2014)*
Hi Bryan, Should Resources and Performance sit off Platform? I would have said that they are properties of the simulation when run on a platform. So Simulation used Resources on Platform and Simulation ranWith Performance on Platform. As you said, it is not UML so perhaps it does not matter!

*Bryan (on Wednesday 09 July, 2014)*
Agreed.  Resource and Performance are properties of a Simulation.
