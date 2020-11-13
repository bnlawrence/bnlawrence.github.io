---
layout: post
title: Humans in climate models
last_modified:
categories: academic
tags: academic climate esm
excerpt_separator:
image: assets/images/Calvin_Bond-Lamberty_2018_fig4.jpg
---

I recently had my attention [drawn](https://twitter.com/geschichtenpost/status/1319893263051010049) to [Beckage et al, 2020](https://doi.org/10.1007/s10584-020-02897-x) - "The Earth has humans, so why don't our climate models?"

_... a long essay in which Bryan goes down a number of interesting paper rabbit holes..._


Strange I thought. What would humans be doing _in_ a model of the physical climate system? Humans influence is most definitely present in our projections of the future via the various scenarios which define the specification of the land surface and radiative forcing as a function of time.

(Note how I immediately equate "climate models" to "models of the physical climate system", or "earth system models", ESMs.)

On skimming through the paper I discover they want "dynamic representation of human behaviour and social systems" because of the "strong feedbacks between social processes and climate".  

In this post I want to discuss why I think this would not be clever, at least now, and in full complexity models of the climate system. However, I don't think that's what they were arguing, although I had to go deep into the back story to really conclude that. The paper title (and contents) were a bit misleading on their own ...

The post is in three parts: I start by discussing their justification, then dig a little bit more into what _I think_ they really meant, and then lay out my opinion.  If you don't want to read any further, the bottom line is that I don't think we would learn anything useful from doing this routinely in full ESMs, although it is clearly a useful objective in other classes of climate model.  

#### Why was it suggested?

In the introduction to the body of the paper they recognise that in fact there are "static external projections" of GHG emissions" but think this is problematic because of the likelihood of "strong feedbacks between the state of the climate system and human emissions", quoting two papers - [Palmer and Smith (2014)](https://doi.org/10.1038/512365a) and [Thornton et al (2017)](https://doi.org/10.1038/nclimate3310). 

Let's dig a bit into those two papers.  

Firstly, Palmer and Smith, who make the point that people will change their behaviour (move, legislate etc) as climate changes and these changes will themselves effect the climate. Well yes. But they then go on to saying that "omitting human behaviour is like designing a bridge without accounting for traffic".  However, our ESMs do not omit human behaviour, although, yes, there are no direct feedbacks _within any given simulation_.  So nice line, but not actually relevant.

We certainly _simulate_ possible future human behaviours via land use and green house gas emission profiles. But no, it's not a feedback loop _inside_ a full complexity ESM. But should it be? More on that later.

Palmer and Smith then go on to say "it is essential to understand how the individual decisions combine across networks to produce macroscopic behaviours" and "Three main things are needed to model human responses to climate change: interdisciplinary research, appropriate computational and conceptual frameworks, and better data."  
That all sounds good. The need for _appropriate_ computational and conceptual frameworks.  

But what simulation goal is anticipated?  However you read this paper you can't say it presents any sort of strong argument for embedding humans into physical climate models, because it makes no claims about what new information could be gained from doing so (new being _additional and/or better than the state of the art_ which address _the purpose of the simulation_).

Ok, what about Thornton et al? This, from a modelling perspective, is much more interesting.  Their figure 1, reproduced here, both encapsulates what is normally done in existing ESMs and an interesting experiment they did. For scenario runs in coupled model intercomparison projects (CMIPs), one class of model an "Integrated Assessment Model", or IAM, is run to produce possible greenhouse gas emissions, land use, and land cover changes for the duration of the required scenario. These are then used as _forcings_ for simulations by physical climate models - typically we create and ensemble of such forced simulations, with a range of scenarios from the IAMs.
{% include image.html url="/assets/images/Thornton_EA2017_fig1a.png" caption="Current Best Practice in CMIP class ESMs" width="480" align="center" %}

So this is the state of the art. There are lots of issues with it, which is why we not only have ScenarioMIP ([O'Neill et al, 2016](https://doi.org/10.5194/gmd-9-3461-2016)) , but also LS3MIP ([van den Hurk et al, 2016](https://doi.org/10.5194/gmd-9-2809-2016)) and RFMIP ([Pincus et al, 2016](https://doi.org/10.5194/gmd-9-3447-2016)). It is clear that the _influence_ of human behaviour is in our climate models, and we are working on understanding the impact of a range of such behaviours, and the uncertainties in their representation.

However, Thornton et al go on and build a different model, depicted in their figure 1b:
{% include image.html url="/assets/images/Thornton_EA2017_fig1b.png" caption="A synchronous two way coupling system linking an IAM to a physical climate model" width="480" align="center" %}

In this system biospheric information coming out of the land model component of the earth system is fed to an IAM _on a five-year timestep_ which drives land use changes which influence the climate which influence the land etc. (This version does not update the emissions profiles seen by the ESM during the simulation.)

They get some interesting results. Go read the paper for details. Their headline conclusion is that biospheric feedbacks to human systems can alter anthropogenic climate forcing. Importantly they also conclude that this modelling system has not been used to provide a comprehensive assessment of uncertainty associated with _a particular scenario_.  (In this case a scenario is a set of _demographic and policy assumptions_ which yield the emissions profile and presumably constrain the human responses to feedbacks from the climate system.) They go further, 

- "... a synchronously coupled system that includes an ESM component can never replace the traditional use of standalone IAMs as tools for deep exploration of uncertainty. Instead, 
- "the synchronously coupled system is a new tool that allows us to explore a previously dark region of the uncertainty space."

So this paper certainly supports the assertion that feedbacks between the human system and an ESM can be _signficant_ and worth _investigating_. It is not obvious to me that it follows that building and using such models is the best way to address their consequences, not least because we can't get a handle on the associated uncertainties, even if we can peer into some of the relevant space.  But even then,  it may be a dark region of uncertainty space, but it almost certainly fits inside the boundaries of uncertainty space used in, for example, ScenarioMIP. 

#### What do they mean?

So the previous two papers were used to assert that "externalizing anthropogenic GHG emissions sidesteps much of the complexity and interplay between the climate and human system that in turn limits the realism of projections of climate change.

To a point, that's undeniable, but what does "limiting the realism mean" and does it matter?  If extra realism leads to no new understanding, is it worth doing? How do we even know it is actual real realism?

In any case, what did Beckage et al have in mind to "put humans in models"?
They introduce the notion of "Social-Climate Models", and I have to confess I'd never heard of them (at least by that label), so I'm off to the references they provide: [Beckage et al, 2018](https://doi.org/10.1038/s41558-017-0031-7) and [Calvin and Bond-Lamberty (2018)](https://doi.org/10.1088/1748-9326/aac642).

As Calvin and Bond-Lamberty is a review article, I started there (and discovered that Social Climate Models is not a term they use, so I'm guessing it's not in common usage). It too is an interesting read (so I'm already glad I've gone down this rabbit hole, I think finding and reading this and the Thornton paper already justify the effort.) One early statement that resonated was this:
"explicitly treating human-earth system feedbacks is valuable because the alternative is an implicit model, with hidden assumptions and untested internal dynamics ([Epstein 2008](http://jasss.soc.surrey.ac.uk/11/4/12.html))".

I went on down that rabbit hole too, and found some things that were less supportive of the central thesis here, including "simple model can be invaluable without being right in an engineering sense". But I also found a more useful statement in support of the central thesis than any of the others I'd come across so far: "Another advantage of explicit models is the feasibility of sensitivity analysis. One can sweep a huge range of parameters over a vast range of possible scenarios to identify the most salient uncertainties, regions of robustness, and important thresholds." (Although Epstein himself made an important central assumption wrt parameter sweeping his explicit model: that it is computationally feasible to do it without emulation! If you are doing emulation, well that's a different game ...)

I like the idea of sweeping over a large range of parameters, especially if people are involved, but clearly that's going to be hard with an ESM where we already have relatively small ensemble sizes because of the sheer expense of the simulation. 

Back to Calvin & Bond-Lamberty.  They provide a useful taxonomy of "integrated human-earth system modelling", that is _existing_ models which have climate and humans in them. They also summarise existing literature on different approaches, and quote Muller-Hansen et al (2017) who conclude "If behavioural patterns are not expected to change over the relevant timescales or feedbacks between natural and social dynamics are sufficiently weak, modelers can simply use conventional scenario approaches" and Zvoleff and An (2014) who conclude that "the most appropriate tool depended on the question asked". 

They provide [a table](https://iopscience.iop.org/article/10.1088/1748-9326/aac642#erlaac642t2) of integrated modelling systems that they used in their study and a figure depicted the relative complexity of the human and earth system components.
We can see that Thornton et al is right up there with the state of the art. I don't know about PRIMA yet, although I note it is a regional ESM focusing on hydrology.

{% include image.html url="/assets/images/Calvin_Bond-Lamberty_2018_fig4.jpg" caption="Relative complexity of components within models examined by Calvin and Bond-Lamberty" width="480" align="center" %}


What's really interesting about this paper is they then look at how these models impact on RCP variables, that is on the variables used to establish forcing scenarios. Their figure 5 reproduced here, isn't exactly a ringing endorsement that the RCP scenarios (let alone the later SSPs not discussed here) are not encompassing the range of human feedbacks. I draw three conclusions from this figure:

{% include image.html url="/assets/images/Calvin_Bond-Lamberty_2018_fig5.jpg" caption="A comparison of selected simulations including more complex of human interactions with RCP scenarios." width="800" align="center" %}

-  There is one model, that of Beckage et al 2018, which seems to be doing different things with emissions;
-  There are two models which imply enhanced warming when included (Calvin and Bond_Lamberty characterise these as having the potential to move response from one RCP to the next), and
-  There are changes to land productivity and crop area.

We'll come back to these and Beckage et al 2018, but before we leave Calvin and Bond Lamberty, it's worth summarising their list of challenges with making progress:

1. Selecting the right level of complexity, in particular the difficulty of communicating information from one complexity level to another, and the potential for error propagation.

2. How does one mathematically represent human behaviour?

3. Computational cost.

4. Data availability and consistency.

5. using appropriate computational and conceptual frameworks (quoting Palmer and Smith).

They had a couple of headline conclusions, which basically were that there was a wide range of feedbacks across studies and variables, some negligible, some very large, as large as moving between RCP scenarios and larger than other feedbacks traditionally included within ESMs. However, they also noted the small numbers of studies and the difficulty in having confidence in these results due to the range of results encountered, being unable to differentiate between different models, scenarios and other factors. 

(They also make a couple of allusions to the use of EMICS --- "Earth System Models of Intermediate Complexity" -- as useful tools in this space.)

So to Beckage et al (2018).  This essay is already too long, so we'll be brief.  They introduce their "Climate Social Model" or CSM (so we can see where SoCM has come from). As far as I can see the "climate" part of their model is [C-ROADS](https:doi.org/10.1002/sdr.147), which isn't really a physical climate model at all, the C-ROADS authors variously call it a "management flight simulator" and a "policy simulation model", designed to run on a laptop in seconds.   One of the things they do with this model is run literally hundreds of thousands of experiments to explore some parameter space.

This is a model with a pretty poor representation of climate, so I'm not overly impressed that the climate sensitivity it exposed in the model comparison is that realistic. Sometimes things being too simple means they are just wrong. However, it is clearly a model which does allow parameter spanning.   I can see that one might want to argue for better climate models with which to do this work, which brings us to:

#### So what do I think?

It's clear that as usual, the headline "The Earth has humans, so why don't our climate models?", like all headlines, needs unpicking. What do the words mean? Why the question?

Let's take it in reverse. 

We've concluded the "What do they mean?" section by understanding where they are coming from. There is no question that humans influence climate and that climate changes influence people.  The timescales are slow though. Behaviour and policy may change quickly and suddenly, but the drivers towards such changes are slow - it takes an accumulation of weather to deliver climate and time for people to react to that accumulation, even if the eventual policy and behaviours might be driven by one last "climatic straw" event ([the weather straw to the climate back](https://en.wikipedia.org/wiki/Straw_that_broke_the_camel%27s_back)).

With that in mind, for me, the _adaptation problem_ for _physical climate modelling_ is to develop [storylines](https://doi.org/10.1098/rspa.2019.0013) that describe the sorts of events that could occur, particularly where they are either the sort that could be come prevalent enough to be "climatic straws", or are sufficiently catastrophic in their own right to generate mitigation and/or a priori adaptation (e.g. we buy fire insurance and install fire-escape windows despite the risk of a house fire being negligible for any one of us). (This paragraph is phrased in terms of "catastrophe", but no matter how bad it gets, there will also be opportunities, and storylines should help tease out those too!)

 - The models we use for these problems do not need two-way interactions with human systems, on the timescales in play, human models will respond to the climate, but there will be no forcing of the climate system itself.

However, recognising that change will happen, and trying to decide both the scale of likely change, and what could or should be done about it - the _mitigation problem_  requires a very different set of modelling tools. We have already seen the state of the art certainly allows humans to influence climate via scenarios, but how do we close that loop - how do we think climate change will influence policy and behaviour, and do we really believe we need to iterate round that loop inside running simulations? Most importantly, can we quantify the likelihood of a particular outcome for a particular intervention?

- My take on this is that we do not need to have interacting humans inside running simulations which have realistic and detailed representation of the physical climate - not only do we not have good mathematical models of the relevant human behaviour, we do not have the computational power to do the vast amount of parameter spanning across human behaviours with detailed climate as well.  In my opinion this would not be an _appropriate computational framework_ in the sense of Palmer and Smith, the balance of complexity between the human system and the climate system representations would be _inappropriate_ (using the language of Calvin and Bond-Lamberty).

There are of course other models, particularly IAMs, which can be considered as climate models if the problem at hand is the interaction of humans and climate. Increasing the coupling of human behaviour on the climate system of those models may make a lot more sense - but of course these are models which have human interactions in them already, so what Beckage et al are really asking for is "more complete representations of human interactions" in "some classes of (fast) climate models". If more realistic climate was necessary, then one might consider EMICs, but going to a full ESM? Not a good use of time and energy in the near future!

Blame Oliver Bothe for this if you have read this far. He [invited us to _discuss_](https://twitter.com/geschichtenpost/status/1319893669172940807?s=20)!


(Updated 29/10/2020: I had inadvertently linked the same Thorton figure twice. Fixed.)
