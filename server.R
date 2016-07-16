library(shiny)
library(leaflet)

shinyServer(function(input, output, session) {

     filteredData <- reactive({
          quakes[quakes$mag >= input$range[1] & quakes$mag <= input$range[2],]
     })
     
     colorpal <- reactive({
          colorNumeric(input$colors, quakes$mag)
     })
     
     output$map <- renderLeaflet({
          leaflet(quakes) %>% 
               addTiles() %>%
               fitBounds(
                    ~min(long),
                    ~min(lat),
                    ~max(long),
                    ~max(lat)
               )
     })
     
     observe({
          pal <- colorpal()
          leafletProxy(
               "map",
               data=filteredData()
          ) %>%
          clearShapes() %>%
          addCircles(
               radius=~10^mag/10,
               weight=1,
               color="#777777",
               fillColor=~pal(mag),
               fillOpacity=0.7,
               popup=~paste(mag)
          )
     })

     observe({
          proxy <- leafletProxy(
               "map",
               data=quakes
          )
          proxy %>% clearControls()
          if (input$legend){
               pal <- colorpal()
               proxy %>% addLegend(
                    position="bottomright",
                    pal=pal,
                    values=~mag
               )
          }
     })
})
