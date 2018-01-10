---
layout: post
title: Whither parameters in metadata
last_modified: Tuesday 03 January, 2006
tags: ndg metadata iso19115
categories: computing
---
Last year, there was considerable chatter  on the [metadata mailing list](http://lists.geocomm.com/mailman/listinfo/metadata) about where the right place was to put *which parameters were measured*  in an ISO19115 metadata record.

The WMO has had the same problem with working out how to produce the WMO core ISO19115 schema. First iterations assumed the best thing to do was to put such things in feature instances themselves in the metadata documents. While this is legal (although not the way it was done by the WMO tech team initially), if one follows the appropriate extension mechanisms and produces metadata instances for all feature instances, it does lead to cumbersome metadata.

I think this is easily avoided by only using ISO19115 metadata for datasets which are aggregations of feature instances, but that still leaves the problem of where the *measured parameters* go ...

Various responses on the metadata list  implied that parameters themselves (as opposed to keywords) should end up in feature descriptions, which some thought, like the initial WMO thoughts, ought to be included in ISO19139 documents (ISO19139 is the xml encoding of ISO19115).  However, for volume reasons, and because it simply wont be  right in most profiles of ISO19115 (based on ISO19139 or not) the correct thing to do is to refer to feature instance documents from within the metadata instance documents.

Regrettably though the most likely thing one wants to do when searching for data (i.e. parsing dataset metadata) is to search for specific types (parameters) of data (as well as use keyword vocabularies) which implies that whether or not the **features** are in the metadata instances, the **parameters** should be in the ISO19115 documents, so let's track down where and how the features are encoded.

Well,  [iso19110](iso/iso19110) only tells us how to define feature types - not instances - and even then doesn't define a schema for them. ISO19136, the geography markup language (GML) provides mechanisms for building XML application schemas, so that's the one that tells us how to define feature types in terms of XML. It's those actual application schema instances which provide the formalism for encoding feature instances. 

OK, so now we know that the parameters are encoded in data dictionaries within the instances defined by application schema themselves encoded using 19136 (GML). However, we also know that in reality we need some of these things inside our discovery documents. 

My take on this is we have to use the ISO19115 extension mechanism to get the parameter names into the ISO19115 profiles we use ... and have an explicit overlap between the feature instance dictionaries and the discovery records (i.e. an overlap, not a replication of all of it). While overlaps are redundant, I think we expect to generate our ISO19115 docs from our feature instance docs anyway, so the redundancy can simply be thought of as input data rather than additional data.

Maybe this is all obvious anyway (after all, it's explicitly what the NDG metadata taxonomy states) but I felt like spelling it out.

#### comments (2)

*John Hockaday (on Thursday 11 May, 2006)*

I disagree with your solution.  ISO 19115 metadata is for many different types of data.  The hierarchyLevel elements covers 16 different data types.  One of these types is "featureType" another is "attributeType".

This indicates that metadata can and should be entered for "featureTypes" and "attributeTypes".  In this way they will be discoverable because of their metadata being recorded in a Catalogue Service or something similar.

ISO 19115 metadata standard is for all types of data not just datasets.  I agree that one can have an online link off to the feature catalogue but to define and discover feature and attribute types the metadata for these data types should be created and made public.

Thanks.

*Bryan (on Friday 12 May, 2006)*

It's a volume thing. We have literally millions of feature instances (billions depending on how you define them), if we catalogue them individually, we have two major problems: (1) how to maintain the metadata, and (2) we need a way of ranking them which gets the user to the data they are actually interested in. Well, one decision any data provider can always make is to aggregate things in ways that make clear the things exist and are discoverable, but help the user discriminate, and simplify maintenance.

We simply don't have the staff for any other approach.
