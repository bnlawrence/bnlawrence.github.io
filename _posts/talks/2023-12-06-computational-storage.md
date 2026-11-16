---
title: UK Lustre Users Group
location: Manchester
layout: talk
categories: talks
tags:  HPC exascale storage excalibur
talks: 
    - The ExcaliData Implementation of Active Storage. An opportunity for Lustre?
when: 06 December, 2023
image: /assets/images/2023-12-06-chunking.svg 
---

In this keynote talk I introduced the work we have been doing on active storage (also known as computational storage) as part of the ExcaliData projects within Excalibur (the UK exascale software readiness [programme](https://excalibur.ac.uk)).

<span class="presentation-link">Presentation: [pdf](/assets/talks/2023-12-06-Computational-for-UKLUG.pdf) (5.3 MB)</span>

I started with why I was there - as a climate scientist (albeit one who worries about the necessary [underlying infrastructure]({% link _posts/talks/2023-06-23-what-lies-beneath.md %})) at a storage meeting. The reason being that co-design of our computing systems extends way beyond codes and compute engines! Which of course is why ExcaliData exists, as an excalibur cross-cutting activity to support a range of exascale exadata problems. So we began with some "climate science makes lot of numbers" slides, the point of which being that "we make lots of numbers then we have to do stuff with them".

The concept of active storage, that is storage that can do calculations, is an old one, but our innovation here is to limit those calculations to reductions (and any necessary decompresssion of data that has already been compressed at write-time). By limiting ourselves to reductions (a la MPI) we can push the knowledge of when to do those reductions in storage into task scheduling middleware - in our case, Dask.  With some minor modifications to the Dask graph, the application can be completely unchanged, but take advantage of storage based reductions if they are available (and they make sense).

We currently modify the Dask graph in [cf-python](https://ncas-cms.github.io/cf-python/) - but it would be better to do it directly in Dask. We don't do that yet because we want to have some active storage implementations in the wild so that the Dask maintainers will see this as a beneficial capability.

We currently have one fully featured implementation as S3 middleware, allowing a server adjacent to S3 storage to do the reductions (using [reductionist](https://github.com/stackhpc/reductionist-rs) by StackHPC) - and one prototype implementation in a POSIX file system (DDN's Infinia).

Extending this to more POSIX environments is why I was happy to accept the invite to talk to UKLUG --- and so I included some discussion about issues around implementing support in Lustre.

It turns out the hard part of doing this is recognising that most of our data is chunked, and so reductions on arrays known to the application turn out to be partial reductions on storage chunks which are then reduced further up the stack. Given each chunk may have missing data, may be compresssed and/or filtered, and we probably only want some of it, we need a carefully constructed API.

Getting Lustre to support that API is a necessary condition for active storage, but there are others which are discussed in the talk.

