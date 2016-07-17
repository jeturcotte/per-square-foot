# The Cost of Housing, by the Square Foot

This simple app merely displays the mean price per square foot for housing within each state across a slew of years, as recorded by Zillow.com.  The point here is to explore how the price of housing has increased over time.  Further extrapolations beyond this can include taking that as a measure of cost-of-living concerns in the same mapped area, versus mean income, et cetera.

# Using This Appplication

The use of this application is extremely simple at this early stage.  Simply drag the sliding bar through the years and forgive the moment's refresh of the map to see the differences not only between the states, but within the states over time as well.

Notice that not every state has provided information, and that some begin providing information during the increase of the measured years.

# Attributions

* https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html - The Census Bureau has freely provided the ESRI shape files necessary for the drawing of the polygons on this map.
* http://www.zillow.com/research/data/ - Zillow.com has freely provided the data, in this case by-state, about the mean price per square foot of housing.  They also have data by zipcode, county, metro area, et cetera, though all are slightly incomplete as some states did not provide needed information.
* http://www.bls.gov/data/inflation_calculator.htm - Bureau of Labor and Statistics, for determining the value of money in the past.

# Methodology

The data was assembled from Zillow.com by_state data, selecting only for the April figure for each year (given that no later was available for the 2016 data at the time of downloading.)   The RegionID was converted GEOID to match for the spatial .shp file provided by the U.S. Census Bureau to represent those shapes, albeit at the minimum resolution (1:20,000,000) to minimize load times, against which the Zillow data was subsequently joined.  Yearly inflation adjustments were then loaded and kept ready for the adjustment of Zillow data, should the toggle for inflation be on.
