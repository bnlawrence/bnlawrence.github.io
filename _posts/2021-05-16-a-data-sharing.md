---
layout: post
title: When failure to share data costs lives
last_modified:
categories: academic 
tags: academic covid
excerpt_separator:
image:
---

_(June 2023: This draft article was inadvertently published some time in the past. It was written some time in 2020, I think, and I never finished it, and frankly I don't know how it ever got published. I have just realised that it is "out there", so rather than completely remove it, I have edited it slightly so the unfinished sentences are removed, and added a little coda on where we are now. However, it's not my finest work.)_

A blog article in three parts: history, some strong statements about the importance of open data, and some even stronger statements about failures to prepare for modelling an epidemic. 

The TLDR:

- It should not have been possible for the UK to be developing policy on the back of an epidemiological community who did not have a plan and the means to coordinate their work. The "plan and means" should have 
	- recognised that a model is only as good as the data used for construction and validation, 
	- included robust data sharing policies, 
	- established practice for model calibration, validation and intercomparison.

If we had better modelling which meant that we had greater confidence in models and the difference between the various model simulations was better understood, I am in no doubt it would have been possible to make better policy decisions, decisions that would have, and would still save lives.

However, if you're going to leave me before reading on, also know that this is not a failure of the modellers who have been working night day using the infrastructure and behaviours handed down to them - as opposed to those that ought to be have been put in place for just this eventuality. Infrastructure and behaviours they themselves had been asking for, and that were recommended by previous pandemic preparedness exercises. 

