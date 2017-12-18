---
layout: post
title:  Broadband Frustration
last_modified: Thursday 24 February, 2005
tags: broadband
categories: personal 
---

"Broadband Britain" is a wonderful but empty phrase. I work at home a lot, but it isn't always easy ...

I live a long way from my exchange. Currently I have ISDN. I might be
within ADSL range, I didn't use to be, but now, who knows? Multiple phone calls have yet to get BT to say anything sensible. I try every few weeks to order broadband from BT, and each time I get lost in a torturous maise of transfers and inaccurate information. I tried again this morning, and may try again this afternoon. (Why order from BT? Because if I can't get 512 kB/s, I want to stay with ISDN ...)

I currently have satellite broadband provided by Micronet Broadband and
Opensky/Eutelsat (the satellite is ebird at 33E) and I use BT Midband ISDN for uplink. Because I have a home network, I use an F10 router.

The F10 provides a VPN using ISDN uplink and satellite downlink via osda.eutelsat.net, and all my local IP traffic going externally should go via that VPN. **Should** I say. The VPN is as unstable as hell, and it appears
that eutelsat have a small bank of VPN circuits. I get good service some of the time, but a lot of the time, far too much of the time, I see this:
![Image: IMAGE: static/2005/02/24/f10failure1.jpg ](/assets/images/2005-02-24-f10failure1.jpg)

Far, far too often, this follows:
![Image: IMAGE: static/2005/02/24/f10failure2.jpg ](/assets/images/2005-02-24-f10failure2.jpg)

Note added later in the day, and for once, I caught this message, which must have been to do with the satellite, because it occurred in the middle of some file transfers:

![Image: IMAGE: static/2005/02/24/f10failure5s.jpg ](/assets/images/2005-02-24-f10failure5s.jpg)

The bottom line is that I have to support fail over to ISDN, but guess what? The F10 doesn't support this without manually changing the configuration! The F10 software is all round poor, for example, you'd expect it to have an option to automatically establish the connection for outband packets (my other ISDN modem can do this). It should be able to support 128 kbit ISDN when the satellite is unavailable (or more usually, when the VPN is unavailable). It should also support optional 128 kbit uplink. However, it does neither, so I have to support two routers, and much mucking around.

When satellite broaband is  good, it's very good, but when it's bad, it's useless. And it's bad far far too much of the time.
