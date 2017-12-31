---
layout: post
title: Bryan's Fishy Example
last_modified: Thursday 16 July, 2009
tags: curation
categories: computing
---
I've had a few days lately where I've trotted out my favourite "easy to understand example" as to why some scientific datasets need to be preserved, and some do not. In the final analysis, we find that it's easy to identify some datasets as "must preserve" and then we enter "value judgement" territory. But it's helpful to have a strawman to consider on the way.

With apologies to those of an aquatic bent, I like to pick on fish.

Imagine that I make a series of complex measurements of the anatomy of my favourite fish using my equally favourite instruments. I publish those measurements. Should those data be actively managed for posterity by some third parties (other than me)?

Well, I would answer no, with a couple of caveats we'll get to. For a start, someone else could wheel out their favourite instruments and make the same measurements on another example of the species[^1]. This of course assumes a) there are enough of them around that more can be found, and b) they're easily accessible (eg. not at the bottom of the Mariana trench). If either of those assumptions are broken, then maybe my measurements might be nearly as important as I think they are (like all scientists my natural assumption is that any measurement I make must be *really* important). We'd better also add the caveat that if we can predict the usefulness of these data in some composite study, then we might want to have it managed too ...

On the other hand, if I made measurements of the number of this fish in some geographical region, that measurement can be repeated for sure, but it will be at a different time, and the time sequence will in and of itself be another interesting measurement. So by default, in this case my (original) data will be (or could be, there are few guarantees in this game) of use in some future study.

Clearly the difference between these two cases (sans caveats) is that in first instance, I was making a measurement that was repeatable (and the likelihood is that the repetition would be in the future with better, stronger, faster instruments). There is no intrinsic interest in joining those two sets of data (my original and the later better) to build a newer more useful dataset. Nor, I presume, is it likely that my numbers will form an input into some later calculations. In the second instance, it's obvious that my data could form part of a useful composite dataset, and it's obvious from the moment I made the measurements.

So, now let's abstract that a little bit. We have two sets of data:1. typeB: immediately and obviously of potential interest in the future, and1. typeA: not obviously a candidate for future composite analysis.

Given we (humanity) have a finite resources for data management, it's a no brainer: we manage typeB, and consider typeA for a bit longer.

typeB was easy, but for typeA we have a few things to think about. We've got our caveats:
* If it's likely because of rarity or difficulty in obtaining samples, that the typeA measurement can't be repeated: Manage it. If not, ask the next set of questions:
* Is it likely that some sort of composite dataset will be constructed using my data (perhaps we can foresee the necessity to build the statistics of these anatomical measurements across the population)?  The keyword here is *likely* and it has to be weighed up against the difficulty, expense,  and likelihood of repeating the measurement. So here we are in value judgement territory.

Some of these value judgements are obvious, some are less so, but at the end of the day it's pretty hard to set up a hard and fast set of rules. So it's a continuum: at one end, we just make a rule, manage that type of data (e.g. gene sequences), at the other we decide not to bother (simulation sensitivity analyses). In between, we dither. For the "not to bother" stuff we shouldn't do nothing though: that material is suitable for personal data management.

What? Personal data management? Has Bryan been snorting something naughty? (Editor: no).

None of the above considers the issue of "preserving the scientific record". Regular readers will know that I consider that a pretty important issue, and one that also leads to an argument about keeping data. However, I think much of the typeA data above is more like the lab book you (should) keep: it should exist in your possession for some period (years) after you publish the data, but at the end of the day, it doesn't really need to persist. In this case, the scientific record will get on just fine without the numbers. TypeB data, though, we need to keep it, not for my sake, but for all our sakes.

Before we leave this example though, for completeness, we should consider one more issue. If, when I made my anatomical measurements, I tagged them with the geographical location from where I nicked my species examplar, then I'm vastly increasing the chances of my data being useful in some environmental application.  So the lesson there is, the more complete my metadata is, the more likely my data is to become typeB and an obvious candidate for future use.
Now, when we get data citation working, it also becomes a candidate for citation independent of the paper I wrote about my fish. Collect and write that metadata. You will get the credit one day!

[^1]: I wish I had a Latin bent, if I did, I'd have made up a suitably silly name with some hidden or not so hidden joke.


#### comments (2)

*Chris Rusbridge (on Sunday 19 July, 2009)*
David Shotton talks a bit about universals versus particulars. Most natural world beings (zebras, fish) are particulars. They differ, but as you say there needs to be something about them to make the measurements worth keeping. A database of all the zebra bottoms in Africa is interesting (zebra bottom patterns differ and identify individuals) with date and location is really useful. One zebra bottom is not.

Genes, chemicals, reactions, physical properties etc are universals. Within limits of accuracy (which can improve), once measured and recorded, they don't necessarily need to be measured and recorded much more. (Against this, the Chemspider people regard all such measurements as assertions, and given the number of potential issues in experiments, they like to see a significant number of cases with provenance.)

Anyway, maybe your example mixes up universals and particulars? Someone else later can't measure the same fish...

*Bryan (on Wednesday 22 July, 2009)*
Thanks for this Chris, it's all about terminology, and I think David's terminology is pretty useful ... I'll chase up his work!
