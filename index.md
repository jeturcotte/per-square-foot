--- 
title       : Cost of Housing by the Square Foot
subtitle    : An exploration of the cost of housing over time
author      : J.E. Turcotte
job         : 
framework   : io2012   
highlighter : highlight.js 
hitheme     : tomorrow
widgets     : []           
mode        : selfcontained 
knit        : slidify::knit2slides
--- 

## Looking for a Better Home

* Currently I live on the outskirts of the Washington, D.C, area in Northern Virginia.  'Outside the Beltway,' if only just.
* I have, in the past, lived a great deal of time in Maine... a place I'd like to go back to before I get too old to appreciate it.
* I've recently be introduced to an area of Maryland that is quite tempting and still within a cehvy volt's battery capacity of work.
* Cannot afford to live any closer to work, and even here I'm paying about $215 per square foot, which makes living here, even on a 'decent' salary anywhere else a tad challenging.
* And yet, if I look half a mile north to the other side of the beltway, that price could double easily.

So, to satisfy my own curiosity (as well as satisfy a learning assignment), I took this opportunity to explore the data.

---

## An Unachievable Trend?

Interestingly enough, it looks as though D.C. more than recovered from the housing/banking crisis, while my native state *seems* to have fallen into a second pitfall, probably due to globalism.

<img src="assets/fig/simple plot-1.png" title="plot of chunk simple plot" alt="plot of chunk simple plot" style="display: block; margin: auto;" />

Sadly, even as the jobs are being pulled into the cities, this one, at least, appears to be accelerating away from affordability.  The ratio in difference between the four in 2000 is significantly less acute than in 2015.

---

## A Quick Look across the Lower 48

![A Screenshot of Per-Square-Foot](assets/img/screenshot.png)

Thus, I introduce the first rudimentary version of the [Per Square Foot](https://jeturcotte.shinyapps.io/per-square-foot/) application which, for now, shows the mean square foot price for housing across most of the lower 48 states, both in the dollars of the time, and adjusted to the value of the 2016 dollar.

---

## Future Upgrades

* Would be nice to add similar breakdown by county, by zipcode, metro area, et cetera.
* Would be nice to offer a trend plot for the entire nation as a time series, and extrapolate into the future with predictions
* Would be nice to offer a trend plot, per state or other regionality, perhaps even in each popup, of the same information
* Would be nice to map out the mean price per square foot as a function of local cost of living and wages (affordability.)
* Would be nice to make similar chart based on rent instead of purchase cost.

