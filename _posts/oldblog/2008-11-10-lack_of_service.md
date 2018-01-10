---
layout: post
title: lack of service
last_modified: Monday 10 November, 2008
tags: downtime
categories: computing
---
We've had a hell of a day today. 

Somehow, for reasons unknown (but following a planned power cycle, and I don't really believe in coincidence), the router which supports the [CEDA](http://www.ceda.ac.uk) (BADC+NEODC etc) network decided yesterday to hide CEDA from the world (and the world from CEDA).  At the same time it did the same thing for a few dozen offices as well (including mine).

This despite all sorts of redundancy that is supposed to stop this sort of thing happening (it might be that it was faulty redundancy that caused it).  Frankly we still don't know what the problem was, and we've not got it back to normal. However, we've got most things back up and working (but I'm sitting typing this in my secretary's office, she's had a working connection all day, but me in the office next door, nothing). What is working serverwise is by dint of an extra cable or two connecting one part of our machine room to another (one entire link to a backbone router refuses to function, despite being physically ok).

The post mortems from this will run and run, but meanwhile I feel almost physically sick. One of our most important attributes is a reliable fast network, and for (hopefully) one day, it's been neither! It'd probabably be ok, but it seems every time we have power trouble - whether scheduled or not - we have problems, either immediately on in the weeks that follow, and every time it's another "class" of problem ... (because of course we **do** fix each failure mode as we discover it).

If anyone from [FAAM](http://faam.ac.uk) is reading this. Sorry. We're not picking on you ... 

Should we be better at anticipating problems? Yes. Can we do better? Yes. Will we never have problems like this again? No, we're simply not resourced for truly high availability.
