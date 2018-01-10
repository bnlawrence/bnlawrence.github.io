---
layout: post
title: RDF software stacks.
last_modified: Thursday 08 May, 2008
tags: metadata ndg badc metafor
categories: computing
---
So we want an RDF triple store with all the trimmings!

We're running postgres as our preferred RDB. We've got some experience with Tomcat as a java service container. We prefer python in a pylons stack and from scripts as our interface layers (ideally we don't want to programme our applications in Java [^1]).

There appear to be four[^2] candidate technologies to consider as part (or all of) our stack: [Jena](http://jena.sourceforge.net/documentation.html), [Sesame](http://www.openrdf.org/publications/sesame/users/index.html), [RDFLib](http://RDFLib.net/), and [RDFAlchemy](http://openvest.com/trac/wiki/RDFAlchemy). The former two provide java interfaces to persistance stores, and both support postgres in the backend. RDFLib provides a python interface to a persistance store, but might not support postgres. RDFAlchemy provides a python interface to support RDFLib, Sesame via both the http interface and a [SPARQL](http://www.w3.org/TR/rdf-sparql-query/) endpoint, and Jena via the same SPARQL endpoint (and underlying [Joseki](http://www.joseki.org/) implementation).

Would using postgres as our backend database perform well enough? Our good friend Katie Portwin (and colleague) [think so](http://xtech06.usefulinc.com/schedule/paper/18).

There appear to be three different persistance formats insofar as RDFLib, Jena and Sesame layout their RDF content in a different way. Even within Java there is [no consistent API](http://users.ecs.soton.ac.uk/wf/jsm.htm):
<blockquote>Currently, Jena and Sesame are the two most popular implementations for RDF store. Because there is no RDF API specification accepted by the Java community, Programmers use either Jena API or Sesame API to publish, inquire, and reason over RDF triples. Thus the resulted RDF application source code is tightly coupled with either Jena or Sesame API.
</blockquote>

Are there any (recent) data which compare the performance of the three persistence formats and their API service stacks? It doesn't look like it, but I think we can conclude that either Jena or Sesame will perform OK, and I suspect RDFLib will too. Which of these provide the most flexibility into the future? Well, there are solutions to the interface problem on the Java side: Weijian Fang's [Jena Sesame Model](http://sourceforge.net/projects/jenasesamemodel/) which provides access to a Sesame repository through the Jena API, and the [Sesame-Jena Adaptor](http://sjadapter.sourceforge.net/); and clearly from a python perspective RDFAlchemy is designed to hide all the API and persistence variability from the interface developer. I think if we went down the RDFLib route we'd either be stuck with python all the way down (not normally a problem), or we'd have to use it's SPARQL interface.

I have slight reservations about RDFAlchemy in that the [relevant google group](http://groups.google.com/group/rdfalchemy-dev) only has 14 members (including me), and appears to be in a phase of punctuated equilibrium as development revolves around one bloke. 

Conclusions: if we went down postgres &gt; tomcat(sesame) -&gt; RDFAlchemy we'd be able to upgrade our interface layers if RDFAlchemy died by plugging in something based on [pysesame](http://pysesame.projects.semwebcentral.org/) and/or some bespoke python sparql implementation (it's been [done](http://ivanherman.wordpress.com/2007/07/06/sparql-endpoint-interface-to-python/), so we could use it, or build it. Others have [built their own pylons thin layers](http://www.mail-archive.com/pylons-discuss@googlegroups.com/msg03712.html) to sesame too). We'd obviously be able to change our backends rather easily too in this situation. (Meanwhile, I intend to play with RDFlib in the interest of learning about manipulating RDFa.)

Link of the day: [State of the Semantic Web, March 2008](http://www.w3.org/2008/Talks/0307-Tokyo-IH/).
[^1]: this isn't about language wars, this is about who we available to do work

[^2]: obviously there are others, but these standout given our criteria
