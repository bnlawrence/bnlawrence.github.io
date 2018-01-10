---
layout: post
title: Online Resources in ISO19115 and MOLES
last_modified: Wednesday 19 March, 2008
tags: ndg metadata iso19115 moles
categories: computing
---
ISO19115 is a brave attempt to classify metadata. I think some aspects of it are fatally flawed in an RDF world, but some are not, 
and we're likely to support it for some time to come. But, let's face it, ISO19115 isn't all inclusive, so
how do we reference external information? This posting is all questions. Hopefully tomorrow I'll provide answers!

The [NASA DIF](http://gcmd.gsfc.nasa.gov/User/difguide/difman.html) does this via the related_url keyword, which has three attributes: a textural description, the url itself, and
a content_type from a controlled vocabulary. The related_url simply exists as a first order child of a DIF document.

In ISO19115 we need to use the CI_OnlineResource (Figure A.16). We find it has attributes of linkage (url), protocol, applicationProfile, name, description (all character strings), and function, which is drawn from an enumeration CI_OnLineFunctionCode. The latter has download, information, offlineAccess, order and search as values.

Clearly this codeList can and should be extended. However questions remain: 
1. Is this the right way to do it, and
1. How should we use CI_OnlineResource anyway? 
1. What about services then?

####  1. Extending the CodeLists  

Option one is to extend the CI_OnlineFunctionCode codeList. Ted Haberman
on the metadata list[^1] suggested extending it with the GCMD controlled vocabulary[^2](http://gcmd.gsfc.nasa.gov/Resources/valids/url_type.html) - but note that GCMD and version control don't get on, we prefer our version controlled lists, eg. [this one](http://vocab.ndg.nerc.ac.uk/list/P201/1)] which is of course what I initially thought.

John Hockaday replied with a suggestion about using the protocol attribute, and inserting a codeList there (and suggested that GCMD should have their own codeLists available - but given their aversion to public version control, we wouldn't rely on that). Also, I'm not so sure that simply using the GCMD codelist in either place is right, because the GCMD valids for the related_url mix the semantics of services and urls, even if they do have a sensible list, and the protocol is probably more about things like ftp and http than what we layer over either. I'm also concerned that we include the semantics to support an external online [bibliographic citation]({% post_url oldblog/2006-01-20-bibliographic_references_iso19115_and_numsim %}).

I once posted a query about this to the metadata list that got no reaction. 

####  2. How do we actually use CI_OnlineResource anyway?  

There are multiple places:
1. The online resource which is the best place to download the data itself. That's via MD_Metadata&gt;MD_Distribution&gt;MD_DigitalTransferOptions which has
an attribute of onLine which can have 0..* multiplicity. Arguably we can add services there too [^3]
1. For bibliographic citations from the data to documentation in scientific papers, we could use something in LI_Lineage.
1. For citations from papers to the datasets it's not so obvious.
1. Links to metadata extension information via MD_MetadataExtensionInformation which has an attribute of extensionOnlineResource.

The latter is what brought me to this. In MOLES we want to have links between the various entities and between MOLES documents
and other documents (particularly NumSim and SensorML documents, i.e. documents which describe productionTools). (In truth, the relationships we want to encode would be far more sensibly serialised in RDF than XML Schema.)  We also want
to have entities we call data granules which are part of data entities and we expect those data granules to each individually
have different services available [^4]. 

####  3. Services  

Our problem is that we don't want the data granules independently discoverable for fear of overwhelming search engines (including our own), but we might want to expose in an overarching metadata document for the data entity that services of a particular class exist. 
The problem is that we might want this in two different syntaxes: a browser should be able to produce something consumable by a human (VIEW EXTENDED METADATA) and a service client might want simply to obtain a list of granules with names, service types, and service adddresses. Of course we could handle this by having the latter accessible via cunning use of microformats or tags, but there are both performance and maintenance reasons why that wont wash.

[^1]:for some reason not all messages, including ones relevant to this posting, appear in the metadata list archive

[^2]: which is currently lurking at [here

[^3]: Although obviously
we believe in late binding and separating the service and data metadata!

[^4]: Yes, I know, late binding again, but it's not here now!


#### trackbacks (1)

*[Notes on brief service descriptions and bindings]({% post_url oldblog/2008-04-03-notes_on_brief_service_descriptions_and_bindings %}) (from "Bryan's Blog" on (on Thursday 03 April, 2008)*)

I'm coming late1 to a discussion about representing services in feeds and catalogues ...
