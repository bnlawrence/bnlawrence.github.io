---
layout: post
title: Dual Core Opterons
last_modified: Tuesday 24 May, 2005
tags: computing
categories: computing
---

In general I try and avoid being a hardware geek, but it appears that I'm going to have to understand the relative performance issues between dual-core opterons and normal ones and xeons ...

I found [this review](http://www.firingsquad.com/hardware/amd_dual-core_opteron_875/), dated April 2005, which has the following snippets which are perhaps worth remembering:<blockquote>From a core perspective, there's really nothing new to report about the Opteron chips. They consist of the same 64KB of data cache, 64KB of instruction cache, and 1MB of L2 cache. Only now, there are two of them manufactured at 90nm ... both cores attach directly to a System Request Queue and crossbar, over which they communicate with the package's three HyperTransport links and integrated memory controller. It still supports dual-channel DDR memory at up to 400MHz and those HT pathways still purr along at 1GHz. The only difference is now there are two cores utilizing them.
</blockquote>

![Image: IMAGE: static/2005/05/24/dual-opteron.jpg ](/assets/images/2005-05-24-dual-opteron.jpg)
<blockquote>If you're worried about bottlenecking, don't be. AMD is claiming resource conflicts are rare and the impact of shared memory is a roughly 10 percent reduction in bandwidth. In cranking up the HyperTransport frequency last year, AMD helped circumvent any limitations there.
</blockquote>

Of course that's all very well, but what about price performance? Well [this review](http://www.anandtech.com/cpuchipsets/showdoc.aspx?i=2397) had a very interesting price table, which I've repeated here:

![Image: IMAGE: static/2005/05/24/opteronsummarytable.png ](/assets/images/2005-05-24-opteronsummarytable.png)

which demonstrates that the extra cores are on average three times more expensive.

The same article has an extensive list of benchmarks, not all of which are particularly relevant to us, but
* [the sql order test](http://www.anandtech.com/cpuchipsets/showdoc.aspx?i=2397&amp;p=10) seems to demonstrate that quad xeon processors can't exploit their memory because:<blockquote>the memory bandwidth limitation of the Intel FSB architecture does not allow the quads to really stretch their legs. On the other hand, the Integrated Memory Controller of the Opterons allow them to pull ahead.
* [the data warehouse test](http://www.anandtech.com/cpuchipsets/showdoc.aspx?i=2397&amp;p=12) shows a clear advantage to the opteron, is good given that it</blockquote>
<blockquote>is all about the number of instructions that can be completed in a given period. The ability to move data quickly in and out of the CPU are the characteristics of a winner ...
</blockquote>

[Linux hardware](http://www.linuxhardware.org/article.pl?sid=05/04/21/1747217&amp;mode=thread
) also has a review with a number of benchmarks that are possibly a bit more relevant. Here for example is the result from a 5000 element matrix multiply running on dual processors (I think the AMD875 is a dual processor where each processor is dual core):
![Image: IMAGE: static/2005/05/24/dualcoreopt-042105_html_39b17817.gif ](/assets/images/2005-05-24-dualcoreopt-042105_html_39b17817.gif)

What we see is that once we exploit all the power of the processors, the Opteron shines (but up to then it is perhaps the better maths library on the intel machines which is shining?)

Finally, how well does it do scaling, and what about relative integer/floating point performance? [Infoworld](http://www.infoworld.com/article/05/04/21/17TCamd_1.html) has an article which includes those figures and other information. The key table is this one:

![Image: IMAGE: static/2005/05/24/opteron-floatint.png ](/assets/images/2005-05-24-opteron-floatint.png)

which speaks for itself. The second core does remarkably well.
