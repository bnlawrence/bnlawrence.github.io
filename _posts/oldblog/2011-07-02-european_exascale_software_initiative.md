---
layout: post
title: European Exascale Software Initiative
last_modified: Saturday 02 July, 2011
tags: exascale hpc meetings modelling_futures
categories: computing
---
Last week I spent two days at the lovely Domaine de Tremblay (an hour from central Paris):
![eesi.tremblay.jpg ](/assets/images/2011-07-02-eesi-tremblay.jpg)

This was the venue of a workshop organised by the European Exascale Software Initiative ([EESI](http://www.eesi-project.eu/pages/menu/homepage.php)).  The project has an interesting blend of activities; four domain working groups
* industrial and engineering applications,
* weather, climatology and earth sciences,
* fundamental sciences,
* life sciences and health,

cut across four technical working groups
* hardware roadmaps (and vendor links),
* software ecosystem,
* numerical libraries, solvers and algorithms, and
* scientific software engineering.

to try and work out what Europe will need to do to exploit future exascale computing systems (which is of course a software problem).

I didn't keep proper notes, but I did tweet a bit, here's my tweet stream from the meeting:
* Sitting in a long narrow room ready for two days on the European Exascale Software Initiative. Not expecting a hashtag here #eesi
* Some real ambition in this room. Complete simulation of aircraft and airflow, would require zetaflop computing! #eesi
* I so do NOT believe in codesign: if the s/w life cycle is **much** longer than the h/w life cycle, it's a non starter! #eesi
* Other domains (genomics, seismology etc) as well as climate stress importance of exaSCALE cf exaFLOP! Need more balanced HPC! #eesi
* Hardware review: interesting to note that the only thing all vendors are actively researching is hw fault tolerance! Frightened? #eesi
* Worries about parallel file system futures: scalability and reliability, file number, metadata performance. Few vendors in the game! #eesi
* Programming models needed which better allow incremental parallelisation, more decoupling between h/w and s/w, and easier portability #eesi
* Not all faults expected to be masked by h/w, or tolerated easily by application (h/w correction will generate noise, global restart) #eesi
* Quadrant diagram: divide tasks into ((production, testing) versus (slower, faster)). Helps decide between capability versus capacity #eesi
* Not acceptable to try and control 3 levels of parallelisation by hand: system, nodes, cores. Improve abstraction in programming model #eesi
* Future algorithms might have to start with single precision, because SP uses less power, and then only use double precision later #eesi
* Crickey. Someone asked about libraries for symplectic integration. I can remember the noun Hamiltonian. Can't remember what it means! #eesi
* Definition of co-design: h/w perspective, we'll work with s/w community so you can change your apps to use our (slightly changed) h/w. #eesi
* Definition of co-design: s/w perspective, we'll work with h/w community so you can change your systems. Will they ever meet? #eesi.
* exascale hybrid core future: we might need to spend half the money we used to spend on computers on s/w engineers so we can use them! #eesi
* Bloke in audience: why does data management matter for exascale? Everyone: because the flops are useless if you can't feed &amp; use them! #eesi
* Speaker guess: 3 h/w generations between us &amp; exascale? Me sotto voce: If they get more heterogeneous each time we'll never get there! #eesi
* One breakout grp arguing for s/w isolation layer to hide h/w. Next asking for co-design between h/w and s/w. Draw your own conclusion #eesi
* Programmability: Petascale systems are not easy to programme. Do we really believe it will get easier at exascale? Yet it must! #eesi
* Programmability: An assertion: Parallelising serial codes will almost certainly fail. Decompose algorithm from 1st principles instead. #eesi
* "If you want an exascale initiative of relevance: you will need to invest big time in REdeveloping applications (new algorithms)" #eesi
* ... "you will also need to invest heavily in training, and a proper career path for scientific computing/computation ..." #eesi

I also chaired and reported on a breakout group on cross-cutting data issues. The breakout report is available as a [pdf](/assets/misc/2011-07-02-eesi_data_breakout.pdf). Although the turnout to this breakout session was relatively low, a couple of folks came up to be me afterwards, and bemoaned having to be in two places at once, and having to choose programmability as a (slightly) higher priority. This meeting confirmed to me, for once and for all, that nearly every scientific domain is struggling with big data handling, particularly adjacent to HPC!

There was also considerable discussion in our breakout group about software sustainability, a theme that was picked up the next day in the EPSRC strategic advisory team meeting on research infrastructure.

(Yes, I did get home from a lovely venue in Isle de France and go straight to Polaris House in Swindon the next day, you can imagine how the comparison felt.)

Nearly every meeting I go to makes the following point: Given that software is such a big and crucial part of research infrastructure nowadays the system is going to have to change:
* More professional software development and maintenance in academia, coupled with
* Better careers for those in software support (and software leadership) roles, and
* Sustained funding from research funders for codes which underpin the science community.

#### comments (2)

*[Nick Barnes](http://climatecode.org/) (on Saturday 02 July, 2011)*

Did you read Peter Kogge's article in IEEE Spectrum?  Can you comment on it?  Are we actually going to get to exaflops by 2015?

*Bryan (on Sunday 03 July, 2011)*

Hi Nick. Yes to the "I read it". I really have no idea when we will have something that nominally has exawhatever performance. But this I am pretty sure of: it'll be unusable for most of the scientific community if it occurs this side of 2020!
