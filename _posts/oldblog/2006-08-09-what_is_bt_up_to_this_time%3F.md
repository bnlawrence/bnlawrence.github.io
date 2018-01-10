---
layout: post
title: what is bt up to this time?
last_modified: Friday 11 August, 2006
tags: broadband
categories: diary
---
For the last three nights (including tonight), konqueror has been misbehaving on both my home linux systems (one running Suse, one kubuntu). Neither O/S has been modified for a long time ...

... yet all of a sudden, nearly all web pages return "Unexpected end of data, some  information may be lost."

![Image: IMAGE: static/2006/08/08/konqError.jpg ](/assets/images/2006-08-08-konqError.jpg)

Mozilla seems fine to the same sites. My laptop which is the ubuntu system is fine when I vpn into work ... to the same sites ... 

Conclusion: BT has been up to something with caching or some sort of nasty middleware, but I can't think of any way of getting this fault description through their microsoftacious technical support route ...

Has anyone else seen this? Or anything like it?

(**Update**: it looks like the css files are not being downloaded. I can't even view a css file from konqueror via bt, even if it is visible in firefox ... now I'm really confused .. nor can I view page source, even though the dom is inspectable and visible).

(**Update**, 11th, and now it's all fine again ...)

#### comments (7)

*Andy Carter (on Monday 14 August, 2006)*

Yeah, I have exactly the same problem. I'll go for a week or so without any difficulty, then this problem will arise, it'll sometimes last 2 or 3 days then disappear as mysteriously as it came. It also affects KNewsTicker, which is unable to obtain rss news updates whilst this problem persists.

*Andy Carter (on Monday 14 August, 2006)*

Response from BT, so typical.

"I understand from your e-mail that you are receiving error message 'Unexpected end of data, some information may be lost'. Also, you do not like to use another browser. I am sorry for the inconvenience caused.

I would have liked to help you; however, we have no expertise trained on this browser. Since you do not like to use another browser, please contact Konqueror Helpdesk for further assistance."

*Bryan (on Monday 14 August, 2006)*

Well done on trying ... I can't say I'm stunned at the response :-(

Like you it affects my news feeds as well (Akregator) ...

I don't like not understanding things like this ... but I can't think of anything obvious they've done ...

*Andy Carter (on Tuesday 15 August, 2006)*

I just upgraded the firmware on my BT Voyager 2091 wireless router. This appears to have fixed the problem, whether this is permanent remains to be seen. So right now my opinion is that the problem is BT hardware related.

*Bryan (on Wednesday 16 August, 2006)*

Andy. Thanks for letting me know! Do let me know if this fixes it permanently ... (ok, I guess that's impossible ... how about: do let me know if it breaks again :-)

*Andy Carter (on Tuesday 22 August, 2006)*

Couldn't last I s'pose. It's back at it again! This time it happened after being fine for days. I noticed the page corruption got progressively worse when browsing successive web pages. I'm convinced this is a BT network issue. If I save a page in Firefox and open it in Konqueror there is no corruption. It is also affecting my windows boxes, no corruption but web page loading seems to be slower.

*Andy Carter (on Wednesday 23 August, 2006)*

Things are improving. Problem was short lived this time. Everything is OK this morning.

