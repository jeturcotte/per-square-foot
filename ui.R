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
               top = 280,
               left = 600,
               sliderInput(
                    "selected_year",
                    "Year",
                    min=1996,
                    max=2016,
                    value=2000,
                    sep=""
               )
          ),
          mainPanel(
               h1("The Cost of Housing, by the Square Foot"),
               p("This simple app merely displays the mean price
                 per square foot for housing within each state across
                 a slew of years, as recorded by Zillow.com."),
               h4("These amounts are not (yet) adjusted for inflation.")
               
          )
     )

)
