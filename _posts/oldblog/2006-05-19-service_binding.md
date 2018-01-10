---
layout: post
title: Service Binding
last_modified: Friday 19 May, 2006
tags: metadata ndg
categories: computing
---
One of the things we have grappled with rather unsatisfactorily in the NDG is how to declare in discovery and browse metadata
* that specific services are available to manipulate the described data entities
* and, for a given service, what the binding between the service and data id is to invoke a service instance.

This is prety important, as has been pointed out numerous times before, but probably most eloquently in an FGDC Geospatial Interoperability Reference Model [discussion](http://gai.fgdc.gov/girm/v1.1/):
<blockquote>For distributed computing, the service and information viewpoints are crucial and intertwined. For instance, information content isn't useful without services to transmit and use it. Conversely, invoking a service effectively requires that its underlying information be available and its meaning clear. However, the two viewpoints are also separable: one may define how to represent information regardless of what services carry it; or how to invoke a service regardless of how it packages its information.
</blockquote>

Thus far in NDG, where in discovery we have been using the NASA GCMD DIF, we have been pretty limited in what we can do, so we extended the
DIF schema to support a hack in the related URL ...

Basically what we did is add into the related URL the following:
~~~~~ xml
<Related_URL>
<URL_Content_Type>NDG_A_SERVICE</URL_Content_Type>
<URL>http://dmgdev1.esc.rl.ac.uk/cgi-bin/ndgDataAccess%3FdatasetSource=dmgdev1.esc.rl.ac.uk%26datasetID=</URL>
<Description>The NDG service delivering data via NDG A metadata.</Description>
</Related_URL>

~~~~~

Leaving aside the fact that we've embedded a naughty character (&amp;) in what
should be XML, we then create a binding for a user in the GUI between
that service and the dataset id ... it's clumsy, ugly, and of no
use to anyone else who might obtain our record via OAI. 

Ideally of course the metadata needs to be useful to both a human and automatic service discovery and binding tools. In the example above, we (NDG) know how to construct the binding between the service and the dataset id to make a human usable (clickable from a gui) URL, but no one else would. Likewise, there is no possibility of interoperability based on automatic tools. Such tools would be likely to use something like WSDL, or ISO19119 or both, or more ... (neither provide too much information about what the semantics are of the operations provided, one needs a data access query model -DAQM -which we've termed "Q" in our metadata taxonomy).

However, if we step back from the standards and ask ourselves what we need, I think it's something like the following:
~~~~~ xml
<OnlineResource>
    <Service>
        <ServiceName>NDG_DataExtractor</ServiceName>
        <ServiceBinding>
            <ServiceLocation>http://DeployedServiceURL</ServiceLocation>
            <HumanInterfaceURL>http://DeployedServiceURL/dataid</HumanInterfaceURL>
        </ServiceBinding>
    </Service>
    <Service>
        <ServiceName> NDG_DataExtractorWS </ServiceName>
        <ServiceDescription>
            <DescriptionURL type="WSDL"> address</DescriptionURL>
            <DescriptionURL type="ISO19119"> address </DescriptionURL>
            <DescriptionURL type="DAQM"> address </DescriptionURL>
            <Description>
                Provides a web service interface to the <a href="http://ndg.nerc.ac.uk">csml</a>
                features provided in the dataset, allowing an application (for example the
                NDG DataExtractor GUI, but others as well), to subset and extract specific features from the dataset.
            </Description>
        </ServiceDescription>
        <ServiceBinding>
            <ServiceLocation>http://DeployedServiceURL</ServiceLocation>
        </ServiceBinding>
    </Service>
</OnlineResource>

~~~~~

where I've made up the tags to get across some semantic meaning (yes, I know, I should have done it in UML).

OK, I think I know what we need, now how does this work in the standards world, what have I forgotten? What do we need to do to make it interoperable, and what are the steps along the way?

Well those are rhetoric questions, I know some of the first things I need to do: starting with a chat to my mate Jeremy Tandy at the Met Office who is wrestling with the same questions for the [SIMDAT](http://www.ecmwf.int/services/grid/simdat/) project, and then I think I'll be off reading the standards documents again. I suspect I'll have to find out more about [OWL-S](http://www.daml.org/services/owl-s/) as I'm pretty sure there will be more tools in that area (given that ISO19139 is only just arriving for ISO19115 and there is no matching equivalent that I'm aware of for ISO19119).

#### trackbacks (1)

*[Service Descriptions]({% post_url oldblog/2006-12-07-service_descriptions %}) (from "Bryan's Blog" on (on Thursday 07 December, 2006)*)

A little over six months ago, I introduced the thorny problem of service binding to my blog. Of course it hasn't gone away. Last week I gave a talk (see my the SEEGRID talk on my talks page) about "Grid-OGC collision" in which I made some specific statements ...
