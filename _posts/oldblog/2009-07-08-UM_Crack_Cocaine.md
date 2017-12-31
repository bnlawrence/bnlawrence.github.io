---
layout: post
title: UM Crack Cocaine
last_modified: Wednesday 08 July, 2009
categories: computing
tags: wrf um
---
One of the items of discussion at yesterday's NCAS advisory group was whether or not NCAS should be working with more than one mesocale model (currently we [do](http://ncas-cms.nerc.ac.uk/content/view/1415/252/), with significant efforts invested in both the Met Office [Unified Model](http://ncas-cms.nerc.ac.uk/content/view/67/26/) and the U.S. [WRF](http://www.wrf-model.org/) model).

The issues on the table included:
* Can we support the model users for two models? Answer: yes, because we ([NCAS CMS](http://ncas-cms.nerc.ac.uk/)) support the academic Unified Model users, and NCAR [support](http://www.mmm.ucar.edu/wrf/users/support.html) the WRF users, so WRF requires relatively little NCAS support.
* Does the use of WRF contribute towards numerical weather prediction (NWP) (as opposed to understanding of weather processes)? Answer: not directly, in the UK! But we're told that because WRF is currently "easier" to use than the UM, it's easier to build a wider community of modellers, who one might then move onto the more complex environment of the Unified Model, and then contribute directly to UK NWP improvements. (And, in any case, the NCAS role in this area is really about "basic underpinning science" not about direct measured improvemetns in NWP, which in the UK is primarily a Met Office issue).

I just couldn't help feeling that WRF was being seen as the entry level drug for the academic UK NWP community to the UM crack-cocaine. But maybe I was just looking for anything to enliven two days of committee meetings ...

#### trackbacks (1)

*[How do people decide which model to use?](http://www.easterbrook.ca/steve/?p=741) (from "Serendipity" on (on Monday 20 July, 2009)*)

In our climate brainstorming session last week, we invited two postdocs (Chris and Lawrence) from the atmospheric physics group to come and talk to us about their experiences of using climate models. Most of the discussion focussed on which models they...

#### comments (4)

*[Adrian](a.p.kybett@leeds.ac.uk) (on Wednesday 08 July, 2009)*

If only there was a way to harness the "off-agenda" energy and ideas we were no doubt all pondering much of the time!

*[Steve Easterbrook](http://www.easterbrook.ca/steve) (on Wednesday 08 July, 2009)*

Bryan: How much do you think the perceived difficulty of using the UM is due to the weaknesses of the model configuration editor (UMUI), versus something more fundamental about the UM itself?

PS Love the drug metaphor!

*Bryan (on Thursday 09 July, 2009)*

In truth I don't know the answer ... but here's my guess: I think for mesoscale models one often wants different configurations and resolutions and resetting those (reconfiguring ancillary and boundary files) is (more of) a hassle for the UM. I suspect that the umui, while an issue, probably isn't the main problem ... but I'll ask around and get an opinion from someone a bit closer ...

*Alan Gadian (on Monday 20 July, 2009)*
Bryan,

Well the truth is rather complicated and boring.

1. Setup.  You can set up WRF within a few hours (on a linux system / pc
/ laptop , and download the software for free).  The UM requires a license
and software that may not be easy to obtain.  WRF Easy to run (too easy in
fact as everyone uses as a black box!) and thus dangereous.

2. Output.  Graphics and o/p are
designed to be fast and efficient on the UM, for forecasts and climate
runs.  On WRF it is slow, but very flexible, to look at specific odd
requests.  O/p in WRF is netcdf .. easy (but not ideal).  o/p in um
is in pp format to be converted with stash codes. Painful for average
3 year phd / pdra student.

3. Speed.  UM is probably about 10 times faster than WRF.  WRF uses
shorter time steps and split for velocities and pressure.  UM uses
semi lagrangian, and does not solve for pressure with atime step
but solving a poisson equation ... Very nice and efficient, but
if want to look at waves where the cfl is important, then you have
to run smaller steps, but still faster than WRF.  So for process studies
UM is faster, but not easy to modify the code (where is teh
documentation?)

4. Computation.  The Met Office has always had computers which are suited
to the task.  UK universities (subject to the powerful astronomy and
physics community) have always bought massively parallel computers.  NWP
I believe is a vector process, waves of different wavenumbers affecting
each point.  So when WRF can run on 100,000 cores (if you believe it)
UM has problems with 1,000 cores, unless you can have nodes, shared memory
etc. WRF was written for mpi computers so has the advantage (at present).
When you get 500,000 cores, all models will need rewriting.  No one
has addresses parallel o/p and it doesn't work!!

5. Processes.  WRF you can easily use a multitude of microphysics schemes,
bl schemes, write your own and insert.  Great if you want to test it out.
The MO had blasius and lem .. but .. AGAIN, problems with mp computers,
which mean whereas the US guys are running cloud simulations 300*300*100,
we are stuck with 100*100*60 (and slowly).  The MO can not support the community.

6. Help and support .. WRF Huge support network.  All the UM has is a
group at Reading (overworked)  and hard work if not at Reading.  WRF is
usedaround the world.  Frequent user meetings, 3 p.a .. The UM is having its
1st user meeting in November.

 So solution .. rewrite the um, to run on  mp computers.  Would be great
for UK academic community and MO, who need help, with MOD etc axes
around. So far, no chance  of getting funding from NERC as they keep
bouncing my grant applications.  I keep jumping up and down (should really
slap more FOIs on them, if I really want improvements, but chicken out)
It is depressing.  I suspect the MO will not have the resources to fund
the rewrite except for their NWP.  New grids, Yan-Yin, cubed sphere etc
are needed. WRF / DWD are already investing in examining alternatives ..
NERC is just saying apply for grants .. oops blue skies is for science
not technology ... oops ke is not for this ... ooops a new thematic action
on this (next year?, next year?, some time never?)

Alan
