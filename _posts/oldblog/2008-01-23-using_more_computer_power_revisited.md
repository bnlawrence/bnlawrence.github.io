---
layout: post
title: Using more computer power, revisited.
last_modified: Wednesday 23 January, 2008
tags: climate modelling_futures
categories: environment
---
In the comments to my post on why [climate modelling is so hard]({% post_url oldblog/2008-01-16-why_is_climate_modelling_stuck %}), Michael Tobis made a few points that need a more elaborate response (in time and text) then was appropriate for the comments section, so this is my attempt to deal with them. But before, I do, let me reiterate that I don't disagree that there are substantial things that could and should be done to improve the way we do climate modelling. Where the contention lies maybe in our expectations of what improvements we might reasonably expect, and hence perhaps in our differing definitions of what might be impressive further progress.

Before I get into the details of my response, I'm going to ask you to read an old post of mine. Way back in [January 2005]({% post_url oldblog/2005-01-24-Model_Resolution %}), I tried to summarise the issues associated with where best to put the effort on improving models: into resolution, ensembles or physics?

Ok, now you've read that, three years on, it's worth asking whether I would update that blog entry or not? Well, I don't think so. I don't think changing the modelling paradigm (coding methods etc), would change the fundamentals of the time taken to do the integrations although it might well change our ability to assess changes and improve them, but I've already said I think that's a few percent advantage. So, in practise, we can change the paradigm, but then the questions still remain: ensembles, resolution or physics? Where to put the effort?

Ok, now to Michael's points:

*Do you think existing codes are validated? In what sense and by what
method?*

