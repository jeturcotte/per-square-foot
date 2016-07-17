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
                    )
               )
               
          )
     )

)
