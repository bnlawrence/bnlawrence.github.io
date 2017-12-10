---
layout: post
title:  Model Resolution, Ensembles and Physics
last_modified: Monday 24 January, 2005
tags: climate resolution modelling_futures
categories: environment
---
Last Wednesday I attended a [meeting](http://www.rmets.org/event/detail.php?ID=18) of the Royal Met Society on *Perfecting Imperfect Models*.

During the panel discussion we spent time dicussing the relative importance
of spending effort on
* improving the physical parameterisations in climate models
* increasing the number and breadth of ensembles, and
* improving model resolution

In a somewhat provocative manner, we were charged to think about whether, if
we could achieve 1 km horizontal resolution (in climate models for climate
length integrations) in 10-15 years time, we would put less effort into
improving the physical parameterisations in our models?

Leaving aside the obvious response that some physical parameterisation will
always be needed, there was little discussion about the reality of the
proposition. Let's consider the facts:
* Recent state of the art climate models (HadCM3 in 2000, HadGEM in 2005) have
moved  resolutions from order 300 to order 150 km (implying a factor of
two was achievable in those five years).
* The next generation of models (e.g. HiGEM) are aiming for a doubling again,
but it is a three year project (again, e.g. HIGEM) to do the work required to
double the resolution (this is not the computing work, it's about producing
ancillary datasets, understanding the coupling of the components at higher
resolution, and indeed, addressing changes to the physical parameterisations).

So, in fifteen years from a scientific point of view, we might be able
to sustain at best doubling five times (although I suspect it **ought** to be
less than that to get better mileage out of the better models at each step).
That implies, scientifically the absolute best we might be able to get to
for climate is around 150/(2<sup>5</sup>) = 32, i.e. about 3 km.
More realistically it will be necessary to do some science along the way too,
so we can imagine a process of resolution enhancement, scientific
consolidation, and further enhancement. This process of model evolution
could be called punctuated equilibrium (with obvious apologies for
appropriating the name). So, with punctuated equilibrium, scientifically
the best we could do is probably going to be more like 10 km ... (for climate,
obviously NWP etc will be at higher resolution).

What about from a computing point of view?

Remembering that a factor **n** horizontal resolution increase requires **n**
squared calculations, and that in practice we would need to increase the
vertical resolution and decrease the time step, means that we are talking
about somewhere between **n<sup>3</sup>** and **n<sup>4</sup>** more calculations
(anything less than **<sup>4</sup>** implies some smart improvements in numerics).
In reality as we increase the resolution, we will undoubtedly find that we needmore parameters
to be advected on a global scale, and/or additional complexity (e.g. new
chemistry/aerosol schemes) so there is an additional factor **p** to
be included which will also scale in the same way.

Moores Law implies a doubling in computing capacity every 2 years, which needs
to be compared with the increase in computations of (at best) (**pn**)**<sup>3</sup>**
If **m** is the number of years required to support **p** and **n**, we have (at
best) 2<sup>**n**/2</sup> = (**pm**)<sup>3</sup> or **m**=11.5 log(**pn**). For **p**=1.2 and **n** = 10 (a guess,
and from the example above), we would have **m**=28 years from Moores Law ... so
it seems that computing will limit development (and allow time for punctuated
equilibrium in model resolution improvement).

Another way of thinking about it would be: what if we spent all our computing
capacity improvement on resolution enhancement for the next ten years? In
that case, we would have 2<sup>5</sup> = 32 times more capacity available (from
Moores Law) which neglecting **p** would support, a resolution increase of just
over two! This seems to be evidence that the 2000-2005 increase was only
possible because there had been a rest period in the punctuated equilibrium
of model development.

Of course, Moore's Law isn't the whole story because as the computing capacity
has gone up, we have also been able to apply massive
parallelisation as well ... this is an example of a technical improvement in
the way we do things. However, we've done that, so without a new way of doing
our  modelling (or a new cost model for the hardware), the bottom line here is
that a resolution increase of much more than 2-4 for climate models in the next decade is very unlikely.

One of the factors that impacts on all this will be how much effort we put
into increasing our ensemble sizes.  We carry out ensembles in two main ways:
* initial condition ensembles and
* parameter ensembles.

In general these are targeted at understanding the uncertainties in
predictions on shorter and longer timescales respectively. In general the
larger the ensemble, the more likely the predictions are to sample a wider
range of possible futures, and the better the accompanying prediction of the
various likelihoods.  However, one thing that ensembles can never do is sample
possible futures that are not predictable by the models involved. That means
the probability distribution and accompanying likelihoods must be biased by
all the things that we didn't or couldn't include in our models.  While that
seems obvious, what it means is that spending our increasing
computer resources on increasing ensemble sample size will not
necessarily result in better or more accurate climate predictions. However,
without ensembles, predictions are not accompanied by any uncertainty at all,
and as someone said, a prediction without a quantification of uncertainty is
no better than no prediction at all (tarot cards anyone?). The question is,
how big is an adequate ensemble size for most work? We don't yet know!

What about the physics improvements? I think there are three classes of physics
parameterisations in our models:
* parameterisations which represent scales which are a long way from ever
being resolved (e.g. radiation, cloud nucleation)
* parameterisations of the ensemble effects of complete systems which we may be
able to resolve to a "suitable" scale (e.g mid-latitude storm systems, some
classes of clouds).
* parameterisations which represent the sub-grid scale effects of processes
which occur on a range of scales, some of which are resolved (e.g. the
gravity wave spectrum and associated effects of flow over orography).

I believe we need to think about each of these rather differently, and weigh
the effort required against predicted resolution at the time a particular
round of parameterisation improvements may be complete.

Things that we didn't spend time thinking about include:
* What about the effort improving the complete systems which we need to
address as separate component models (ice, the land surface etc)?
* What about the problems handling the datasets that are produced by enormous
ensembles and high resolution? (Indeed, IO limits may in fact be a bigger
problem than CPU limits in the near future).

Another thing we never spend enough time on in climate science is thinking
about how best to exploit adaptive grid techniques,
e.g. [the material](http://www.damtp.cam.ac.uk/user/lcd/amr_atmos_2004/)
discussed at Cambridge in
December 2004.

#### trackbacks (2)
*[Using more computer power, revisited.]({% post_url oldblog/2008-01-23-using_more_computer_power_revisited %}) (from "Bryan's Blog" on (on Wednesday 23 January, 2008)*)

In the comments to my post on why climate modelling is so hard, Michael Tobis made a few points that need a more elaborate response (in time and text) ...

*[hpc futures - part one]({% post_url oldblog/2010-08-02-hpc_futures_-_part_one %}) (from "Bryan's Blog" on (on Monday 02 August, 2010)*

... By way of organising my thinking about increased resolution, and in some ways, following up on an even older discourse, I've spent a bit of time thinking about computing capacity ...
