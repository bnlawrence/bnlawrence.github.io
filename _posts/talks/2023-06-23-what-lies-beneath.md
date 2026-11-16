---
title: NCAS@Reading Weekly Seminar
when: 23 June, 2023
location: Reading
layout: talk
categories: talks
tags:  HPC exascale hrcm modelling_futures
talks: 
    - Climate Science - What lies beneath?
image: /assets/images/2023-06-20-wordcloud.png 
---

In this seminar I laid out the background to the new [ENES infrastructure strategy]({% post_url 2023-06-20-infrastructure-strategy %}), including not only the computing context but a good part of the science motivation for a spectrum
of climate modelling activities. Below I sketch out a summary of a few of the points I made.

<span class="presentation-link">Presentation: [pdf](/assets/talks/2023-06-23-what-lies-beneath.pdf) (2.3 MB)</span>

I start with  an introduction to ENES (the European Network for Earth System modelling) and define infrastructure in this context. The strategy presented
builds on previous strategy exercises, and involved interviewing all the major
European modelling groups and reviewing a bunch of current pan-European projects.

The computing context consists of the implications of changing computing hardware, the need for new maths and algorithms, the rise and rise of machine
learning, and our need to pay more attention to cost (both energy and currency costs). The consequence is that our traditioanl expectation that we could just use any computer in different ways is no longer as true as it was (if it ever
was). There are going to be new ways of dealing with data workflows, with
more emphasis on handling ephemeral data - which will have implications 
for portability of the necessary ephemeral workflows. The big consequence is
that we will need to start treating big modelling projects more like satellite
missions.

The scientific landscape ranges from the WCRP lighthouses and big international projects to pan-European projects and large single model ensembles. There are important scientific and technical collaborations, and we need to deal with
interfaces to other scientific communities as well as the climate service
community.

A big part of most projects is addressing some aspect of model or scenario uncertainty, or the impact of climate variability - it is clear that the
climate we have had is only one of many possible climates we might have
had, and the same applies to the future. It's not all about statistics,
some aspects of risk need to be addressed by working backwards in causal networks - and when we do that we find important roles for many different types
of models and modelling approaches.

Which model we use for a given problem is very much an issue of establishing whether or not is fit or adequate for the purpose, not just whether or not it has the best representation of reality. We see that play out in the variety of different models and resolutions used for the very many different parts of
CMIP6. We have a range of different climate models targeting
a range of different applications, and some of those models are capable
of deployment on exascale computing, and some are not. 

We are very aware of the impact of model diversity on uncertainty, but we address that with a very ad hoc approach to modelling - there is certainly a lot
of apparent process diversity in the European climate modelling ecosystems, but it
has arisen, not been cultivated. Could we cultivate and plan our model
diversity? Is it too dependent on one ocean model? Will the advent of a commuinty ice model (SI3) and more use of the FESOM2 ocean make a difference?  There
is huge scope to plan - on a European scale - our approach to diversity going forward rather than just hope we get the right amount.

The presentation finishes with a summary of some of the recommendations, but as they are directly linked [here]({% post_url 2023-06-20-infrastructure-strategy %}), I'll not bother with that summary here, simply remind the reader that a climate infrastructure strategy has to support
the necessary scientific diversity, and address all our needs, including supporting and growing our workforce.