In the models with which I am familiar I would expect every code module that can be tested physically against inputs and outputs has been done so for a *reasonable* range of inputs. That is to say, someone has used some test cases (not complete, in some cases, the complete set of inputs may be a large proportion of the entire domain of all possible model states, i.e. it can't be formally validated!), and tested the output for physical consistency and maybe even conservation of some relevant properties. There is no doubt in my mind that this procedure can be improved by better use of unit testing (Why is that if statement there? What do you expect it to do? Can we produce a unit test?), but in the final analysis, most code modules are *physically* validated, not computationally or mathematically validated. In most physical parameterisations, I suspect that's simply going to remain the case ...

Then, the parameterisation has been tested against real cases. Ideally in the same parameter space in which it should have been used. For an example of how I think this should be done, you can see [Dean et al, 2007](https://doi.org/10.1007/s00382-006-0202-0), where we have nudged a climate model to follow real events so we can test a new parameterisation. This example shows the good and bad: the right thing to do, and the limits of how well the parameterisation performed. It's obviously better, but not yet good enough ... there is much opportunity for Kaizen available in climate models, and this sort of procedure is where hard yards need to be won ... (but it clearly isn't a formal validation, and we will find cases where it's broken and needs fixing, but we'll only find those when the model explores that parameter space for us ... we'll come back to that).

(For the record, I think this sort of nudging is really important, which is why I recently had a doctoral student at Oxford working on this. With more time, I'd return to it).

*It might be possible to write terser code (maybe by two orders of magnitude, i.e 10K lines of code instead of 1M lines of code).*

While I think this is desirable, I think the parameterisation development and evaluation wouldn't have been much improved (although there is no doubt it would have helped Jonathan, the doctoral student, if the nudging code could have gone into a tidier model).

*The value of generalisation and abstraction is unappreciated, and the potential value of systematic explorations of model space is somehow almost invisible, or occasionally pursued in a naive and unsophisticated way.*

I don't think that the value is unappreciated. There are two classes of problem: exploring the (input and knob-type) parameters within a parameterisation, and exploring the interaction of the parameterisations (and those knobs). The former we do as well as is practicable and I certainly don't think the latter is invisible (e.g. [Stainforth et al, 2004](https://doi.org/10.1038/nature03301) from [ClimatePrediction.net](http://www.ClimatePrediction.net) and [Murphy et al, 2004](https://doi.org/10.1038/nature02771) from the [Met Office Hadley Centre](http://www.metoffice.gov.uk/research/hadleycentre/) QUMP project). You might argue that one or both of those are naive and unsophisticated. I would ask for a concrete example of how else we would do this. Leaving aside the issue of code per se, we are stuck with core plus parameterisations - plural - aren't we?

*(if) there is no way forward that is substantially better than what we have ... I think the earth system modeling enterprise has reached a point of diminishing returns where further progress is likely to be unimpressive and expensive...*

I'm not convinced that what we have is so bad. We need to cast the question in terms of what goals are we going to miss, that another approach will allow us to hit?

Which brings us to your point

*... If regional predictions cannot be improved, global projections will remain messy,*

True.

*... time to fold up the tent and move on to doing something else... the existing software base can be cleaned up and better documented, and then the climate modeling enterprise should then be shut down in favor of more productive pursuits.*

I think we're a long way from having to do this! There is much that can and will be done from where we are now.

*I have very serious doubts about the utility of ESMs built on the principles of CGCMs. We are looking at platforms five or six orders of magnitude more powerful than todays in the foreseeable future. If we simply throw a mess of code that wastes those orders of magnitude on unconstrained degrees of freedom, we will have nothing but a waste of electricity to show for our efforts.*

I don't think anyone is planning on wasting the extra computational power, and I think my original blog entry shows at least one community was thinking, and I know (since I'm off to yet another procurement meeting next week) continues to think, very seriously about how to exploit improving computer power.

On what grounds do you think improving the models, and their coupling, will not result in utility?

#### comments (6)
*[Sean Gillies](http://zcologia.com/sgillies) (on Wednesday 23 January, 2008)*

Your commenting system seems broken today.

*[Sean Gillies](http://zcologia.com/sgillies) (on Wednesday 23 January, 2008)*

Bryan, I thought Tobis's point was usability. There's an ecologist I know who has gained by sheer force of will (he's not a mathematician or physicist) enough mastery over the land surface and hydrological modules of a model that he can do meaningful numerical experiments. Imagine if this scientist could model with a higher level language: the learning curve would much less steep and he'd have been able to get real work done much sooner. I imagine it would even save money in the long run.

*Bryan (on Wednesday 23 January, 2008)*
(Actually, I think our server might have been a bit broken for a bit, I couldn't get a proper feed either. Hopefully it's ok now.)

As far as useability goes, I have no argument that much can be gained by rewriting things, that's in my category of common ground with Michael :-). However, your ecologist is exactly the sort of target that Curator, PRISM and ESMF are trying to support within the existing frameworks. Yep, it's flawed, but no one has (yet) a better approach. I hope Michael (or someone else) might provide one, but I think it's good to get the goals right :-)

*[Michael Tobis](http://initforthegold.blogspot.com) (on Tuesday 29 January, 2008)*
You ask "On what grounds do you think improving the models, and their coupling, will not result in utility?". This is a loaded question. In my view "improving" amounts to "adding utility", so nothing in my view would allow me to answer the question as phrased.

Nor is what I am asking "why is climate modeling so hard", exactly. What I mean by "stuck" is about diminishing returns.  The question is whether the increment in utility per unit of effort is increasing or decreasing, and my concern is that it's the latter.

Let me try again to elaborate.

First of all let me say that I am most aware of the situation in America. Some of the EGU sessions seem to indicate a more modern attitude over there. So perhaps my question is only whether and why American climate modeling is stuck.

That said, I am always looking for the most legible expression of a problem for a whole range of reasons. What I've seen is so far from that optimum that the difference between reality and potential makes me unhappy every day.

The models I would envision coming up with aren't different in some fundamental mathematical sense. I think the system is too messy for some fundamental Einsteinian twist to shed fundamental new light on it. I think the technology and methodology of addressing exactly this sort of mess is interesting and valuable in itself as well as in climate.

ESMF was a well-intentioned effort at this by non-scripters with a big-engineering view of the software development problem. It shows no signs of helping matters very much or reducing the complexity of the work being done.

Can scripters with an agile/software craftsmanship model do better?  That's what I'd really like to investigate. (I see a craftsmanship model trying to emerge from your SOA discussion, by the way.) This is not about the mathematical nature of the system they develop but about how it is designed, maintained and deployed.

Can anyone do better? I don't know how much better PRISM is than ESMF. There are reasons for me not to investigate in great detail, some having to do with the peculiar obstinacies of the US, and some having to do with the value of independent thought. Maybe what you are doing makes some sense.

Something substantially better than historical methods must emerge, though. Otherwise we should scale back the enterprise and leave the supercomputers of the future to people who know what to do with them.

There is little justification for putting gigawatt-months into a calculation of future climate that has no more reliability than what we have now although it is vastly more complex. At some point the best thing we can do for the climate system is just not to run the computation at all!

I suspect that the whole push toward more complexity is misguided. We need to think about what the simplest system is that yields comparable skill to what we already have. Adding land ice and geochemistry to extant models, in particular, has essentially trivial likelihood of being correct absent some deep insights that I don't know about. The relationship between models of long time scales and short ones needs to be worked out mathematically and represented parametrically, not through brute force. Serious statistical thought and cleverly guided ensembles are needed to provide useful prognostics.

Indeed, I'm afraid that an outcome of declining utility at increasing cost is not outside the realm of possibility.

We can't waste vast numbers of cycles on trying to build and run Deep Thought. We already know that the answer will be 42, and we will be left with the quandary of figuring out what the question is.

*Bryan (on Tuesday 29 January, 2008)*
One day we're going to have to have a beer and chat about this. I suspect we're on very common ground. I totally agree about the big-engineering versus craftsmanship ... hence my cathedral versus bazaar comment (recognising that cathedrals are pretty crafty too, but pretty hard to re-engineer :-) ... and I'm not sure I want to sell ESMF or PRISM per se, but some of the concepts (which I think I see lurking beneath your PyMCT and PyCPL paper) ...

I guess I'm just more optimistic about the future utility (albeit at increasing cost) ... but don't disagree there might be more cost effective methodologies.

*[Eli Rabett](http://rabett.blogspot.com) (on Wednesday 06 February, 2008)*

If 10 million lines of code get executed once and 10 lines get executed 10 million times, you best file on the 10 lines.  That is true of just about any large code.  You don't gain much (even readability if most of the stuff in the 10 million is in functions which are sensibly labeled prettifying the code
