library(shiny)
library(leaflet)

psfdata <- readOGR( "shp/states_per_square_foot.shp", layer="states_per_square_foot", verbose=F )
pal <- colorNumeric( palette="YlGnBu", domain=c(40,500) )

shinyServer( function( input, output, session ) {

     output$mymap <- renderLeaflet({
          
          leaflet(psfdata) %>%
          addPolygons( 
               stroke=T,
               color="black",
               weight=0.2,
               fillOpacity=0.75, 
               smoothFactor=0.2, 
               fillColor=~pal(1996)
          ) %>%
          fitBounds(
               -120.848974,
               24.396308,
               -60.885444,
               49.384358
          ) %>%
          addLegend(
               pal=pal,
               values=c(40,500),
               position="topright",
               title="$ per SqFt",
               labFormat=labelFormat(prefix=" $")
          )
          
     })
          
})
