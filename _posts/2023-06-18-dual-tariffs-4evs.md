---
layout: post
title: Dual Tariffs for EVs Don't Play Nicely with Heatpumps
last_modified:
categories:  ecolife
tags: ev
excerpt_separator:
image: /assets/images/2023-06-18-ev-power.svg
---

So we have an EV (a "2021 Vauxhall corsa e", since you asked). We had to get one in a hurry as our 2008 Seat Ibiza ecomotive died very suddenly and unexpectedly. We had always planned to replace with an EV, but imagined that would be in a year or two.  As we live in place with no public transport, and my wife and I both have o(20) mile commutes (in diffiferent directions), we had to buy a replacement in a hurry - without doing much due diligence, either around car or charging options.

We knew there were "EV tariffs" out there, and as an Octopus customer, it seemed like the "Intelligent Octopus" option would be our choice. However!
* You can use Intelligent Octopus if you either have the right charger, or the right model of car. 

Unfortunately the right charger needs a mobile signal at the charging point, and Vauxhall cars are not "the right models".

OK, we thought, Octopus Go would do, because apparently it is "perfect for electric vehicle drivers". Giving "super cheap energy overnight between 12:30am and 4:30am ...at just 9.5p per kWh." However!

It turns out that while it is super cheap energy during the wee small hours, it is far from super cheap during the rest of the day, and in fact, it's downright expensive - at least while the government Energy Price Guarantee (EPG) is in place, because, and this was a surprise, the guarantee doesnt not apply to dual use tariffs.

To see how that plays out, we can use the numbers currently available. Today, I pay about 32p a kWH on my single use tariff, and that's because of the EPG (48.49 less 16.57). The Octopus GO tariff is about 10p a kWH at night, and 41p during the day.

So, the value of the dual use tariff will depend on the balance of our night time and day time usage and that depennds on our overall usage and how many miles we drive (i.e., how much charging we need to do).

A big part of our usage is our winter heat pump usage. In the last three years for which we have full numbers available, we have used roughly (8000/4000, 9000/5000, 7400/4000) kWh where the first figure is the total, and the second figure is our heat pump usage. For reasons I'll discuss another day, we have the heat-pump more or less turned off between 11pm and 6am, so all our heat pump usage is daytime, and with a background base load of around 0.15kW, most of the overall usage is daytime too.

We have put 8000 miles as our estimated driving distance on the insurance for the Corsa, although given we both quite like driving it, that might be an underestimate.

Well, that's our figures, what about typical figures?  A bit of Googling [gives](https://www.ofgem.gov.uk/information-consumers/energy-advice-households/average-gas-and-electricity-use-explained) 1800-4300 kWh for typical electricity usage (clearly these folks don't have heat pumps).  Average driving distances are harder to obtain with no real authorative source, but two figures from the web are [5300](https://www.gov.uk/government/statistical-data-sets/nts09-vehicle-mileage-and-occupancy) to [6800](https://www.nimblefins.co.uk/cheap-car-insurance/average-car-mileage-uk) miles.

Putting all that together:

{% include image.html url="/assets/images/2023-06-18-ev-power.svg" caption="Annual difference between single tariff and dual use tariff. The yellow shaded region is where we might lie, and the brown shaded region is _average_ UK" width="500" align="center" %}

We can see that our usage, being heat pump people, and with signficant commutes, is far from typical, and that dual 
ev tariffs probably suit most folks who do not have a heat pump. But if you do, and especially if you don't drive long
distances, a single tariff makes the most sense.

Caveat: all these figures depend on the gap between the single tariff rate and the dual tariff rate, which in practice means
they depend on the EPG. If that disappears, this calculation will clearly need revisiting.



