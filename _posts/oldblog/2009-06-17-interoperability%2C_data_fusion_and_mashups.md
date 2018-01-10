---
layout: post
title: Interoperability, Data Fusion and Mashups
last_modified: Wednesday 17 June, 2009
tags: curation ndg
categories: computing
---
I'm involved in the development and implementation of a new NERC information strategy, and it's quite clear that amongst those of us developing the strategy, and amongst those making decisions in response to the strategy, there is a clear lack of agreement and/or understanding what the following three terms mean: interoperability, mashups, and data fusion. Some folk use them interchangably, some use them with specific activities in mind. Confusion about definition always  [leads to slower progress]({% post_url oldblog/2004-12-22-VerifyableStatements %}).

So here are my working definitions:

####  Interoperability  

Some Generic Answers
* From the [Princeton Wordnet](http://wordnet.princeton.edu/perl/webwn): The ability to exchange and use information
* From [Wikipedia](http://en.wikipedia.org/wiki/Interoperability): A property referring to the ability of diverse systems and organizations to work together 
* From the [Digital Television Glosssary](http://michigandtv.com/glossary)(!): Interoperability refers to the ability of a system or a product to work with other systems or products *without special effort* on the part of the customer... (my italics).

Getting more specific:
* From the [Software Engineering Institute](http://www.sei.cmu.edu/opensystems/glossary.html): The capability of two or more components or component implementations to interact.

The ability to exchange and use information requires: 1. Tools to exchange information (and the ability to use those tools). Where those tools consist of systems that integrate
information from a variety of systems, *without special effort*, then we can talk about *service interoperability*.1. The ability to interpret and use the information when it is acquired. When that use involves integrating information from disparate sources, we want *data interoperability* - that is, we want to be able to integrate the data/information to a common format/view *without special effort*. This last requires a range of activities:     1. Standardised formats     1. Standardised metadata structures, and     1. Standardised (controlled) vocabularies, with     1. Ontologies to mediate between community standard vocabularies.

It's important to reiterate that interoperability is nothing more than the ability to do something quickly and easily without *special effort* by the user, it generally doesn't involve the doing of something that otherwise couldn't be done. What it does do is:1. Enable the doing of something that wouldn't otherwise be done because it's too much effort (e.g. a wider spectrum of hypothesis testing), and/or1. Provide efficiencies of scale, if a task needs to be done many times (by different communities or users), then it obviates the necessity for the development of specific solutions by each community/user (thus saving in time and cost). 

Practical uses of interoperable services include providing both "quick look" visualisation and sophisticated graphics, with relatively little effort by the consumer, data manipulation services, and a host of other useful tools for the scientific toolbox.

####  Mashups  

The "WikiWorld" offers us two definitions for this:
* [Wiktionary](http://en.wiktionary.org/wiki/mashup) offers us: A derivative work consisting of two pieces of (generally digital) media conjoined together, such as a video clip with a different soundtrack applied for humorous effect, or a digital map overlaid with user-supplied data.
* [Wikipedia](http://en.wikipedia.org/wiki/Mashup_(web_application_hybrid)) itself gives us: Mashup (web application hybrid), a web application that combines data and/or functionality from more than one source

There's a clear implication that a mashup is generally a temporary construct, and in the context of our data/information strategy, the place of mashups is in the construction of maps/views which show the spatial relationships between different data/information entities. I would argue that such mashups are generally done as part of hypothesis testing of the sort "is there are a spatial relationship between these two quantities worth pursuing?" or "what data/information is available in the neighbourhood of this spatial feature?"

Of course to deliver mashups we have to have interoperable services capable of providing views of data in (or on) a common visualisation paradigm (e.g. a map) (Almost by definition, a mashup occurs because of the use of interoperable services, while you might achieve the same result - map or whatever - via a different technique, it wouldn't be a mashup without the underlying assumption that it was delivered via interoperable web services.)

####  Data Fusion  

The WikiWorld provides a set of useful starting definitions for data fusion too:
* [Wiktionary](http://en.wiktionary.org/wiki/data_fusion): Set of methodologies for fusing information coming from different, and sometimes non homogeneous, sources. The result of fusion is a qualitatively different knowledge always referred to a context.

* [Wikipedia](http://en.wikipedia.org/wiki/Data_fusion): The use of techniques that combine data from multiple sources and gather that information in order to achieve inferences, which will be more efficient and potentially more accurate than if they were achieved by means of a single source ... combines several sources of raw data to produce new raw data. The expectation is that fused data is more informative and synthetic than the original inputs.

It's clear that data fusion is a more mature activity than a mashup: the expectation is that data fusion results in a product, and that the product is "more informative" than the individual constituents. One might be tempted to suggest that a data fusion product is more than the sum of it's parts! 

Another point of distinction between data fusion and mashups are that the latter are done "geospatially", data fusion can occur along any useful axis of the resulting data object (e.g. time, wavelength etc).

It's also clear that data fusion doesn't *require* service interoperability, nor does it *require* data interoperability, but it's absolutely true that delivering data fusion is easier with data in common formats, described in a common manner (data interoperability). It's also absolutely true that data fusion possibilities can be explored more quickly by using interoperable services.

###  Putting all that together 

I spelt out my world view of the scientific method in a previous [post]({% post_url oldblog/2009-04-16-scientific_method %}). Nearly every one of those steps can be enhanced by one or more of the facilities outlined above: 
1. Background research involves evaluating existing data (how, by, obtaining, visualising and comparing. Mashups, and interoperable visualisation services facilitate this process).1. Constructing hypothesis may involve the evaluation of mashups, data fusion activities and visualisations.1. The creation of new data may involve the fusion of existing data just as much as it might include new observations and/or simulations1. Analysis of results includes the comparison of new data with old data (interoperability) and 1. Archiving data should involve the creation of interoperable data.1. Reports should involve interoperable data,1. and the annotation of data should involve interoperable tooling.

So put simply, the NERC information strategy needs to improve ones' ability to carry out data and information processes at all the steps in the scientific method. However, if one was to pull out the real game breaker here, I would argue that the interoperable, mashable, fuse-able spectrum improves ones ability to a) answer "what if?" questions with relatively little effort, and b) carry out data fusion, faster, with less effort, and hopefully (because of better metadata) with better provenance associated with more accurate results.

Of course, we'll only ever know whether those last steps did result in better scientific outcomes, and if our investment in more interoperability was worth it, when we can see the ultimate scientific metric: dataset citation!
