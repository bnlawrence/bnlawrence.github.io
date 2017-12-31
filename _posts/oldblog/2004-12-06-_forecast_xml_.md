---
layout: post
title: forecast xml
last_modified: Tuesday 21 December, 2004
tags: xml climate
categories: computing environment
---
The U.S. National Weather service provide forecast data (apparently just for the continental US) via a SOAP service. It looks
very simple and very easy to use, with a simple [syntax](http://www.nws.noaa.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php). 
I only found out about it today, even though from the look of the site it has been around a while (the docs date from 2003, and the "trial" was supposed to end on the 1st of August).

Parameters supported are: 
* Maximum Temperature, Minimum Temperature, 3 hourly Temperature, Dewpoint Temperature, 12 hour Probability of Precipitation, Liquid Precipitation Amounts (Quantitative Precipitation Forecast), Snowfall Amounts, Cloud Cover Amounts, Wind Direction, Wind Speed, Sensible Weather, and Wave Heights.

The [NOAA XML](http://www.nws.noaa.gov/forecasts/xml) page is an amusing showing of how difficult it is to maintain a web site unless one is careful. There are a number of broken links, the text at the bottom claims it was last updated on the 4th of November, but the text in the body has clearly been updated a number of times since then.
