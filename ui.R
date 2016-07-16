library(shiny)
library(leaflet)
library(RColorBrewer)

shinyUI(
     
     fluidPage(
          
          tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
          leafletOutput("psfmap"),
          absolutePanel(
               top = 300,
               right = 40,
               sliderInput(
                    "selected_year",
                    "Year",
                    min=1996,
                    max=2016,
                    value=2000,
                    sep=""
               )
          )
          
     )

)
