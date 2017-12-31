---
layout: post
title: Catalogues, Shopping Carts and Portals
last_modified: Wednesday 03 June, 2009
tags: ndg
categories: computing
---

The NDG (and INSPIRE) vision is that data providers stand up
services to expose their data and metadata. We imagine that catalogue
services harvest our metadata, and expose it in via catalogue
service interfaces. We imagine that portals exploit the catalogue service
interfaces to allow users to select data, and exploit the data in
visualisation services.

All that's fine, but there's a missing link, I think, if I'm wrong let me know!
I think we need a common shopping cart formalism ... (some folk will know
I hate the "phrase" shopping cart, but sadly, it does carry most of the correct semantics, as long as you allow it to be used when the contents can be free).

Imagine a world in which there were three data providers (A, B and C),
two catalogue services (C1, C2), two portal services (P1, P2),
and two visualisation services (V1, V2).

Metadata from A, B, and C would be harvested by both C1 and C2. A user
might visit P1 (which might exploit C1), and choose a dataset
from A and B because they exposed services understood by V1. So P1 needs
to pass to the visualisation service handles to **both** A and B, and
the user may or may not need to interact further directly with V1 (to say,
choose specific subsets of the data). In truth, it might be that
the subsetting is done in either P1 or V1. Similarly, the user might use P2, select B and C, and want to exploit
V1 or V2 ...

We have standard mechanisms for harvesting the metadata to the catalogue
services. We have standard mechanisms for portals to talk to catalogue
services (we might not like them, but they exist). However, if we want
a real service orientated architecture (in a generic sense, no in a
 WS-* sense) we need some mechanism of handing the context **sets**
to the visualisation services. In an interoperable world, P1 and P2 would
 use the same format to pass those context sets (user selections of
datasets, layers, subsetting etc) to the visualisation services V1 and V2.

In the Web Map Server world, one can use Web Map Context do do this, the
WMS Context specification states<blockquote>... how a specific grouping of one or more maps from one or
more map servers can be described in a portable, platform-independent format
for storage in a repository or for transmission between clients.
This description is known as a "Web Map Context Document," or simply
a "Context." Presently, context documents are primarily designed for
WMS bindings. However, extensibility is envisioned for binding to other
services.
</blockquote>

Indeed it goes on to say:<blockquote>The Context document could be saved from one client session and transferred
to a different client application to start up with the same context.</blockquote>
<blockquote> Contexts could be catalogued and discovered, thus providing a level of
granularity broader than individual layers.
</blockquote>

and so clearly they anticipated the "hijacking" (aka extension) of WMC for
exactly the purpose I outlined.  The problem of course is that it's
just so WMS centric (i.e. it works only for one class of visualisation
service); the whole "layer" thing is so redolent of maps that
it's difficult to work with from any other perspective. (And it's not
great that "Context" is [defined in XML schema](http://schemas.opengeospatial.net/context/1.1.0/context.xsd) rather than UML, it makes it
more difficult that it needs to be to get at the underlying abstracts
rather than the implementation detail).

All that said, the overall Context concept is that of a bucket of XML that can be passed around, with "bucket" level commonality, and "target" level detail, that must be the right idea. It's also right that it's a thing that users might want to park in personal "workspaces" and pass to each other.
