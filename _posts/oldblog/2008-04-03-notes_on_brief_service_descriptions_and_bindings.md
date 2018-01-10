---
layout: post
title: Notes on brief service descriptions and bindings
last_modified: Thursday 03 April, 2008
tags: ndg computing metadata iso19115
categories: computing
---
I'm coming late[^1] to a discussion about representing services in feeds and catalogues.
(See [Sean](http://zcologia.com/news/703/representing-ogc-services-in-atom-feeds/) and [Jeroen](http://www.ticheler.net/node/10), and especially Doug's commment on Seans' post.) I found these while trying to go back to an old post of Sean's (which I have yet to find) about REST and WPS, because I wanted to incorporate some of the ideas into a forthcoming [presentation](abstracts/2008/01/21/servicedescriptions). Anyway, a bit of retrospective googling lead me [here](http://groups.google.com/group/geo-web-rest/browse_thread/thread/c61df07908a6149c).

Now as it happens, in my own way, I was [asking the same question]({% post_url oldblog/2008-03-19-online_resources_in_iso19115_and_moles %}) just a few days ago. The fact that I was asking it in the context of ISO19115 obscured the semantics of the question, as indeed did most of the discussion linked above. (Actually asking it in the context of ISO19115 ought not have done so, because ISO19115 is a content standard not an implmentation standard, but that's a by-the-way).

Anyway returning to the question, this is in fact one of the major things behind my much longer [rant about service descriptions]({% post_url oldblog/2008-01-22-whither_service_descriptions %}). So much so that I fancy writing down my current train of thought. Sorry. You really don't have to read it ...

The problem is that catalogues (don't care what they are done in, Atom, ISOXXX or whatever), have list of datasets (entries or whatever if you have a different application). We want users to be able to select datasets and pass them off to a service client (e.g. Google Earth, a WMS based visualisation client or whatever). What we need to do is be able to flag for each dataset that it can support specific services ... which will vary on a dataset by dataset basis.

We have a bunch of choices of how to do this. For each dataset we can load in a bunch of endpoint addresses that specific services can exploit. This is what we currently do (where we potentially have some KMZ endpoints, some WMC endpoints, and a bunch of others). This scales horribly in many ways from a management point of view (add a new service, edit each and every metadata record ... and we have lots!).  We do this in the context of a DIF related_URL. If you looked at the XML you get to see stuff like this:
<pre>
&lt;Related_URL&gt;
 &lt;!-- Web Map Context URL is required by NERC Portals --&gt;
 &lt;Related_URL&gt;&lt;URL_Content_Type&gt;GET DATA &gt; WEB MAP CONTEXT&lt;/URL_Content_Type&gt;
 &lt;URL&gt;http://ourhost/ukcip_wms?request=GetContext&lt;/URL&gt;
&lt;/Related_URL&gt;
</pre>
To add a new service, we need to create one of these for each dataset for which it can operate on[^2]
, which will depend on lots of things, including the feature types of the data. Ideally of course we know the feature types of all the data, and so we can script the metadata mods ... but if we know that, then why don't we do late binding? (And automate the process by having service descriptions and data descriptions and let the associations themselves be discoverable (and renderable by the catalogue dynamically as users find things of interest.)

Well of course we're only crawling (in a software sense) towards adequate feature type descriptions, but the nirvana we want is real enough. But to do that we need some service descriptions ...

... which don't exist, so we have to solve the problem outlined in the first paragraph for the foreseeable future, in a wide variety of contexts (including ISO19115 based catalogues).

Now, back to the main point. For many reasons [ORE](http://www.openarchives.org/ore/) is becoming very interesting to us, and so it was great to see Sean [making the connection](http://groups.google.com/group/geo-web-rest/browse_thread/thread/c61df07908a6149c) (that I should have made). I like it so much I'm going to repeat his two examples here:

(Sean stuff follows):
<pre>
&lt;entry&gt; 
   &lt;title&gt;Some KML&lt;/title&gt; 
   &lt;link 
     rel="alternate" 
     type="application/vnd.google-earth.kml+xml" 
     href="..." 
     /&gt; 
   ... 
 &lt;/entry&gt; 
</pre>
Otherwise, you use rdf:type (ORE specifies that non-atom elements refer 
 to the linked resource, not to the entry): 
<pre>
&lt;entry&gt; 
   &lt;title&gt;Some Journal Article&lt;/title&gt; 
   &lt;link 
     rel="alternate" 
     type="text/xml" 
     href="..." 
     /&gt; 
   &lt;rdf:type&gt;http://purl.org/eprint/type/JournalArticle&lt;/rdf:type&gt; 
   ... 
 &lt;/entry&gt; 
</pre>
(Sean stuff concludes)

The point being that where standard resource type names (mime-types) exist, one can use them, and where they don't, one uses an RDF relationship. (Incidentally, I don't really see how this differs in semantic content than Stefan Tilkov's recent [proposals for decentralised media types](http://www.innoq.com/blog/st/2008/02/decentralizing_media_types.html), which got [less than enthusaistic reception](http://www.innoq.com/blog/st/2008/02/media_types.html) - even to the point of my not understanding why he thinks his proposal is semantically different from using RDF.)

In the context of MOLES and CSML we've been thus far using xlink to try and make these typed links (which answers yet another of Sean's [old questions](http://zcologia.com/news/501/are-gml-documents-hypermedia/): yes, us). We've got so far with it that Andrew Woolf has an OGC best practice recommendation on how to use xlink in this context. I strongly believe that typed links are crucial to our data and metadata systems, but I'm less convinced by xlink ... (yeah, we can build tools to navigate using it, but will our best practice paper disappear into the ether?)

So let's step away from it all and ask questions about the semantics. And when we do that, I expect to come back to both ORE-like concepts and RESTful ones ...

If I start with a dataset with a uri, I can consider a few things:
* I can have a resource available which provides a description of the dataset in a variety of different syntaxes (e.g. the raw XML for GML:CSML and/or MOLES, and html versions of either or both),
* I can have a bunch of bound-up service+dataset uris which show "summary" visualisations of the data (logos, quicklook aka thumbnail images etc),
* I can have a service+dataset uri which exposes a human navigable tool to subset/download/visualise or whatever the dataset (i.e. a service which does something to the dataset, but in the first instance what you get back is html which is NOT a representation of the dataset itself, and
* I can have a naked service endpoint which when I go there, can expose something about the dataset (but maybe exposes multiple other datasets as well).

In both of the last cases, it might be possible to automatically construct a uri to a resource which did represent some property of the dataset given the starting endpoint URI.
Ideally that's what you get when you use standardised services ... In this latter case it ought to be possible to construct a RESTful URI in the end, even if the service itself wasn't particularly RESTful (e.g. WMS and WCS).

Now all of the above are really aggregations which brings me back to ORE.

I had better stop now. Conclusions can wait.
[^1]: I lost contact from the world for most of March. One day I'll explain why here. Some will know.

[^2]: This example also shows the situation we're in of having to have a different WMS endpoint for each dataset ... the way WMS works with getCapabilities doesn't scale to us having one WMS endpoint for all our data.
