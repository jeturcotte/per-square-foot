---
title       : Cost of Housing by the Square Foot
subtitle    : An exploration of the cost of housing over time
author      : J.E. Turcotte
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Looking for a Better Home

* Currently I live on the outskirts of the Washington, D.C, area.
* Cannot afford to live any closer, and even here I'm paying about $215 per square foot.
* I noticed that out east a bit, giant mansions were costling half as much, per square foot, as tiny apartments and studios even on the edge of the city, and far less than those actually in the city.

---

## An Unachievable Trend?


<!-- MotionChart generated in R 3.3.0 by googleVis 0.5.10 package -->
<!-- Sun Jul 17 17:20:28 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID145641a17867 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Apples",
2008,
"West",
98,
78,
20,
"2008-12-31" 
],
[
 "Apples",
2009,
"West",
111,
79,
32,
"2009-12-31" 
],
[
 "Apples",
2010,
"West",
89,
76,
13,
"2010-12-31" 
],
[
 "Oranges",
2008,
"East",
96,
81,
15,
"2008-12-31" 
],
[
 "Bananas",
2008,
"East",
85,
76,
9,
"2008-12-31" 
],
[
 "Oranges",
2009,
"East",
93,
80,
13,
"2009-12-31" 
],
[
 "Bananas",
2009,
"East",
94,
78,
16,
"2009-12-31" 
],
[
 "Oranges",
2010,
"East",
98,
91,
7,
"2010-12-31" 
],
[
 "Bananas",
2010,
"East",
81,
71,
10,
"2010-12-31" 
] 
];
data.addColumn('string','Fruit');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addColumn('string','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID145641a17867() {
var data = gvisDataMotionChartID145641a17867();
var options = {};
options["width"] =    600;
options["height"] =    500;
options["state"] = "";

    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID145641a17867')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID145641a17867);
})();
function displayChartMotionChartID145641a17867() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID145641a17867"></script>
 
<!-- divChart -->
  
<div id="MotionChartID145641a17867" 
  style="width: 600; height: 500;">
</div>

---

## A Look at the Cost of Housing



---

## Future Upgrades

* This is the first draft of the application
* Would be nice to add similar breakdown by county, by zipcode, metro area, et cetera.
* Would be nice to offer a trend plot for the entire nation as a time series, and extrapolate into the future with predictions
* Would be nice to offer a trend plot, per state or other regionality, perhaps even in each popup, of the same information
* Would be nice to map out the mean price per square foot as a function of local cost of living and wages (affordability.)
* Would be nice to make similar chart based on rent instead of purchase cost.


