---
layout: post
title: vertical resolution
last_modified: Thursday 19 September, 2013
tags: dynamics
categories: environment
---
[ Last week]({% post_url oldblog/2013-09-09-vertical_and_horizontal_resolution %}) I pointed out that I wasn't at all sure the analysis by LFR89 really applied at modern horizontal grid resolutions, since the vertical scales implied for quasi-geostrophic motion didn't make sense.

I've done a wee bit more delving, and now I'm sure it's not appropriate. The analysis LFR89 did was based on the solutions of the "quasi-geostrophic psueudo-vorticity equation". This is a venerable equation, first derived by a couple of folks, but formalised by Jules Charney. It's derived by carrying out a scale analysis of the primitive equations of motion, suitable for ''large scale motions where departures from hydrostatic and geostrophic equilibrium are small". I still haven't done the rederivation myself (it's a lot of bookwork, and desultory attempt to setup sympy to do it ran out of time), but Charney himself ([Charney,1971](https://doi.org/10.1175/1520-0469(1971)028&lt;1087:GT&gt;2.0.CO;2)) in an interesting paper (of some relevance here) put some bounds on the various scales of validity (see his equation 9). As a consequence , Charney points out that these equations define a  *band* of specific horizontal and vertical scales! The fastest way to get to that *band* is to go back to the fuller derivation in [Charney and Stern, 1961](https://doi.org/10.1175/15200469(1962)019%3C0159:OTSOIB%3E2.0.CO;2) where we get the constraints laid out more easily in the scale analysis. In particular, the quasi-Boussinesq and hydrostatic approximations give us:<blockquote>L<sup>2</sup>/D &lt; g/f<sup>2</sup> (~10<sup>9</sup>) and D/L &lt; 0.1
</blockquote>

Putting L=100km into those equations suggest that D should lie between 1 and 10km, which isn't quite the same as we get from the assertion in LFR89, that **all** vertical scales may appear and they are related to the expression:<blockquote>L = D * N/f
</blockquote>

(which gives us D=1km, which I think is more to do with the scales of the baroclinic **wave** solutions to the QG equation). Of course this scale analysis needs to be evaluated carefully in practice, and in particular, ever smaller values of L and D may have those kinds of wave solutions in the QG equations, but the equations themselves are no longer valid.

I'd be happy if someone could be bothered to do the derivation with constraints properly, and evaluate them completely for all scales, but until they do, I'm not going to invest too much more time in using LFR89 to give me "large" scale constraints on the vertical resolution.

Charney's paper is interesting and relevant since it also points out that the larger scales do not feed energy to the smaller scales, but it says nothing significant about other scales, such as those involved in fronts and blocking and gravity waves. As I've already argued, I think these tell us more of what we need to know. That's where we'll go next.

*Update 19/09/13*: I have slightly edited this post since when I didn't like the tone of a particular sentence when the dust had settled; on rereading it a day later it carried connotations that were not intended. I fixed that and added a clarifying sentence or two.