Know also that despite my criticisms, the modelling we have had was good enough to make most of the big decisions.  As I said [on twitter](https://twitter.com/bnlawrence/status/1326940057362632706), one of our key mistakes (as a scientific community) was to let the media search for unreasonable simulation precision with no operational consequences:  Do we care if the projection for deaths is 1000/d or 2000/d? Both are unacceptable and require action. The important prediction was _"bad things gonna happen: act now"_!  

Where better modelling would have helped smaller decisions might have been to convincingly identify and evidence more targeted interventions earlier in the pandemic. If such simulations had existed, and been more rigorously understood, things might have been different.


#### History

Recently [Kit Yates](https://twitter.com/Kit_Yates_Maths) [tweeted](https://twitter.com/Kit_Yates_Maths/status/1329534495599587329?s=20) that  he was:
> Astonishing to hear about the lack of data sharing amongst modelling groups in SPI-M. 
Such huge disparities in data availability seemingly leaving some modelling groups out in the cold.

There was a short thread of replies in which [Graham Medley](https://twitter.com/GrahamMedley) said
> Not all data is public. Should we not use data if it is not public? If somebody has access to important data through non-public sources should they use it or not? Modellers don’t own the data

A couple of other threads ensued, including [one](https://twitter.com/theresphysics/status/1329811764792406018) kicked off by [Ken Rice](https://twitter.com/theresphysics) which can be paraphrased as 
 
- Ken: data sharing is complicated by privacy issues and/or expectations of "first dibs" on results having put effort into collecting data, but
- Me: Yeah, but data should be shared, and there are mechanisms to address privacy and academic credit
- [Eli](https://twitter.com/EthonRaptor): Who pays to share data? Who supports data users? Gathering data doesn't fly well with panels.
- Several people: it's expensive and time-consuming and necessary to create metadata and no one wants to do unfunded support work.
- Ken: I think people should be cautious of making strong statements about what people should do with their data and code if they don't also make similarly strong statements about how this should be supported.
- Bryan: Happy to make such strong statements, and I plan to blog about it.

And here we are.

#### Strong Statements about Open Data 

For more than twenty years I have been making strong statements about data, you can see many of them here [on this blog](https://www.bnlawrence.net/tags/curation/).

So let me be really clear:

1) Publicly funded scientists who collect data (as opposed to generate it, on which more another time maybe) are collecting it for society not their own benefit.

- Yes We need to ensure that they get credit, and we need to give them primacy of access, but in no way does that make it _their_ data.

2) All European and UK research funders have some sort of mandate about making data open - but only two (AFIK, the UK Natural Environment Research Council and the UK Arts and Humanities Research Council) have really followed through. I only really know about the former, so here's a bit of background:

- NERC grants can include extraordinary data management costs, and grant funding is top-sliced otherwise to provide a [network of data centres](https://nerc.ukri.org/research/sites/environmental-data-service-eds/).
- Yes it costs, but we've been thinking about this for a long time, e.g [this from 2005](https://www.bnlawrence.net/computing/2005/07/business_models_and_curation/).  We've managed to sustain such activities by recognising that all data needs curating, but a key conversation that should be had is that while all data needs to be offered for curation, not all data should be curated.
- It is expected that metadata is provided by projects, although the data centres will create more, to help maintain the data for posterity. Getting the balance right as to who does what [is difficult](https://www.bnlawrence.net/environment/computing/2009/08/plate_size/), but it's crucial to data reuse and value. However it's hard, as I've said [before](https://www.bnlawrence.net/computing/2011/12/data_scientists_are_anally_retentive_too/)

	> ... most scientists put a much higher premium on innovation than maintenance. They aren't good at the punctilious, anal-retentive sort of work that is necessary for society to get the best out of the data it has paid to collect!
	
- So it is important that it should be someone's day job to be anally retentive about data and metadata. NERC has invested in many such people (in the Environmental Data Service), and all research funders should do  the same!

3) One of the important things that NERC does when it engages in a programme of grants is consider an investment in data management during the activity: to ensure that everyone has access to the data, that everyone understands what the rules of access are (credit, not using incomplete/unfinished datasets etc). The reason NERC does this is so that it gets the benefit of a programme which is more than the sum of it's parts.

- Often this involves lodging data in a data centre, so everyone knows it is there, but only authorised folks can get access to the data until a certain period of time has passed.

Personally, I think the rest of UKRI is absolutely remiss on this front; their failure to implement best practice in data management is both irresponsible and antediluvian.

Last time I looked the other research councils were dabbling at data management, unwilling to recognise the cost.  This failure to pay the cost is just yet another example of Bryan's favourite HPC analogy: 

- if you want to go fast, you have to go parallel, if you want to parallel, you need to identify the communications costs, minimise them, and then pay for them and adjust your algorithm accordingly.
- good science is the same, it's a team game, which depends on good communication within the team, and data is just one part of that communication.

#### And so to epidemics

Like many, in January I watched what was going on in Wuhan with a mix of fear and apprehension. The moment we started getting cases in Europe it was apparent that there was going to be a problem.  I started looking into the research literature on epidemic modelling in February, and what I saw worried the hell out of me. 

For those who don't know, I spend a lot of time both doing modelling, and worrying about the modelling workflow. We've even come up with a formal way of talking about numerical experimentation (e.g. [Pascoe et al 2020](https://doi.org/10.5194/gmd-13-2149-2020)). I have spent the best part of the last few years devoting time to supporting the fifth and sixth phases of the Global Coupled Model Intercomparison projects - which means thinking a lot about how best to use multi-model ensembles not just to make projections of the future, but to make better models.

So when I started to look into the literature I was astounded to find that in most countries epidemic modelling seemed[^fn] to be an arcane academic cottage industry. Very little national and international coordination, and little proper model intercomparison. To be fair, the epidemiology community knew that was a problem (e.g. [den Boon et al 2019](https://doi.org/10.1186/ s12916-019-1403-9.), [Smith et al, 2017](dx.doi.org/10.1016/j.epidem.2017.02.006)). In fact it was so obvious that this sort of thing needed saying ([Viboud and Vespignani, 2019](https://dx.doi.org/10.1073/pnas.1822167116)):

> While there is considerable interest among modelers in advancing the science of disease forecasts, the level of confidence of the public health community in exploiting these predictions in real-world situations remains unclear. The disconnect is in part due to poor understanding of modeling concepts by policy experts, which is compounded by a lack of a well-established operational framework for using and interpreting model outputs ... 
> ... the relationships among forecasting accuracy, data quality, and reporting rates remain elusive, due to the lack of controlled experiments and systematic analyses.

and [Lessler et al, 2016](https://dx.doi.org/10. 1007/s40471-016-0078-4):
> The quality of infectious disease forecasts and standards for their interpretation are far from the gold standard of methods and conventions used in meteorology. 

This was indirectly understood by government.  The exercise cyngus report ([pdf](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/927770/exercise-cygnus-report.pdf)) directly addressed these by 

- identifying the need for "data to help assess the potential impact of various options to manage the demand for health and care services in different ... scenarios" and
- the need to simplify the provision of information given a lack of clarity about what information was required, in particular, in the exercise

	> "there was a lack of clarity about where modelling data could be accessed from for planning purposes. There were questions about how the various teams providing data would work together in a response, in what form data would be provided to responders and how it could be used."

And yet, nothing was done, despite the fact that the means and practice existed. Lifting some of the infrastructure from elsewhere in science could have been easy. Establishing the _expectation_ that all modellers would share input data and those who collected data would get the credit when credit was due should have been basic.

Instead, we ended up with the situation described above. 

It is clear that despite the valiant efforts of individuals the UK modelling response was a bunch of ad-hoc groups who didn't share input data, clearly had no established practice of model intercomparison,  calibration, or validation.  


#### Coda

_(Note added in 2023: Since I wrote this, there have been some epidemiology model intercomparisons, but I am not sure they have got sustained funding, either for the participating groups, or the intercomparison.)_


[^fn]: I am well aware that although I spent a goodly amount of time in the epidemiological research literature I will have missed most of it! So please, if you want to take issue about any of this, please get hold of me via twitter, or email, and talk to me. I can and will [publicly change my mind if necessary](https://www.bnlawrence.net/computing/2009/02/strongly_defend_weakly_held_positions/).
 
#### Bibliography

- den Boon, S., M. Jit, M. Brisson, G. Medley, P. Beutels, R. White, S. Flasche, T. D. Hollingsworth, T. Garske, V. E. Pitzer, M. Hoogendoorn, O. Geffen, A. Clark, J. Kim, and R. Hutubessy. _Guidelines for multi-model comparisons of the impact of infectious disease interventions._ BMC Medicine, 17(1):163, Aug. 2019. ISSN 1741-7015. doi: 10.1186/ s12916-019-1403-9. 
- Lessler, J., A. S. Azman, M. K. Grabowski, H. Salje, and I. Rodriguez-Barraquer. Trends in the Mechanistic and Dynamic Modeling of Infectious Diseases. Current Epidemiology Reports, 3(3):212–222, Sept. 2016. ISSN 2196-2995. doi: 10. 1007/s40471-016-0078-4.
- Pascoe, C.,  B. N. Lawrence, E. Guilyardi, M. Juckes, and K. E. Taylor. _Documenting numerical experiments in support of the Coupled Model Intercomparison Project Phase 6 (CMIP6)_. Geoscientific Model Development, 13(5):2149–2167, May 2020. ISSN 1991-9603. doi: 10.5194/gmd-13-2149-2020.
- Smith, M.E.,  B. K. Singh, M. A. Irvine, W. A. Stolk, S. Subramanian, T. D. Hollingsworth, and E. Michael. _Predicting lymphatic filariasis transmission and elimination dynamics using a multi-model ensemble framework._ Epidemics, 18:16–28, Mar. 2017. ISSN 1755-4365. doi: 10.1016/j.epidem.2017.02.006.




 