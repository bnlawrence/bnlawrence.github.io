---
layout: post
title: hpc futures - part two
last_modified: Thursday 28 April, 2011
tags: exascale hpc badc resolution modelling_futures
categories: computing
---
What is this exascale wall that I've been tweeting about?

The last decade of advances in climate computing have been underpinned by the same advances in computing that everyone of us saw on our laptop and desktop until a couple of years ago: chips got faster and smaller. The next decade started a couple of years ago: processors are not getting faster, but they are still getting smaller, so we get to have more processors - there are even dual-core smartphones out there now! What's not so obvious though is that the memory per core is generally falling, and while the power consumption is falling, it's not falling fast enough ... pack a lot of these (cheap) cores together, and they use a ludicrous amount of power. The upshot of all this is great for smartphones, but not so good for climate computing: the era of easy incremental performance (in terms of faster time to solution, or more complexity/resolution at the same time to solution) in our climate codes is over. Future performance increase is going to have to come from exploiting massive parallelisation (tens of million to a billion) threads with very little memory per thread - and it'll come with energy cost as a big deal. I first starting [wrote about exascale]({% post_url oldblog/2010-08-02-hpc_futures_-_part_one %}) on my blog back in August last year. (I promised to talk about data then, and I will here ...)

What all this means is that our current generation of climate model codes probably have at best a few years of evolution in their current incarnation, before some sort of radical reshaping of the algorithms and infrastructures becomes necessary. At the US meeting I'm at now, two different breakout groups on this subject came to the same conclusion: if we want to have competitive models in five years and ten years time, we need to a) continue to evolve our current codes, but b) right now, start work on a completely new generation of codes to deploy for use in the next but one generation of supercomputers.  That's a big ask for a community starved of folks with real hard-core computing skills. Clearly there are a lot of clever climate modellers, but the break out group on workforce summarise the reality of the issue to be that the climate modelling community consists of three kinds of folks: diagnosticians, perturbers (who tinker with codes), and developers. Universities mainly turn out the diagnosticians, some perturbers, but very very few developers with the skillset and interest to do climate code work.

That's a big problem, but the data side of things is pretty big problem too. Yes, the exascale future with machines with tens to hundreds of millions of cores is a big problem, but even now we can come up with some scientifically sensible, and computationally feasible methods of filling such a machine. Colin Jones from the SMHI has proposed a sensible grand ensemble based on tracticable extension of how EC-Earth is being used now (running, in an extreme experimental mode at an effective 1.25 degrees resolution).  An extrapolation of that model to 0.1 degrees resolution (roughly 10km) would probably effectively use 5000 cores or so.  If one ran an ensemble of 50 members for a given start date, at the same time, it could use 250,000 cores.  Ideally one would have a few different variants of this or similar models available, capturing some element of model uncertainty, let's say 4. Now we can use 1 million cores. To really understand this modelling "system", we might want to run 25 year simulations, but sample a range of initial states, let's say 40. Now we can use 40 million cores. This is an utterly realistic application. If a 40 million core machine was available, and we could use it all, this would be an excellent use of it (there are other uses too, and for those we need the new codes discussed above). But let's just consider a little further.

Colin tells me that the 1.25 degree (actually T159L62) model produces roughly 9 GB of data per simulation month writing out onto an N80 reduced Gaussian grid (which means you can double the following numbers if one wanted "full resolution"). Scaling up to the 0.1 degree version would result in 1.4 TB/month, and the grand ensemble described above would result in a total output of around 3 exabytes! For a reasonable time to solution (150 hours or a week all told, that is 6 hrs/model_instance_year), it would require a sustained I/O from the machine to storage of around 50 Tbit/s.

Archive and analysis may be a problem! Remember this 3 exabytes of data could be produced in one week!

At this point it's probably worth considering an exascale computer not as a "computer" but as a "data source" ... it's a bit of a paradigm shift isn't it? Even without heaps of work on exascale software, our exascale computer can produce an outrageous data problem. We need to start thinking about our computer in terms of its analysis and archive capability first, then we can think about it's computational ability, and indeed, how to get our codes to address other important problems (such as faster time to solution so we can have better high-res paleo runs etc). This ought to be affecting our purchasing decisions.

Hang on a moment though. The obvious immediate rejoinder is "we don't need to write all this data out". So what can we do to reduce the data output? We can calculate ensemble statistics in the machine, and we can choose only to write out some representative ensemble members. That might gain us a factor of 10 or so.  We could simply say, we'll only write out certain statistics of interest, and not all the output, and that's certainly feasible for a large class of experiments where one is pretty sure the data will get no re-use, because the models are being deliberately put in some mode which is not suitable for projection analysis or extensive comparison with obs - but many of these ensemble experiments are very likely to produce re-usable data. Should it be re-used?

Well, consider that our 40 million core machine will probably cost around 50 million USD when we get hold of one. If we depreciate that over five years say, then it's about 10 million per year (in capital cost alone) or about 20,000 USD per week to use. Double that figure for power costs and round up to 50,000 USD for that grand ensemble run. I have no idea what storage will cost when we can do this run, but my guess is that the storage costs be of the order of 300,000 USD. To be generous, let's imagine the storage costs will exceed the run time costs by a factor of 10.

(Where did that number come from? Well, today's tier-1 machine might have 50,000 cores, and it costs o(1) million USD per PB. To go to 50 million cores, we scale CPU by 1000, let's imagine we scale data costs accordingly. So when I have a 50 million core machine, I'll be able to get an EB of storage for the same price as today's PB.)

So the big question then is, how many application groups are likely to be able to exploit my run, and can I anticipate their specific data output needs? Well, my guess for an ensemble experiment as discussed above, there would be value in that data for considerably more than ten different groups - be they parameterisation developers, observational analysists, or impacts advisors!

So, we probably should store as much of it as we feasibly can! We can talk about the analysis effort and the network issues at a later date!

(Actually, when I run the numbers for other possible permutations of output, and model configuration, the 9 GB/month we started with seems small, it's entirely feasible to suggest a realistic IPCC style output requirement when scaled out, would result in around 50 times more output, but for an IPCC experiment, hundreds of applications are feasible).


#### comments (1)

*[Nick Barnes](http://climatecode.org/) (on Thursday 28 April, 2011)*

An excellent post.  I read this a month or two ago, and thought of you:

http://spectrum.ieee.org/computing/hardware/nextgeneration-supercomputers/0
