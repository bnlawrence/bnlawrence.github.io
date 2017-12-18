---
layout: post
title:  On Binary XML 
last_modified: Tuesday 04 January, 2005
tags: xml ndg
categories: computing
---

NDG reviewers the first time around suggested we would need binary XML. I think they thought we would put all our data in XML, not just the 
metadata.

However, there is (was?) an initiative to build 
[binary XML](http://www.w3.org/XML/Binary/). ( Not to be confused with [BinX](http://www.edikt.org/binx/) which is an XML descriptive format for Binary data - or it's cousin [DFDL](http://forge.gridforum.org/projects/dfdl-wg/) )

What we're interested in is handling XML data itself as XML streams.

Now we could just compress it ...  (quoting from [Kendall Grant Clark](http://www.xml.com/pub/a/2003/08/13/deviant.html))
who said sensibly:<blockquote>If you absolutely must have some kind of binary variant, gzip seems hard to beat since it allows you to pick any three from "decent compression factor", "decent (de)compression performance", and "already implemented everywhere".
</blockquote>

This is a fair point for many applications. However, I think Clark didn't really cotton onto why we think we need it. In some of our applications, the size of XML documents is a problem. Ok, so use SAX instead of DOM I hear you say? Well maybe, but not always ... 

The issue is what does one do with encoding environmental datastreams in XML?
We currently wrap the big stuff in binary formats like NetCDF and HDF, and that isn't going to change soon. However, we markup the metadata in XML (using our CSML, or CDML, or NCML or ESML or ...) and sometimes our metadata needs to encode some of the data (axes for example). While we can encode formulae economically, we can't handle large wodges of binary data. The same problem exists in the [energy industry](http://www.w3.org/TR/xbc-use-cases/#FPenergy).

With large datasets,  we've already got something that gzip doesn't do well with, so wrapping asci representations of that data (at some resolution which may or may not be machine precision) in xml is going to be **bloat**. Bloating something, then gzipping it does better than you may think, but it's still **unnecessary** data handling. 

To my mind, XML is about data **transfer** not about data **storage**. But this is a problem where we have significant problems with data volume. What we need to avoid is the situation where we have<blockquote>Binary Data -&gt; Convert to XML -&gt; Process/Move it -&gt; Convert back -&gt; Binary Data
</blockquote>

In this case the conversion overheads involved are rather huge, and the risk of precision loss is also significant.

**Diversion on binary format conversion**

Conversion overheads can also be a problem with binary formats themselves. **Un-necessary** format conversion of any sort should be discouraged. One of my two major beefs with [opendap](http://opendap.org) is un-necessary format conversion (the other is to do with access control).

I have no problem with necessary format conversion, for example if you end up with something like<blockquote>Binary Data (format m) -&gt; Process/Move -&gt; Binary Data (format n)
</blockquote>

then the last thing you want to do is produce M times N format converters. What you want to do is produce (at worst) M plus N format converters to an intermediate format. In part, one of the successes of Opendap is that it does address this issue (I think however, the main reason for it's success is that they produced a netcdf binding for it, thus allowing easy development of remote-access to netcdf data).

What would really help opendap is the ability to avoid the protocol conversion if the user required the same output format as the original data ...

**Back to Binary XML**

While we have engineered around storing massive amounts of binary data in CSML (for now), I can see significant advantages in being able to do so:
* avoiding un-necessary format conversions
* known binary precision

resulting in
* less memory
* shorter execution times

Unlike many XML applications the last point matters! For very big datasets, it makes such a difference that something untenably slow can suddenly become useable.

Probably the area where this could make the biggest difference in the near future for us is in the handling of observational meteorology data. More on this at a later date ... 
