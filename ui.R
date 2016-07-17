library(shiny)
library(leaflet)
library(RColorBrewer)

shinyUI(
     
     fluidPage(
          
          theme = "psf.css",
          tags$style(
               type = "text/css",
               "html, body {width:100%;height:100%;margin:0px}"
          ),
          leafletOutput(
               "psfmap"
          ),
          absolutePanel(
               top = 260,
               left = 600,
               radioButtons(
                    "inflated",
                    "Adjust for Inflation?",
                    c( "Yes"=1, "No"=0 ),
                    inline=T
               ),
               sliderInput(
                    "selected_year",
                    "",
                    min=1996,
                    max=2016,
                    value=2000,
                    sep=""
               )
          ),
          mainPanel(
               h1("The Cost of Housing, by the Square Foot"),
               p("This simple app merely displays the mean price per square foot
                 for housing within each state across a slew of years, as recorded
                 by Zillow.com.  The point here is to explore how the price of
                 housing has increased over time.  Further extrapolations beyond
                 this can include taking that as a measure of cost-of-living concerns
                 in the same mapped area, versus mean income, et cetera."),
               h1("Using This Application"),
               p("The use of this application is extremely simple at this early 
                 stage.  Simply drag the sliding bar through the years and forgive 
                 the moment's refresh of the map to see the differences not only 
                 between the states, but within the states over time as well."),
               p("Click on any state to see the precise mean price per square foot."),
               p("By default, the dollar figures are being displayed in 2016 dollars;
                 i.e., adjusted for inflation.  You can adjust that above by selecting
                 for whether inflation is on or off."),
               h1("Attributions"),
               tags$ul(
                    tags$li(
                         tags$a("https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html"),
                         tags$span(" - The Census Bureau has freely provided the ESRI shape
                                   files necessary for the drawing of the polygons on this map.")
                    ),
                    tags$li(
                         tags$a("http://www.zillow.com/research/data/"),
                         tags$span(" - Zillow.com has freely provided the data, in this case
                                   by-state, about the mean price per square foot of housing.
                                   They also have data by zipcode, county, metro area,
                                   et cetera, though all are slightly incomplete as some
                                   states did not provide needed information.")
                    ),
                    tags$li(
                         tags$a("http://www.bls.gov/data/inflation_calculator.htm"),
                         tags$span(" - Bureau of Labor and Statistics, for determining the value
                                   of money in the past.")
                    )
               ),
               h1("Methodology"),
               p("The data was assembled from Zillow.com by_state data, selecting 
                 only for the April figure for each year (given that no later was 
                 available for the 2016 data at the time of downloading.)   The 
                 RegionID was converted GEOID to match for the spatial .shp file 
                 provided by the U.S. Census Bureau to represent those shapes, 
                 albeit at the minimum resolution (1:20,000,000) to minimize load 
                 times, against which the Zillow data was subsequently joined.  
                 Yearly inflation adjustments were then loaded and kept ready for 
                 the adjustment of Zillow data, should the toggle for inflation be on.")
          )
     )

)
