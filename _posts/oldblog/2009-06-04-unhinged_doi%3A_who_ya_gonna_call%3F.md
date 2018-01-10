---
layout: post
title: unhinged doi - who ya gonna call?
last_modified: Thursday 04 June, 2009
tags: curation
categories: academic
---
My publications list has 
<blockquote>Lawrence, B.N., 2001: A Gravity Wave Induced Quasi-Biennial Oscillation in a three-dimensional mechanistic model. Q. J. R. Meteorol. Soc., 127, pg(s). 2005-2021. doi:10.1256/smsqj.57607
</blockquote>

listed on it.

However, if I dereference the doi, I get:
<blockquote> Content Not Found
</blockquote>
<blockquote> Ingenta is no longer hosting these titles of the Royal Meteorological Society. Content transferred to Wiley Interscience effective from 1 February 2007. The journals may now be found at www3.interscience.wiley.com/browse/?type=JOURNAL 
</blockquote>

Now call me stupid, I thought the whole point of a doi was that the publishers arranged the porting of the urls that the doi points to from one place
to another for **exactly** this situation.

So, one of the following is happening:
1. I had the wrong doi in my publication list ... and the error message arises
from that (wrong message, but fundamentally my problem)
1. The royal met society and wiley failed to handle the transfer properly, or
1. The doi system never got updated properly.

Which one?

If it's either of the latter two, then it brings into disrepute the whole use
of DOIs, and both the old publisher (the Royal Met Society) and the new one (Wiley) should share the blame (unless of course behind the scenes one or
the other has been pleading for the other to do the right thing)! Of course it's not the only time publishers have
[got this wrong]({% post_url oldblog/2005-08-11-nature_doi_failure %}) ...


#### trackbacks (1)

*[the doi saga continued]({% post_url oldblog/2009-06-09-the_doi_saga_continued %}) (from "Bryan's Blog" on (on Tuesday 09 June, 2009)*)

Chris made a fairly ascerbic (and fair) comment when I complained about the disappearance of the digital identity of one of my papers. Amongst other things, he found the current(!) doi for it ... 

#### comments (1)

*Chris Rusbridge (on Friday 05 June, 2009)*

Well, the DOI on the "current" version seems to be 10.1002/qj.49712757608, which doesn't look like a small corruption of your original DOI of doi:10.1256/smsqj.57607. That would suggest option 1 was not the case. I had a look at http://www.rmets.org/activities/publications/index.php on the Wayback Machine, but the first capture was December 2007, which appears (from the URLs) to be after the transfer to Wiley happened. And they wouldn't have captured the article, it's behind a pay wall...

<rant>This sort of thing really pisses me off. It's like when CURL (a library organisation, for heaven's sake) became RLUK, and forgot to specify to their new web site designers to ensure old URLs continued to work. Actually, they didn't even ensure that important documents like their e-Science stuff were available on the new site for searching. The DOI could be useful if it solved the appropriate copy problem, and if its minters (publishers) actually took the small administrative effort to redirect the DOIs when the resource moves. If publishers can't be bothered to do either of those things, then on the one hand a Cool URI would have been just as good (or bad), and on the other hand, they don't deserve to be viewed as responsible custodians of scientific information. </rant>

Having said all that, we've just done a web site move, and I'm terrified we'll find a whole raft of URLs we have broken. Fingers crossed so far.

Who ya gonna call? In this case, the Royal Met Soc, which still brands the journal even if Wiley publishes it... And yes, it's worth doing. These people have to learn that persistence comes ONLY from commitment, not technology.

Much more fun than watching bad-tempered Sugar ;-)!
