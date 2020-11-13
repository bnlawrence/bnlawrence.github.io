---
layout: post
title: On typed links.
last_modified: Thursday 10 April, 2008
tags: ndg metadata metafor
categories: computing
---
Being a collection of links and notes.

You've seen me witter on about [online resources]({% post_url oldblog/2008-03-19-online_resources_in_iso19115_and_moles %}) in [molesOnline Reference](static/2008/03/20/molesOnlineReference.png). Now we need to do some more thinking. Still mainly in the context of [service binding]({% post_url oldblog/2008-04-03-notes_on_brief_service_descriptions_and_bindings %}) (but where the services might just be view services too!).

Put it all in rdf they said.

####  RDF  

What do I know?

Well, I understand about subject -&gt; predicate -&gt; object. I can bandy about the phrase "triplestore" with the best of them. 

So if I have text -&gt; typeOfLink -&gt; target, and I'm thinking about this 
in terms of my metadata environment, then I can readily imagine at least
three contexts for such links: embedded within document text, embedded within documents as lists of links, and as associations between documents at some metalevel (e.g. the relatedTo association in [MOLES]({% post_url oldblog/2008-04-01-more_moles_version_two_thinking %})).

If I'm thinking about infrastructure, then I want to store:
* those triples
* the documents
* the associations
and crucially, the context in which they all live. It would appear that [context matters](http://sw.deri.org/2005/02/dexa/yars.pdf) (this is all related to the context of *reification*, that is, that each triple is itself a resource describable in RDF).

RDF itself says nothing about what typeOfLink should be. For that we need an ontology for links ... ("oh no we don't" they scream from offstage, "oh yes we do", they scream from onstage. Yes, I fear this is going to descend to pantomime).

####  RDFa  

Well, [RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/) allows me to embed all sorts of information about a link in the text preceding and following it. In practise I might think about that ability as allowing me have an object which has some attributes, and in the context document for me to expose some of those attributes. That probably needs an
example.

Let's imagine I have an objectType called person defined in a schema called, say, moles. For the purpose of this example, Person has attributes of name, email address, and web page. I might say that the URI of any person instance is the URI of their webpage.

In my metadata document, I might want to have some text in a paragraph which
has a link to a persons web page, something like:
<pre>
&lt;p xmlns:moles="http://ndg.nerc.ac.uk/schemas/molesv2"
   about="http://home.badc.rl.ac.uk/lawrence"&gt; You can contact
 &lt;!-- about is RDFa syntax and sets a current URI for this paragraph --&gt; 
 &lt;span property="moles:personName="Bryan Lawrence"&gt; 
        Bryan Lawrence&lt;/span&gt; at
      &lt;a rel="moles:emailAddress" href="mailto:blah@blah"&gt;
      his email&lt;/a&gt;.
&lt;/p&gt;
</pre>
which could get hoovered up into raw RDF triples. 

My point here is that
this particular link can be serialised via RDFa into a bunch of triples, and in the calling document the primary link might not even appear as a "simple link" (the primary link would not be visible in an html rendering of this link which looks like an email link). The semantics of the link are controlled by the semantics we have in the parent namespace.

(Issue to consider: how do we create all these documents with RDFa that conforms to MOLES or whatever other schemas are relevant?)

####  Atom  

Let's start with the atom:content element, which can contain either content or links to the content of an atom:entry. This is pretty useful because it explicitly does a little bit of what MOLES version one tried to do. Best summarised by directly quoting the [specification](http://atomenabled.org/developers/syndication/atom-format-spec.php):
<pre>
atomInlineTextContent =
   element atom:content {
      atomCommonAttributes,
      attribute type { "text" | "html" }?,
      (text)*
   
atomInlineXHTMLContent =
   element atom:content {
      atomCommonAttributes,
      attribute type { "xhtml" },
      xhtmlDiv
   }
atomInlineOtherContent =
   element atom:content {
      atomCommonAttributes,
      attribute type { atomMediaType }?,
      (text|anyElement)*
   }
atomOutOfLineContent =
   element atom:content {
      atomCommonAttributes,
      attribute type { atomMediaType }?,
      attribute src { atomUri },
      empty
   }
atomContent = atomInlineTextContent
 | atomInlineXHTMLContent
 | atomInlineOtherContent
 | atomOutOfLineContent
</pre>
Even more importantly:  the **atom:link** element defines a reference from an entry or feed to a Web resource. The specification assigns no meaning to the content (if any) of that element. 
<pre>
atomLink =
   element atom:link {
      atomCommonAttributes,
      attribute href { atomUri },
      attribute rel { atomNCName | atomUri }?,
      attribute type { atomMediaType }?,
      attribute hreflang { atomLanguageTag }?,
      attribute title { text }?,
      attribute length { text }?,
      undefinedContent
   }
</pre>
Now we have something that extends xlink, and has a controlled vocab called the *Registry of Link Relations* (cue "oh no") for the link relative types, which currently has five members:
1.  The value "alternate" signifies that the IRI in the value of the href attribute identifies an alternate version of the resource described by the containing element.
1. The value "related" signifies that the IRI in the value of the href attribute identifies a resource related to the resource described by the containing element. For example, the feed for a site that discusses the performance of the search engine at "http://search.example.com" might contain, as a child of atom:feed: 
<pre>
    &lt;link rel="related" href="http://search.example.com/"/&gt;
</pre> An identical link might appear as a child of any atom:entry whose content contains a discussion of that same search engine.
1. The value "self" signifies that the IRI in the value of the href attribute identifies a resource equivalent to the containing element.
1. The value "enclosure" signifies that the IRI in the value of the href attribute identifies a related resource that is potentially large in size and might require special handling. For atom:link elements with rel="enclosure", the length attribute SHOULD be provided.
1. The value "via" signifies that the IRI in the value of the href attribute identifies a resource that is the source of the information provided in the containing element.

The mechanism for updating these relationships is quite onerous, involving
New assignments are subject to IESG Approval, as outlined in RFC2434. Requests should be made by email to IANA, which will then forward the request to the IESG, requesting approval. The request should use the following template:
*  Attribute Value: (A value for the "rel" attribute that conforms to the syntax rule given above).
* Description:
* Expected display characteristics:
* Security considerations:

And now let's use some of the examples floating around in various documents where folk are talking about RESTful services. Sean's one that I used recently was 
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
Now, we could build a compound thing, and get a WADL document. There is a conventions syntax that I first saw in a [Pat Cappelaere presentation](http://www.slideshare.net/cappelaere/restful-ogc-services), which is essentially of the form:
<blockquote>If I have a resource /x then I can get the metadata for it at /x.metadata and the atom representation at /x.atom, and maybe, if it's a service type thing, a service descrition at /x.wadl.
</blockquote>

In otherwords, a convention (I think) which imposes a vocabulary (is it controlled, and if so by whom?) on a URI. So the link type is now in the URI scheme in a RESTful atom world ... 

Andrew Turner gave some examples in a [presentation](http://www.slideshare.net/ajturner/mass-market-geo-standards-ogc-technical-committee/) I found via the [geoweb rest group](http://groups.google.com/group/geo-web-rest) which also does the same sort of thing, now explicitly as an atom link:
<pre>
&lt;link
    rel="alternate"
    type="application/vnd.ogc.wms_xml; charset=utf-8"
    href="http://mapufacture.com/feeds/1621.wms" /&gt;
</pre>
He gave a template example too in that presentation that I have yet to understand ...

Now, let's jump to a discussion in [Google Groups](http://groups.google.com/group/geo-web-rest/browse_thread/thread/c6e8273ad950aa40), where I learn (from Sean yet again) that "what a service must do is specified using an [app:accepts](http://tools.ietf.org/html/rfc5023#section-8.3.4) element. 

But that works fine provided what I'm uploading is a media type. What if my service needs to know the feature type? There is some discussion that went down this route, where Sean proposed something like:
<pre>
text/xml;subtype=om/#,
</pre>
which presumably is a syntax for pointing to a specific schema.

Jeremy Cothran suggested including a reference to an associated content schema, but didn't (I think) suggest exactly how that could be done.

Right. That's enough for now. More later.

#### comments (1)

*[Sean Gillies](http://zcologia.com/sgillies) (on Thursday 10 April, 2008)*

Bringing these fancy services back in line with the resource web is no fun at all. The concept of a service "home page" would help. As things stand, a capabilities document is the closest thing, but it's never really exposed as a web resource, only as the result of a service request.
