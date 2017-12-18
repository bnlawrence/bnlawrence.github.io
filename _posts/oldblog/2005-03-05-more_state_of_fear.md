---
layout: post
title: More State of Fear
last_modified: Saturday 05 March, 2005
tags: climate crichton
categories: environment
---

Another installment in my (seems likely weekly) discussion of Michael Crichton's work of fiction. Before I get started, I can highly recommend the essay entitled "Dangerous Fiction" by Jeremy Leggett in New Scientist (5th March Edition).

I especially liked this excerpt:
<blockquote>The place to start in trying to understand this horrific assualt on sanity is this bibliography. It is indeed extensive, and shows that the author has read the basic texts on the human-enhanced greenhouse effect, apparently without being impressed.  What does impress him is every un-peer-reviewed neoconservative funded pamphlet and book you can think of. And he doesn't hesitate to say so. As for the 12 volumes of Intergovernmental Panel on Climate Change (IPCC): on this painstaking compilation of the work of hundreds of climate scientists around the world, we find not a word of editorial comment.
</blockquote>

Leggett's whole review is worth reading!

[Last time]({% post_url oldblog/2005-02-26-state_of_fear_pick_my_timeseries %}) I picked up on a number of points in a conversation the characters had. I promised to come back on those issues, which basically had to do with Crichton not understanding either the scientific method, the complexity of the atmosphere, and scientific reserve (when we refuse to be absolute about what we know). When I wrote that blog entry, I intended to go through the enumerated points, but I've slept on that a few times, think it better to come back to what the IPCC says plus a few words on paramerisation.

So Crichton says "No one knows ..." well, the IPCC really is the sum
of human knowledge on climate change, so what did they say? On [page one](http://www.grida.no/climate/ipcc_tar/wg1/005.htm) of the executive summary, we have the evidence for current climate change. What's really interesting is this figure:
![Image: IMAGE: static/2005/03/05/ipcc_fig1.gif ](/assets/images/2005-03-05-ipcc_fig1.gif)

The key thing this shows is how very unusual the last one hundred years of this millinium have been - and is more evidence that we shouldn't be too perturbed by the implications that Michael Crichton tries to draw from his temperature data from carefully selected locations.

Another thing the IPCC report states is;
<blockquote>A few areas of the globe have not warmed in recent decades, mainly over some parts of the Southern Hemisphere oceans and parts of Antarctica.
</blockquote>

OK, well that deals with the conspiracy that Crichton tries to imply on page 194, where he has his characters citing some (real) literature to make the point that the Antarctic as a whole has not increased in temperature. He seemed to be trying to build a case that the climate change science community is trying to hide evidence. Far from it, it's all grist to the mill. The climate is a comlex system, but still, the IPCC final conclusions include:
<blockquote>Emissions of greenhouse gases and aerosols due to human activities continue to alter the atmosphere in ways that are expected to affect the climate.
</blockquote>
<blockquote>There is new (since the last report) and stronger evidence that most of the warming observed over the last 50 years is attributable to human activities.
</blockquote>

There is much much more that we know ... and you should read about it. The IPCC summary is worth reading and is quite accessible (accessible in terms of [finding it](http://www.grida.no/climate/ipcc_tar/wg1/005.htm), in readability and in authority).

Now let's get back to some other things that I said I'd talk about, parameterisations, and why they most definitely are not guesswork! More things the IPCC say include:
<blockquote>In general, they (Coupled Atmosphere/Ocean models) provide credible simulations of climate, at least down to sub-continental scales and over temporal scales from seasonal to decadal. The varying sets of strengths and weaknesses that models display lead us to conclude that no single model can be considered "best" and it is important to utilise results from a range of coupled models. We consider coupled models, as a class, to be suitable tools to provide useful projections of future climates. ...  Clouds and humidity remain sources of significant uncertainty but there have been incremental improvements in simulations of these quantities.
</blockquote>

Now, let's translate this last sentence. We do know the physics of what happens to clouds when we increase the temperature, and/or add more water into a small volume (which Crichton implies we don't). However, when we take these complex models, and compare them to the real world, we find that the real world and the model diverge in a number of ways!  Why is that? Well, it's true that it is in part to do with parameterisation uncertainty, so let's define what we mean by parameterisation
and indeed uncertainty.

Firstly uncertainty: as scientists we are never certain, but we can put bounds on our level of uncertainty. Often times these bounds admit of very little uncertainty, but we refuse to say we know something ... that's just the way it is. If you did science at high school, you will remember being forced to measure things with "errors". So you should never say that you know that an  object is 10cm long, it is 10cm plus or minus 0.5 cm (or whatever). That's an example of uncertainty. You'd never find a (good) scientist making any statement without qualification.

What about parameterisation? To understand that, we need to come back to what a coupled model is. In short, it's a complex system of hundreds of mathematical equations used to predict climate. These modells encapsulate nearly everything we **know** about
the physics of the atmosphere: starting from Newton's laws of motion, the gas laws, and working up to detailed thermodynamics of water ice transitions and much much more. These equations represent the processes going on between and in "grid box"s. Each grid box represents a finite amount of the atmosphere in three dimensions (hence "box"), and they are distributed throughout the volume of the atmosphere. Generally, we call the processes which are dominated by the physics of the interaction between boxes as "fully resolved", and those that are dominated by processes which have scales smaller than a grid box as "sub-grid" scale.

Typical climate model grid boxes are of the order of a couple of hundred km square and with varying vertical resolution (a few hundred m near the surface to 10 km or so in the stratosphere). Problems arise because of these
large scales. What we call a parameterisation is where we take the properties of the grid box (large-scale) mean and attempt to calculate how the average behaviour of these sub-grid scale processes affect the grid box mean.

Why do we do that? Because many processes are clearly much smaller in scale.
Obvious examples of such processes include cloud processes. Clearly within a grid box there could be a wide range of clouds of different types. We might expect that there is a relationship between the large scale (temperature, humidity etc) and the cloud. We certainly know there is on the small scale, for example all other things being equal if we increase the temperature of a volume of air then there could be more water vapour as opposed to water condensate - hence less cloud. The temperature itself is generally dominated by large scale processes. So, a parameterisation is a set of equations which link what we know about the physics of the small scale, with the large scale, usually based on some statistical relationship between how the small scale physics might scale to the grid box mean. They are complicated physical equations, and they are tested rigorously by comparison with observations.

Any good GCM has dozens, if not hundreds, of parameterisations, most of which have been tested regularly in numerical weather predition as well as in evaluation of the climate models.  Most parameterisations are the result of years of work comparing physics with observations! Improving model predictions is a trade off between improving resolution, improving paramterisations, and improving our confidence in our predictions by running ensembles. See [my blog on model resolution]({% post_url oldblog/2005-01-24-Model_Resolution %}).

But, in the final analysis, parameterisations are approximations for the large scale of small scale physics. However it is absolute rubbish that they result from guesswork, quite the opposite, most parameterisations are simply approximations of complex physics. The validity of the approximations is tested by comparison with observations.

So back to Michael Crichton (who believes that in a few months light research he has understood more about the climate than the hundreds of scientists who have dedicated their lives to understanding it). When he calls parameterisations guesswork, he is displaying ignorance. When he says "no one knows", he is displaying more ignorance. When he shows a few timeseries of temperature and draws conclusions based on his special selections, he is being more than ignorant, he is being duplicitous. Oh well, he has that in common with many others ...

At this stage I'm on page 218. Frankly, this book is so frustrating that meanwhile I've read two others which have been far more interesting (actually novels about Roman times ...). I'll try and carry on with State of Fear ...
