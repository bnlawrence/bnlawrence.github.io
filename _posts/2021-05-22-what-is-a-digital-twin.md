---
layout: post
title: What is a digital twin?
last_modified:
categories: computing
tags:  modelling_futures climate
excerpt_separator:
image: assets/images/2021-05-22-digital-earth.png
---

There is a lot of talk about "digital twins", so my first question was: "what is a digital twin?"

Google says:

>“A digital twin is a digital representation of a physical object, process or service. ... A digital twin is, in essence, a computer program that uses real world data to create simulations that can predict how a product or process will perform.”

You would be forgiven for thinking that sounds rather like what we call a model!

[Destination Earth](https://digital-strategy.ec.europa.eu/en/library/destination-earth) defines a digital twins as
    
 >“mirrors of reality, simulators that replicate reality constrained by real time data.”

You would be forgiven for thinking that sounds like models with [data assimilation](https://research.reading.ac.uk/met-darc/aboutus/what-is-data-assimilation/).

The weather and climate community have been doing digital twins for a long time! But something has changed. There are two new initiatives to produce something in the weather and climate community that is different than has gone on before. These seem to share some key characteristics that are intended to distinguish (weather and climate) digital twins from "normal" models:

1. Much more realism with more use of data, and 
2. Full integration for policy and response models, with
3. Open and interactive access to the data and workflows to support "non-expert" access and intervention (!)

The two initiatives I know about are:

1. The European Commission's major project : [Destination Earth]((https://digital-strategy.ec.europa.eu/en/library/destination-earth)), which in the short term is going to deliver two twins of relevance to what I think about:
   1. An "extremes" digital twin, aiming at very high resolution global modelling, and 
   2. A "climate" digital twin, which is aiming at supporting much interaction with the impacts community.
2. The World Climate Research Programme's "[lighthouse activities](https://www.wcrp-climate.org/lha-overview)" include a project on "Digital Earths" ([pdf](https://www.wcrp-climate.org/images/documents/WCRP_Implementation_Plan/Digital%20Earths.pdf)).
    1. The aim here is to develop some international coordination on how to work together on these things. The WCRP will not itself build things, but encourage cooperation and international standards and conventions so that twins can interoperate (e.g one regional digital earth can be run with different global digital earths).

So I've been trying to put together my view of what these things are, and how they are linked with each other and existing activities. As I think in pictures, and have a fondness for [UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language)[^fn1], this is my perspective:

{% include image.html url="/assets/images/2021-05-22-digital-earth.png" caption="UML describing the relationship between conventional ESM models and digital twins"  width="600" align="center" %}

As this is UML the types of arrows are meaningful:
1. (For our purposes) A Digital Twin is built around an existing Earth System Model (NWP or climate) and is architected to support co-running [^fn2] of one to many downstream models which are forced by or interrogates the parent ESM model.
2. The DestinE system will be ("is-a") digital twin.
3. The WCRP Digital Earths will be ("is-a") digital twin.
4. The WCRP Digital Earths may come in two flavours, regional and global, which will have to interoperate.

The WCRP digital earth will likely deliver a white paper later this year. DestinE will kick off later this year. It is a moot point as to whether they will have the same vision. I hope so. But whatever happens, there will be some iteration of objectives.

One key part of the iteration will be managing expectations. The rhetoric around notions of "non-expert interaction" and multitudes of interacting models needs to be ratcheted down. There is real scope to do something new and very useful, there is also scope to massively annoy people by not doing what appears to have been promised.


[^fn1]: Yes, I know I'm a wierdo, and yes, UML was invented to describe software, but a key part of UML is used to describe objects, their attributes, and their relationships. UML can be used very effectively to describe the real world as well as software. 

[^fn2]: I have some thoughts about what this might actually mean which may appear here soon. Or not. I never can tell whether I can sustain an urge to blog in the face of the management deluge.

