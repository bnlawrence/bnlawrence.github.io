---
layout: post
title:  Open Source Licenses 
last_modified: Saturday 08 January, 2005
tags: badc curation
categories: computing
---

We're in the curation business. That means we're in the business of keeping our data for a very long time ... the reality of data is that it's always accompanied by software to use it. If we're serious about longevity of the data we're forced to be serious about longevity of the accompanying software. In practice, given the way companies can be bought and sold, and rights to software might change, we are required to be very careful about whether our software has legal longevity as well as technical longevity.

Up until yesterday, I happily thought that using software protected by open source licenses would protect the legal longevity of our software. 

(A digression:) Yes, I know some large companies argue the opposite, but their warranty that the software they supply me is theirs to give is no more valid, and may be less valid than that which accompanies open source software. As has been argued many times, the reality is that closed source software is just as amenable to, for example, patent challenge, as open source. In fact, if software security is anything to go by, it's probably more at risk of having transgressed, even if (unlike security) it is (possibly) less at risk of being caught.  Of course there is a difference in whose pockets may be used to defend a legal challenge on the software ... (but if I take the long view, it will always be my organisation's pockets). (Yes, I'm still worried about software patents even though I'm in the UK, because while they don't exist in Europe, yet ... it's not clear that they'll never exist).

(Back to the main story:) What happened yesterday? Members of my parent organisation (the [CCLRC](http://clrc.ac.uk)) met with a lawyer to discuss an upcoming workshop on software licensing. I learnt that the 
[GPL](http://www.gnu.org/copyleft/gpl.html) is a US legal instrument. I guess I knew that, but I never understood the ramifications. I turns out that this means
* The license does not state a legal jurisdiction or under which legal system it should be interpreted. (Compare it with the [QPL](http://www.trolltech.com/licenses/qpl.html)).
* Given we don't know whose law applies, it's a problem that not all the terminology has meaning outside the US, in particular phrases like 
"derivative-work" and "as-is" have no legal meaning in the UK (and probably Europe).

I'm not sure I understood the next point properly, but I'm repeating it here in the hope it will get clarified:
* Arguably, the attempt to provide no warranty of fitness of purpose could be construed as an unfair contract in UK law.

(I would argue that given no money changes hands over the software, it's hard to see what is unfair about it, but perhaps difficulties could occur if one tried to provide services based on using such code?)

Anyway, it turns out that these difficulties could make the GPL difficult to work with here in the UK ... what would happen if one UK company and another UK company had an argument based on the GPL? What about European companies? What about cross-Atlantic arguments? Whose law? Whose interpretation?

Yesterday's discussion wasn't formal *legal opinion* but it was informed opinion and it has me nervous ... 

However, the reality is that we produce software and services based on GPL'd
code, and so our code has to be GPL as well ... so we need to understand these
issues but not fret. 

On the flipside are the risks associated with cheaper versions of commercial
licenses: In a world where we obtain software under "academic" or
"non-commercial" licenses we need to be careful about the conditions of
use. Can we offer services based on academic licensed software to other
academics (and charge them)? What about other research institutes? This has me
nervous as well, because we (the BADC) exist because the CCLRC offer services
to the Natural Environment Research Council (NERC) primarily via a Service
Level Agreement. Is this a commercial relationship? Does it invalidate our
licenses? 

Me, I still feel safer with services based on GPL code.

Then there was the issue about the software we produce. We spent some time
talking about other licenses obviously, and things to look for. It turns out
that the words **exclusive** and **non-exclusive** are very important for software
we produce. In particular, we only want to give folk non-exclusive rights to
our software regardless of whether it's open source or not. That way we can do
something else (like sell) other copies of the software.  Or at least it would
be that simple until we understand that people feed back corrections to open
source software, in the understanding that it is open source. Can I then do
something different with the "modified externally" software? I don't yet know.

Again, I feel safer with a "traditional" open source license, that way we all know the score, even if the legal ramifications are not yet
clarified.  In terms of risk analysis, should we ever get clobbered on a GPL
violation based on EU (or UK) law, then I'd go public, and figure that it
wouldn't just be us (BADC, CCLRC) that would have to defend it, it'd be the UK
(plc) or the EU (plc).
