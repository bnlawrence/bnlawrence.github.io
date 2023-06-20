---
layout: post
title: Digital Earths - The fourth phase of (ESM) modelling maturity?
last_modified:
categories: computing 
tags: climate
excerpt_separator:
image: assets/images/2021-05-25-Modelling_phase4.png
---

[I recently]({% post_url 2021-05-22-what-is-a-digital-twin %}) introduced my definitions of "Digital Twins" and "Digital Earths" and concluded with the statement that I thought there was scope to do good thing in (these new) twinning activities. There are two such axes of scope: scientific and technical. Here I want to discuss the latter (and it's impact on some science). In the discussion which follows I'm talking about Earth System Models (ESMs), but the arguments could apply to many other modelling activities (e.g. epidemiological modelling).


#### The Four Phases of Modelling Maturity

When we are talking about modelling as an activity (as opposed to models), and we are talking about models which aim to describe the real world as it is, was, or might be, then we obviously have to compare the model simulations with reality. Less obviously, we have learnt we have to compare those simulations with the simulations made by other models. What does all this "comparing" entail? It entails comparing lots of different variables in lots of different ways, and with anything like a complicated model, involves lots of different people who have expertise in different processes represented by those models.

This starts out on a local scale. People know how to use the output of their models and analyse the output by comparison with data they have already, or obtain from elsewhere:

{% include image.html url="/assets/images/2021-05-25-Modelling_phase1.png" caption="Phase 1: Individuals and groups within an institution analyse the output data from their complicated model"  width="233" align="center" %}

Before long it becomes necessary to compare simulations between groups, and people share output data files.  Initially they share files "as is" and describe what their data are and how to work  with ad hoc documents and emails (and maybe a wiki or two).

{% include image.html url="/assets/images/2021-05-25-Modelling_phase2.png" caption="Phase 2: Individuals and groups share data with close colleagues in other institutions and share information about what the data is and how it is formatted using private communications (e.g. email)."  width="399" align="center" %}

That model of sharing and collaboration doesn't scale though. At some point modellers in one group  will be using data from groups where they do not have personal contacts. Analysts may not even be in modelling groups.  

{% include image.html url="/assets/images/2021-05-25-Modelling_phase3.png" caption="Phase 3: Data producers and data consumers groups are not (well) known to each other. Standardised data files are described using machine readable catalogs and shared using standard protocols."  width="399" align="center" %}

At this point we probably have peak "modelling groups": people producing data are not seeing all the usage and all the benefit of producing the data in the first place.  Many users find the "standardised data" insufficient/inappropriate for their application and there is no head room for the modellers to address their requirements. Data volumes are problematic for moving. The benefits of model diversity in terms of independent alternate computational representations of the real world are probably not scaling with the number of models.

Some models and modelling groups might take one last step, and move from advertising data alone to additionally advertising how some collaborators can take advantage of numerical experiments.  A _limited number_ of collaborators may be able to take advantage of _concurrent scheduling and standardised __data__ interfaces_ to get higher temporal resolution and/or special data products _that will not be persisted beyond the run time_. Applications might use these data to drive other models, they may support fancy visualisation, but a key characteristic is that they need to be run _at the same time_[^fn1]. Collaboration now requires _advertising experiments_ as well as continuing to _advertise data_. This, for me, is a digital twin.

[^fn1]: How we establish these interfaces,  what they might look like, how "concurrent models" are scheduled and run, and how long before we get agreed methods which can become standardised is a topic for another day. 

{% include image.html url="/assets/images/2021-05-25-Modelling_phase4.png" caption="Phase 4: Two different modes of collaboration: advertise experiments to exploit ephemeral data during simulations, as well as supporting data use by third parties using standardised data products. " width="399" align="center" %}

(That limited number of collaborators can of course themselves represent larger communities that they serve via advice, publication, standardised data,  or any other mechanism.)

#### Digital Earths 

So, for me, an ESM based digital earth is a not just a model which has reached the fourth stage of maturity. It is an activity which involves situations covered by an experimental design which is not just that promulgated by an ESM community, but is co-designed by the wider community who need to collaborate on exploiting the ephemeral data.

The underlying assumption here is that the resources needed for an ESM based digital twin will be large (especially one with a global domain), and that we need to maximise both the utility of the experiments, and their user communities. In this case the user communities could well be those closer to being able to exploit ESMs to deliver actual societal outcomes as well as other physical science groups.

#### Postscript

Update: After I posted this we had an interesting exchange on twitter:

{% include image.html url="/assets/images/2021-05-26-twitter-conversation.jpg" width="491" align="center" %}