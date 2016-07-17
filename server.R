library(shiny)
library(leaflet)

psfdata <- readOGR( "shp/states_per_square_foot.shp", layer="states_per_square_foot", verbose=F )
pal <- colorNumeric( palette="YlGnBu", domain=c(40,500) )

shinyServer( function( input, output, session ) {

     results <- reactive({
          psfdata[,paste( 'PSF', input$selected_year ,sep="_" )]
     })
     
     output$psfmap <- renderLeaflet({
          
          leaflet(psfdata) %>%
          fitBounds(
               -118.848974,
               24.396308,
               -58.885444,
               49.384358
          ) %>%
          addProviderTiles( 
               "Esri.WorldTerrain",
               options = providerTileOptions( noWrap=T )
          ) %>%
          addLegend(
               pal=pal,
               values=c(40,500),
               position="topright",
               title="$ per SqFt",
               labFormat=labelFormat(prefix=" $")
          )
          
     })

     observe({
          
          showcol <- paste( 'PSF', input$selected_year ,sep="_" )
          newmap <- leafletProxy( "psfmap", data=psfdata[,showcol] )
          newmap %>% clearShapes()
          newmap %>% addPolygons(
               stroke=T,
               color="black",
               weight=0.2,
               fillOpacity=0.75, 
               smoothFactor=0.1,
               fillColor=~pal(psfdata@data[showcol]),
               popup=paste(
                    "In ",
                    psfdata@data$NAME,
                    ", the mean house costs<BR>about $",
                    as.character(psfdata@data[[showcol]]),
                    " per square foot in ",
                    input$selected_year,
                    sep=""
               )
          )
                    
     })
  
})
