---
layout: post
title: More on citation - part one, ashoe
last_modified: Friday 26 October, 2007
tags: curation claddier metadata
categories: computing
---
We've just been having an interesting conversation about the citation of datasets in the context of [claddier](/tags/claddier). I think I've got the use of we and I correct in what follows to indicate what I think as opposed to what we discussed and agreed ...

I've wittered on about this [before](blog/2005/12/22/data_citation), where I considered six issues. Today we discussed two things: how we might cite some specific BADC datasets and we came up with some examples, which led to; how we distinguish between datasets we hold on someone else's behalf, rather like a library, and those which we publish ourselves.

So, we were considering two of our datasets: one, the MST radar [data](http://badc.nerc.ac.uk/data/mst/), and the ASHOE mission [data](http://badc.nerc.ac.uk/data/ashoe/) (which I was a participant in, hence my choosing it as an example).

The latter dataset is essentially an online copy of a CD which we obtained from NASA, and so while we host it online for the UK academic community, we are certainly not the publishers. The former is a dataset which we hold as the primary dataset for NERC, who require us to make it available. In neither case have we done anything ourselves to allow me to feel comfortable with the grandiose phrase that "*we publish it*" (indeed, in the former case I feel quite uncomfortable with that concept).

So how do we expect folk to cite these datasets? Here, I'm going to discuss the ashoe dataset alone. The ashoe CD is essentially a compilation of data from a bunch of principal investigators. The compilation was produced by Gaines and Hipskind, so I think this should be dealt with by treating it like an anthology. So that's the authors (or creators) dealt with.

Following the U.S. National Library for Medicine Recommended Formats for Bibliographic Citation[^1]([pdf](http://www.nlm.nih.gov/pubs/formats/internet.pdf)), we have:<blockquote>Gaines and Hipskind, The Airborne Southern Hemisphere Ozone Experiment; and Measurements for Assessing the Effects of Stratospheric Aircraft (ASHOE/MAESA) CDROM [Internet], Nasa Ames Research Centre, Earth Science Project Archives, c1994 [cited September 21, 2006] Available from http://badc.nerc.ac.uk/data/ashoe/
</blockquote>

Now the real data is actually at the  [Earth Science Project Office Archive](http://espoarchive.nasa.gov/archive/arcs/ashoe/) but note that this is an updated version of the data (I think, the file dates seem to indicate this) from that on the cdrom, which is described [online](http://cloud1.arc.nasa.gov/ashoe_maesa/project/cdrom.html).  (I think this means we should add the new data to our archive as well ... but that's an issue for another day).

Anyway this shows several issues
* The date of the data is actually unknown (at least in the public information I found, without rooting around too hard). One can't rely on the filesystem time ...
* Why should folk indicate that they found it our site, when strictly the ESPO themselves"published" it online? I would argue there are three possible reasons why this is a good idea, which might or might not apply:
    * One knows the original version is no longer online (as appears to be the case here).
    * One knows that the original online version is somewhat more ephemeral and the place where you are **using** the citation cares about this issue (e.g. the American Geophysical Union at one time only allowed citation of datasets in registered repositories[^2](http://www.geoinfo.org/TFGeosciData.htm), **Update, 22nd Sep**, the current version is [here](http://www.agu.org/pubs/data_policy.html) ... NB: BADC *has* been *approved* by AGU.]
    * With data, I think there is always some risk that the version of data you downloaded from one place will be different from that downloaded from somewhere else (it has certainly happened that we have hosted corrupted versions of data that were non-trivial to identify [^3]). Now this might argue to always going back to the original source before conducting the analysis which results in the citation, and *if possible* that's the best idea, but again, with data, that may not be possible for reasons of volume, bandwidth, or server capacity of whatever. I think it best then to indicate which version you used by indicating where it came from, and the download date.

Having said all that, there is a way forward. Going back to the actual citation, I don't much like it, nor do I like much else I've seen. So here's what I think we should do: I think the "cited" should be "obtained on" for data, and it should follow the available at, so better would be:<blockquote>Gaines and Hipskind, The Airborne Southern Hemisphere Ozone Experiment; and Measurements for Assessing the Effects of Stratospheric Aircraft (ASHOE/MAESA) CDROM [Internet], Nasa Ames Research Centre, Earth Science Project Archives, c1994  [Available from http://badc.nerc.ac.uk/data/ashoe/, obtained on September 21, 2006]
</blockquote>

In our discussions today we pushed on to thinking about the ESPO version as the data equivalent of a NASA Tech Note document, and in our discussion of versioning decided it would be best if an identifier which had meaning to the publisher (ESPO) was also included (to deal with, for example, versioning). Now [arguably](http://norman.walsh.name/2006/09/05/identifiers) that might be the original http uri but it could be anything with meaning to the publisher.
In this case we only have the http url, so we could have:
<blockquote>Gaines and Hipskind, The Airborne Southern Hemisphere Ozone Experiment; and Measurements for Assessing the Effects of Stratospheric Aircraft (ASHOE/MAESA) CDROM [Internet], Nasa Ames Research Centre, Earth Science Project Archives, c1994, urn http://cloud1.arc.nasa.gov/ashoe_maesa/project/cdrom.html  [Available from http://badc.nerc.ac.uk/data/ashoe/, obtained on September 21, 2006]
</blockquote>

Note that I'm implying that I want to use a urn which has meaning to the original publisher if I can, which means ideally data publishers should publish the base source citation urn for their datasets to help get this right.  If the base urn is in fact a uri or url, then the original site attribution has magically appeared if that's what the publisher wants.

What I mean by base source, and all the other hanging threads will have to wait for another time.

Update (26/10/07):  The NLM's Recommended Formats for Bibliographic
Citation has been updated, and the new revision is available [here](http://www.nlm.nih.gov/citingmedicine). I have yet to check whether the revision has any implications for our citation format!

[^1]: Thanks to Chris in comments to my original blog entry.

[^2]: An early version of their data policy appears [here

[^3]: And regrettably you can't always tell this from our metadata, we really have to do better!


#### trackbacks (1)
*[Citation, Hosting and Publication](http://home.badc.rl.ac.uk/lawrence/blog/2006/10/20/citation_hosting_and_publication) (from "Bryan's Blog" on (on Friday 20 October, 2006)*)Returning to my series on citation (parts one, two, and three).

My last example was an MST data set held at the BADC, and I was suggesting something like this (for a citation) ...

#### comments (1)
*Bryan (on Friday 22 September, 2006)*
Actually, I think I've got the date thing wrong. c1994 implies that the copyright was 1994. This may well be right, but we don't know. Probably best to put [date unknown] as recommended by the NLM.
