---
layout: post
title:  Digital Signatures and Digital Preservation 
last_modified: Tuesday 21 December, 2004
tags: xml ndg
categories: computing
---
Those who saw my [xmlsec]({% post_url oldblog/2004-11-26-_xmlsec_ %}) blog will know we are moving to the use of digital signatures in [NDG](/tags/ndg) (and [BADC](http://badc.nerc.ac.uk)) authorisation.

At some point we will be moving to a situation where a user will digitally sign a request for access to licensed data for the situation where we currently require a physical signature. Currently we store those pieces of paper (for perpetuity) so that we can prove that the user involved had
the rights to access the data should we ever be subject to a legal
challenge.

When we move to digital signatures we will have the situation where a digitally signed document will look like (again in pseudo-xml):

    &lt;xml-root&gt;
    &lt;payload - the thing being signed&gt;
    &lt;signature&gt;
       &lt;the actual signature&gt;
       &lt;x509 cert of the signer&gt;
    &lt;/signature&gt;
    &lt;/xml-root&gt;

We need the x509 cert of the signer to be sure that the document is signed by the person we think signed it. We can need to use the public key of the **root authority** which signed their x509 certificate to validate it.

This means the preservation problem is now that we need to save **both** this (digitally signed) document and the public key of the root authority (as this may change with time).