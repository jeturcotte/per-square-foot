library(shiny)
library(leaflet)
library(rgdal)

psfdata <- readOGR( "shp/states_per_square_foot.shp", layer="states_per_square_foot", verbose=F )
pal <- colorNumeric( palette="YlGnBu", domain=c(40,500) )
inflate_by <- data.frame(
     JAN_2016 = 0.0,
     JAN_2015 = 0.0047,
     JAN_2014 = 0.0059,
     JAN_2013 = 0.0222,
     JAN_2012 = 0.0372,
     JAN_2011 = 0.0587,
     JAN_2010 = 0.0921,
     JAN_2009 = 0.1100,
     JAN_2008 = 0.1060,
     JAN_2007 = 0.1485,
     JAN_2006 = 0.1812,
     JAN_2005 = 0.2193,
     JAN_2004 = 0.2606,
     JAN_2003 = 0.2942,
     JAN_2002 = 0.3237,
     JAN_2001 = 0.3446,
     JAN_2000 = 0.3829,
     JAN_1999 = 0.4296,
     JAN_1998 = 0.4609,
     JAN_1997 = 0.4837,
     JAN_1996 = 0.5177
)

# make sure the popups can handle NA values
discussState <- function( name, vals, year, is_inflated, inflate_point ) {
     msg <- "<h4>State: %s<br>Year: %d<br>Sq.Ft: $%.2f</h4>"
     if (is_inflated==1) {
          return( sprintf( msg, name, year, vals + (vals * inflate_by[[inflate_point]]) ) )
     }
     sprintf( msg, name, year, vals )
}

measureState <- function( vals, is_inflated, inflate_point ) {
     if (is_inflated==1) {
          return( vals + ( vals * inflate_by[[inflate_point]] ) )
     }
     vals
}

# the data interpretation server itself
shinyServer( function( input, output, session ) {

     # set up the basic map first
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

     # be on the lookout for changes from our input
     observe({
          
          showcol <- paste( 'PSF', input$selected_year ,sep="_" )
          inflation <- paste( 'JAN', input$selected_year ,sep="_" )
          
          newmap <- leafletProxy( "psfmap", data=psfdata[,showcol] )
          newmap %>% clearShapes()
          newmap %>% addPolygons(
               stroke=T,
               color="black",
               weight=0.2,
               fillOpacity=0.75, 
               smoothFactor=0.1,
               fillColor=~pal( 
                    measureState(
                         psfdata@data[showcol],
                         input$inflated,
                         inflation
                    )
               ),
               popup=discussState( 
                    psfdata@data$NAME, 
                    psfdata@data[[showcol]], 
                    input$selected_year, 
                    input$inflated,
                    inflation
               )
          )
                    
     })
  
})
