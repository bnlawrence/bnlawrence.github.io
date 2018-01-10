---
layout: post
title: Service Descriptions
last_modified: Thursday 07 December, 2006
tags: ndg metadata computing
categories: computing

---
A little over six months ago, I introduced the thorny problem of [service binding]({% post_url oldblog/2006-05-19-service_binding %}) to my blog. Of course it hasn't gone away. Last week I gave a talk (see my the SEEGRID talk on my [talks](/static/talks) page) about "Grid-OGC collision" in which I made some specific statements, amongst which were:
<blockquote>At the moment WSDL2 is where we are investing our thinking time (ISO19119 is a meta-model for services rather than a SDL)
</blockquote>
<blockquote>GRID has more sophisticated service binding,  access control and authentication, workflow! The OGC community should not reinvent tooling!
</blockquote>

I also made a throw away comment about Service Description Languages along the lines of which "there's another one along every week", by which I meant that folk appear to keep getting pissed off with what's available and building their own cut down simpler SDLs.

This was all in the context of knowing that many in the OGC community sees the ebXML registry information model (ebRIM, [pdf](http://www.ebxml.org/specs/ebRIM.pdf)) [as a key part of the way forward](http://www.opengeospatial.org/standards/requests/29) for solving this sort of problem. (The reason why ebRIM is so attractive is that it allows independent description of services and metadata, with the associations in the ebRIM catalogue being used to produce late binding of what can be done to specific datasets. Of course using ebRIM only postpones the question of what is used to describe the services, and what associations are put in the system.)

Josh Lieberman called me on on those assertions, and asked me specifically to say exactly what the Grid community had that the OGC community should use! Of course I dissembled: one of the problems with being in my position is I know just enough to make assertions (and decisions) based on what I've read and heard (via the UK e-science community), but I make little attempt to remember the detail. 

Before I get going, I have to confess to some lazy use of the word grid in the context of the talk and this note. Frankly, what I really wanted to do in the talk I gave was to encourage the OGC community to avoid reinventing wheels, and when I said Grid, I really meant: "everyone who is not in the OGC community who are dealing with tightly coupled strongly typed systems and the semantics of their interoperation", that is I meant it in the cyberinfrastructure/e-science/research sense. I should also confess that not being part of the [OWS4](http://www.opengeospatial.org/projects/initiatives/ows-4) initiative also means that there are probably sections of the OGC community who would both agree with my position, and even better, have done something about it!

It turns out that [Josh already knows](http://www.w3.org/2005/04/FSWS/Submissions/48/GSWS_Position_Paper.html) about everything below, but I've persisted in writing it here, because a) it's a useful collection of links for me, and b) it might provoke some useful discussion, either now or at the inception of a future NDG project (if it happens) ... Flawed or not, this is where I am:
1. Ideally we have to put some sort of online resource service endpoint descriptions in our dataset metadata. In this context we can't rely on the RIM alone because the ISO19139 documents may be harvested and used elsewhere where the  RIM association content may not be available. 
1. From various corridor gossip I've heard that populating and interacting with ebRIM systems may be fiendishly hard.
1. Ideally we want service descriptions themselves to be independent of the dataset endpoint descriptions. 
1. If we believe in Service Orientated Architectures at all, then one of the reasons for doing it is to allow [orchestration](http://blogs.ittoolbox.com/eai/cto/archives/soaorchestration-5670).
1. Orchestration wont spring up ab initio, we need well-described services and things that humans can work with first!
1. The hardest part of service description is in producing a machine readable (and understandable) description of what the service does and what it's input and outputs are. 
1. The OGC community probably lead the world in strong-typing of complex data features (based on the concepts of ISO19101 and ISO19109). However, while the domain modelling in UML is quite mature (e.g. via the [HollowWorld](https://www.seegrid.csiro.au/twiki/bin/view/AppSchemas/HollowWorld)), and the serialisation of data objects [into GML](https://www.seegrid.csiro.au/twiki/bin/view/AppSchemas/UmlGml) is mature, the serialisation of feature interfaces has been [forgotten]({% post_url oldblog/2006-07-27-on_processing_affordance %}).
1. There have been [many attempts](http://hinchcliffe.org/archive/2005/05/10/215.aspx) at building web service description languages (too many to list), and even the odd (incomplete) attempt [to evaluate](http://hinchcliffe.org/archive/2005/05/26/250.aspx) some of them.
1. There are two types of coupling that we care about (tight/loose), and two types of typing (strong/weak) in the services we care about. I've introduced these [before]({% post_url oldblog/2006-12-01-no_silver_bullet_exists %}). Ideally we should be using something which can support services built around all four combinations.
1. In the case of tight coupling and strong typing, we can build sophisticated orchestration frameworks with real workflows. In this situation a human maybe able to build complex workflows without inspecting all the service details themselves simply by relying on tools. However, we need to remember that because the resulting service interfaces are likely to be quite brittle changing one service interface will result in the necessity to consider rebuilding all the client service interfaces!
1. In the case of loose coupling and weak typing, orchestration is more likely to be done by well informed humans since there is unlikely to be enough machine understandable information in the web service descriptions (however presented) to allow complex automatic detection of what is possible and allowed. (i.e mash-ups are great, but depend on humans to work out what is possible).
1. Many of us will be building services that belong in both camps, so being able to use the same tooling for both jobs would be helpful!
1. I can't find a description of the OGC GetCapabilities document which would allow one to construct any generic tooling which is not tightly bound to the 
service it describes (i.e. as far as I can tell the GetCapabilities document can only be consumed by something which already understands the service-type it is looking at).  Nonetheless, GetCapabilities does at least expose what data exists under a service (if it is a service which exposes data at all).
1. Even the OGC invented GetCapabilities expecting it would be replaced (page 10 of [04-016r3](http://portal.opengeospatial.org/modules/admin/license_agreement.php?suppressHeaders=0&amp;access_license_id=3&amp;target=http://portal.opengeospatial.org/files/index.php?artifact_id=6324)) :
<blockquote>A specific OWS Implementation Specification or implementation can provide additional
operation(s) returning service metadata for a server. Such operations can return service metadata using
different data structures and/or formats, such as WSDL or ebRIM. When such operation(s) have been
sufficiently specified and shown more useful, the OGC may decide to require those operation(s) instead of
the current GetCapabilities operation.
1. 
[WSDL2](http://www.w3.org/TR/wsdl20/) is a vast improvement on  WSDL1.1 in terms of support for the semantic description of data types. In particular, of relevance to the OGC community, the data types can be described by reference to external xml-schema ... i.e. we can use our GML application schema to constrain service types.
(Incidentally, the WSDL2 [primer](http://www.w3.org/TR/2006/CR-wsdl20-primer-20060327/) is one of the clearest documents I've found in terms of exposing what some of these things do!).
1. The grid community have been building clear concepts of how to build semantic descriptions of web services (e.g. [OWL-S](http://www.ai.sri.com/daml/services/owl-s/1.2/overview/) - see especially the [description](http://www.ai.sri.com/daml/services/owl-s/1.2/related.html) of the relationship between OWL-S and other web service description languages.) 
1. While there are a number of different ways of annotating wsdl2 to produce semantic descriptions of the services exposed (e.g. 
[SAWSDL](http://www.w3.org/TR/2006/WD-sawsdl-20060630/) and [WSDL-S](http://www.w3.org/Submission/WSDL-S/)), there are [already tools](http://lsdis.cs.uga.edu/projects/meteor-s/downloads/OnlineDoc/index.php?page=0) being developed to create and exploit them.
1. People have said really good things to me about SCUFL (Simple Conceptual Unfied Flow Language) and  [Taverna](http://www.omii.ac.uk/docs/3.2.0/user_guide/omii_release/sc_services/taverna/about_taverna.htm). I understand from the folks at Newcastle that they might not be applicable to the OGC services processes, but the key point is that folk find these sorts of tools useful in real workflows. 
Even if SCUFL/Taverna aren't appropriate, there is also some work being done with BPEL at [OMII](http://www.omii.ac.uk/downloads/project.jsp?projectid=45) which may be more relevant. It sounds like the  SAW-GEO project will be looking at this stuff in great detail, and I'm looking forward to their outputs.
1. We've built the concept of [affordance]({% post_url oldblog/2006-07-28-affording_interfaces %}) into our next version of [CSML](http://ndg.nerc.ac.uk/csml)[^1] However, we'll not be able to use those in service descriptions within the NDG2 project.
</blockquote>

So, what's next?

Of course not all web services are OGC web services, and that's especially true of us in the NDG. The best we will be able to do in the next few months is to provide human readable service descriptions within metadata documents. However, if we ever get to build an NDG3, choosing the right service description methodology will be crucial. We would expect to use WSDL2 and ebRIM, but are hopeful that simpler interfaces to ebRIM will be available by then.
[^1]:
which isn't visible at that link yet, but it will be in a month or so, you can see pre-release stuff at http://proj.badc.rl.ac.uk/ndg.


#### comments (1)

*[Jo Walsh](http://geodata.osgeo.org/) (on Thursday 22 March, 2007)*

Bryan, thankyou for sharing your research! I found this a great introduction to the state of the debate for those of us still on the ground floor, trying to work out good practise for geodata repository and search services, trying to figure out what acronyms are worth implementing, and watching the SOA aircastles form overhead...

  
