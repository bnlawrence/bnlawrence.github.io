---
layout: post
title: Function Creep and Institutional Repositories
last_modified: Thursday 31 March, 2005
tags: curation
categories: computing
---
The case for institutional repositories (IRs) is well made in Crow et.al.: *The Case for Institutional Repositories: A SPARC Position Paper* ([link](http://www.arl.org/sparc/IR/ir.html#exec))... as long as the definition of "digital collections capturing and preserving the intellectual output of a single or multi-university community" is appropriate.

I think many of those who are considering establishing, funding, and running IRs are visualising IRs which encapsulate documents (whether published or not), but the natural tendency of many is to be (dangerously) all inclusive. Statements like these abound in the IR literature:<blockquote>The vast global corpus of heterogeneous data that the repositories represent can be curated by the local content managers best prepared to accommodate each data set's specific detail and particularities (for example with detailed metadata appropriate to the content).</blockquote>
<blockquote>... the disaggregated model includes not only pre-prints and research papers, but also extends to research data sets ...</blockquote>
<blockquote>Access to disparate content types will drive retrieval interfaces to evolve from text search models to search engines capable of handling complex data types (for example, biological information, cell structures, and genome structures).</blockquote>
<blockquote>This material might include student electronic portfolios, classroom teaching materials, the institution's annual reports, video recordings, computer programs, data sets, photographs, and art works-virtually any digital material that the institution wishes to preserve.
</blockquote>

(all these from Crow et.al., but they're hardly unique). The problem of course is that once one asks what a digital repository is for, one gets answers in terms of open access and preservation. Readers of my blog will know that I'm totally in favour of open access, but I don't believe too many of the folk who are advocating IRs including non-document data have thought too much about the preservation problems they will be entertaining with data as opposed to documents.

It is precisely the issue of preserving data that has motivated the establishment of the National Digital Curation Centre [here](http://dcc.ac.uk) in the UK; not to **do** digital curation, but to advise on it. Nationally, it is recognised that coping with the [data deluge](http://www.allhands.org.uk/2004/proceedings/papers/150.pdf) is a problem, yet most of these IRs seem to think that they can be set up with relatively modest investment.

The idea that<blockquote>institutional repository systems must be able to accommodate thousands of submissions per year, and eventually must be able to preserve millions of digital objects and many terabytes of data.
</blockquote>

is fine. However, it is only technically feasible for an institution at modest cost, if, and only if, one limits the format and variety of digital objects in the repository. This is because, while<blockquote>libraries can most effectively provide much of the expertise in terms of metadata tagging, authority controls, and the other content management requirements that increase access to, and the usability of, the data itself.
</blockquote>

is true for document-style metadata, the metadata required to access, understand, and manipulate scientific datasets is always going to be the preserve of domain-experts. At any given time, no institution is likely to have the appropriate mix of individuals to maintain *and migrate for the future* **all** the data and metadata it has produced in the last year
[^1], let alone over the institutions digital lifetime.

It's not just me that thinks like this,<blockquote>One thing that has been learned from existing scientific data collection management is that these archives must be initiated by respected scientists working with people trained and skilled in data management ([CODATA, 2002](http://www.codata.org/archives/2002/ArchivingWGPretoriaRpt.pdf)). Domain knowledge is needed in order for collections to be managed, documented, and kept usable by scientists and researchers.
</blockquote>

(from " [AAnderson, 2004](http://journals.eecs.qub.ac.uk/codata/Journal/contents/3_04/3_04pdfs/DS389.pdf)). Nonetheless, it is true that as Crow et al stated<blockquote>... overlay journals pointing to distributed content, high-value information portals-centered around large, sophisticated data sets specific to a particular research community-will spawn new types of digital overlay publications based on the shared data.
</blockquote>

which is to say that raw data (whatever raw means), can be held in repositories, and made available to institutions. It's also true that
some data should be stored in IRs, not least because there may not be anywhere else suitable for such data to be archived. However, I have no truck with the logic that preserving the bits and bytes for the future without worrying about how to migrate the accompanying metadata (by which I mean more than Dublin Core type metadata) is a sensible attitude. I think it's a way for people to think "oh, I don't need to worry about preserving this data (and metadata) because my IR will do that", which if nothing else is done, will result ten years later in incomprehensive binary (junk).

So, yes, I'm very much in favour of institutional repositories, but they need to be established with a very clear understanding of what they will host and they need to reject material that they can't hope to preserve. Then they need to hold a hard line against function creep, and only accept material in "well known formats" (whatever that means) with "well structured metadata" (whatever that means). This is exactly how the discipline specific respositories function: we can't take just anything because we could never preserve it, and we have a dozen domain experts to work on it ... we demand specific formats, and work hard to get structured metadata.

That's not to say that IRs can't provide a **backup** service for their institutions: somewhere to put other material for **temporary storage** but they ought not to imply that such data has longevity when it doesn't and can't.

And, having said all that, the situation may well change (if for example a lot of complexity becomes absorbed into widely understood standard descriptions, like, for example the Geography Markup Language, GML). However, when that nirvana arives, it'll still be domain experts that will be needed to get the stuff out of whatever binary format it's in and into the new one, and all the accompanying usage information will need migration too ...

(There is a good collection of material on scientific data repositories [here](http://www.nla.gov.au/padi/topics/373.html).)

[^1]: I'm willing to argue that there are no universities currently doing atmospheric science in the UK that would be willing to do this for their own output if they had to take on board ensuring adequate metadata. The same is probably true of most scientific disciplines.


#### trackbacks (2)
*[Persistence]({% post_url 2006-10-23-persistence %}) (from "Bryan's Blog" on (on Monday 23 October, 2006)*)Just after I wrote my last post on data citation, I found Joeseph Reagle's blog entry on bibliography and citation. He's making a number of points, one of which was about transience. In the comments to his post ...

*[Metadata, Effort and Scope]({% post_url 2008-05-21-metadata_effort_and_scope %}) (from "Bryan's Blog" on (on Wednesday 21 May, 2008)*)I keep on harping on about how metadata management is time intensive, and the importance of standards...
