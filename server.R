library(shiny)
library(leaflet)

psfdata <- readOGR( "shp/states_per_square_foot.shp", layer="states_per_square_foot", verbose=F )

shinyServer( function( input, output, session ) {

     output$mymap <- renderLeaflet({
          
          leaflet(psfdata) %>%
          addProviderTiles( 
               "CartoDB.Positron",
               options = providerTileOptions( noWrap=T )
          ) %>%
          addPolygons( 
               stroke=F, 
               fillOpacity=0.75, 
               smoothFactor=0.2, 
               color=~colorQuantile("Blues", psfdata$X2015_11)(X2015_11)
          ) %>%
          fitBounds(
               -124.848974,
               24.396308,
               -66.885444,
               49.384358
          )
          
     })
          
})
