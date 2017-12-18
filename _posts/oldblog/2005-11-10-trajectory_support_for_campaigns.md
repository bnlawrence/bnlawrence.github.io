---
layout: post
title: Trajectory Support for campaigns
last_modified: Thursday 24 November, 2005
tags: badc
categories: computing
---
 The BADC provides support for field campaigns in a number of ways. One of those is to provide information about the history of air parcels, and information about their future trajectories. We do this using a code we developed ourselves based on code from John Methven at the University of Reading. We are in the process of considering updating how we provide support, so are developing a use case.  ![Image: IMAGE: static/2005/11/24/CampaignSupportUseCase.jpg ](/assets/images/2005-11-24-CampaignSupportUseCase.jpg)  Any feedback we can get is welcome, either to me directly, or via this web page.  (You can find a pdf of the above jpg [here](static/2005/11/24/CampaignSupportUseCase.pdf)).

**Update (24/11/05):** The figures have been updated following feedback. (The originals are available by replacing the 24 in the links with 10). Two changes:
* Added the trigger concept rather than the run script being created
* Added the requirement to checks availability of NWP data (likely only to work with the BADC version, we probably just check the dates for the ECWMF version).
