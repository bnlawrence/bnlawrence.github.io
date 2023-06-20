---
title: Baljifest
when: May 15, 2023
location: GFDL, Princeton, via Zoom
layout: talk
categories: talks
tags:  HPC exascale modelling_futures
talks: 
    - Perspectives on the Future of Climate Modelling
image: assets/images/2023-05-15-colourwitch.png
---

Baljifest was a celebration of the contributions of [Balaji](https://balaji.scholar.princeton.edu/) to climate modelling at GFDL and Princeton. There was a day of presentations, followed by a panel on the future of climate modelling. [Saravanan](https://atmo.tamu.edu/people/profiles/faculty/saravananr.html) and I kicked off the panel with a presentation each.

<span class="presentation-link">Presentation: [pdf](/assets/talks/2023-05-15-lawrence-balajifest.pdf) (1.8MB)</span>

THe obvious place to start with an exercise in clairvoyance at a meeting like this was Balaji's own papers, but I moved rapidly to the conclusions from the science underpinning to the ENES strategy for climate modelling infrastructure (which at the time were nearly complete).

With a computing environment which is getting ever more complex the historical simplicty of a choice between spending compute on some combination of resolution/complexity/duration/ensemble-size/data-assimilation is getting hard to continue. We may need different hardware for different types of problems, not different ways of using the same hardware. We will see more complex workflows, and more emphasis on in-flight diagnostics leading to additional hardware issues.

But the main focus of this talk was on the impact of uncertainty on the future of modelling, and how we need to use many different types of models to address a combination of model uncertainty, internal variability, and scenario uncertainty. In doing so, we recognise that there is a lot of effort on understanding processes that is hidden when we talk of CMIP, and the full spectrum of climate modelling is necessary - not all of which is suitable for exascale computing.

Whatever we do, we need to plan our interactions with model diversity to unlock our understanding of model uncertainty, and not just hope for the best. There is plenty of evidence that it is necessary, but we cannot continue with ad hoc approaches. There is a finite community who can put the necessary effort into maintaining models which can span the proliferation of hardware we face.  And, in thinking about model diversity, we need to realise that we must not always strive for the models with the best representation of reality, because they may not be the best for a given task - but whatever we use, we need to know if is _adequate for purpose_. 




