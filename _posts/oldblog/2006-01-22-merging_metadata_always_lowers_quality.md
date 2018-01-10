---
layout: post
title: Merging Metadata Always Lowers Quality
last_modified: Sunday 22 January, 2006
tags: ndg metadata curation
categories: computing
---
I just found [Stefano Mazzocchi's Blog](http://www.betaversion.org/~stefano/linotype/) via [Dare Obasanjo](http://www.25hoursaday.com/weblog/).  It looks like Stefano doesn't blog very frequently, but what he does write is well worth reading. His [latest](http://www.betaversion.org/~stefano/linotype/news/95/), entitled 
"On the quality of Metadata" makes the assertion that <blockquote>merging two (or more) datasets with high quality metadata results in a new dataset with much lower quality metadata. 
</blockquote>

He goes on<blockquote>The "measure" of this quality is just subjective and perceptual, but it's a constant thing: everytime we showed this to people that cared about the data more than the software we were writing, they could not understand why we were so excited about such a system, where clearly the data was so much poorer than what they were expecting.
</blockquote>

Hmmm. Then he gives an example, which is probably best summarised from Dares' blog as<blockquote>being able to say that two items are semantically identical (i.e. an artist field in dataset A is the same as the 'band name' field in dataset B) doesn't mean you won't have to do some syntactic mapping as well (i.e. alter artist names of the form "ArtistName, The" to "The ArtistName") if you want an accurate mapping.
</blockquote>

and the latter is often just hard. Stefano goes on to say to do this
<blockquote>you need to further link your metadata references "The Beatles" or "Beatles, The" to a common, hopefully globally unique identifier. 
</blockquote>

before you can reliably do this, and to do this, you're essentially appealing to higher order metadata construct (the one that maps these artists onto a global uri). In fact, Stefano covers some of this in [an earlier post](http://www.betaversion.org/~stefano/linotype/news/85/):<blockquote>The problem is rather simple, really: words are not unique identifiers for concepts. Everybody knows this very well: synonyms exist in every language. So, all you need to start is to create unique identifiers for your tags, but if you don't do it well enough, it doesn't scale globally.
</blockquote>

Well, that's the same as saying that as much as possible, you want to exploit controlled vocabularies within your semantic tags ... which is why we put so much effort into it.

(Actually, as an aside, the [older post](http://www.betaversion.org/~stefano/linotype/news/85/) has a really interesting idea about how to avoid using common denominator controlled vocabularies and still end up with agreed definitions starting from different tags. He says he's implemented something based on it ... one day I think I should chase that up).