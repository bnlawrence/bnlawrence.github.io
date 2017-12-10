---
layout: post
title: Vertical and Horizontal Resolution
last_modified: Monday 09 September, 2013
categories: environment
tags: dynamics resolution
---
I've been delving in the literature a bit this week ... considering model resolution and various issues around it. This post is by way of notes from my reading.

One of the things to consider at any time is do we have enough resolution. Most climate scientists will tell you they need more horizontal resolution, but fewer will concede they need more vertical resolution.

It should be (but appears to be not) well known that just as one has to consider changing the time-step as horizontal resolution is increased, one needs to consider whether there is enough vertical resolution. This issue was dealt with quite a time ago in [Lindzen and Fox-Rabinovitz (1989)](https://doi.org/10.1175/1520-0493(1989)117&lt;2575:CVAHR&gt;2.0.CO;2) (hereafter LFR89). There have been some recent follow-ups on the importance for chemistry (e.g [Kent et al 2012](https://doi.org/10.1175/MWR-D-11-00150.1)) and on models performance in general (e.g.[Marques et al 2011](https://doi.org/10.1007/s00382-010-0828-9)). (It's probably worth pointing out that the latter, and references therin, point out that model convergence to reality depends as much on how the physics deals with resolution as on the dynamics, but that's a point for another day ... but if you want to go there, you could look at [Pope and Stratton 2002](https://doi.org/10.1007/s00382-001-0222-8) and [Pope et al 2001](https://doi.org/10.1175/1520-0442(2001)014&lt;3065:TROWVA&gt;2.0.CO;2), although I have to say both do a bit of special pleading to rule out extra vertical resolution.)

Anyway, I thought it might be interesting to tabulate what sorts of resolution are actually needed for various tasks. It's important to note that LFR89's analysis comes up with different resolutions for different tasks and at different latitudes. So, if we're to take LFR89 at face-value and we're interested in quasi-geostrophic scales, then we can extend their table to modern model resolutions:

| dx(deg) | dx equator | dz 60 | dz 45 | dz 22.5 |
|---------|------------|-------|-------|---------|
| 0.25    | 1m (!!)    | 84m   | 97m   | 69m     |
| 0.5     | 3m (!!)    | 170m  | 190m  | 140m    |
| 1       | 14m (!!)   | 340m  | 390m  | 270m    |
| 2       | 54m (!!)   | 670m  | 780m  | 550m    |
| 5       | 340m       | 1700m | 1900m | 1400m   |

Clearly there is a problem with this analysis in the tropics at all scales, and everywhere at 25km. Common sense suggests one can't have atmospheric phenomena with horizontal scales of over 50km with vertical scales of 1m. Pretty obviously the scaling assumptions that underly the LFR89 use of quasi-geostrophy are broken.  Which brings us to a moot point in interpreting LFR89. If one starts with a QG equation, we've already rejected a bunch of small scales which LFR89 have coming out of the analysis at modern high resolution scales. We probably need to rethink the analysis! (Which is to say, here and now, I'm not going to do that rethinking :-).[^1]

Fortunately for me (in terms of analysis), right now, I'm less interested in the large-scale horizontal flows, but in gravity waves. There the analysis of LFR89 is a bit more timeless. However, the analysis pretty much says, if you're interested in breaking gravity waves you need infinite resolution. However, they then back off and do a bit of a fudge around effective damping to suggest to resolve gravity wave processes one need resolutions of roughly 0.006*the grid resolution in degrees. For the horizontal resolutions above, that gives us something like 1.5,3,6,12 and 30m vertical resolutions.

That doesn't look likely any time soon!

Another approach is to look at what people have thought they need (and why). One of the reasons I started all this thinking was because I was wondering how easy it would be to repeat [Watanabe et al (2008)](https://doi.org/10.1029/2008JD010026)'s work with the UM. Watanabe et al used a T213L256 model with a model top at 85km, having done a lot of previous work evaluating L250 type models. This is roughly a 0.5 degree model using the table above, and has an average vertical resolution of about 300m, which is not too far from LFR89 in the table above (at least using the value of N discussed in the footnote). Most other models seem to fall well short of that. For the UM, even studies which look at resolved gravity waves in the stratosphere have relatively coarse resolutions, e.g. [Shutts and Vosper (2011)](https://doi.org/10.1002/qj.763) use 70 levels to a model top at 80km (again with a model resolution around 0.5 degrees). However, in that model the standard configuration had a time-stepping regime which filtered out resolved gravity waves, so the vertical resolution was constrained by being the same as the standard model, when used in a model which didn't filter gravity waves. Similarly,  [Bushel et al (2010)](https://doi.org/10.1029/2009JD013340) in a study looking at tropical waves and their interaction with ozone use, used a relatively low horizontal and vertical resolution (between 1 and 4 degrees horizontally) and L60 to 84km - but again, resolved gravity waves were filtered out, and parameterisations were used.

As an aside, one of the arguments in [Pope et al 2001](https://doi.org/10.1175/1520-0442(2001)014&lt;3065:TROWVA&gt;2.0.CO;2) as to why vertical resolution is less important in the tropics is a reference to [Nigam et al 1986](https://doi.org/10.1175/1520-0469(1986)043&lt;2944:LSOTSE&gt;2.0.CO;2) who they assert show that non linear processes smooth fields
naturally so as to diminish vertical resolution requirements. This is one of the cases where I have some of my own opinions, see, for example [Rosier and Lawrence, 1999](https://doi.org/10.1002/qj.49712555912), discussing, amongst other things pancake structures with small vertical scales in the tropical stratosphere. Given it seems that there is now a body of evidence suggesting that the troposphere does react dynamically to the middle-atmosphere in climatically important ways, that brings me nicely back to wanting more vertical resolution ... even if we buy that it's not needed in the troposphere, and I'm a long way from buying that ... yet (*particularly given recent results looking at blocking and resolution in CMIP5 models: [Anstey et al, 2013](https://doi.org10.1002/jgrd.50231/).*)

However, for the UM, before I worry too much about the vertical resolution, I've got to get to the bottom of the time-step filtering I alluded to above.

[^1]: That said, to repeat their table, I had to replace a 3 in their approximation for N with a 2, and in fact, I'd rather use a tropospheric average of N~0.012, in which case we get nearly a factor of 2 larger required resolution. However, the fundamental issue is still that I would prefer to work through the assumptions of the QG approximation, I think there is a problem in there ... but I don't have time now.

#### comments (1)

*[bryan's trackback]( {% post_url oldblog/2013-09-18-vertical_resolution %}) (on Wednesday 18 September, 2013)*
Last week I pointed out that I wasn't at all sure the analysis by LFR89 really applied at modern horizontal grid resolutions, since the vertical scales implied for quasi-geostrophic motion didn't make sense.
I've done a wee bit more delving, and now I'm sure it's not appropriate ...
