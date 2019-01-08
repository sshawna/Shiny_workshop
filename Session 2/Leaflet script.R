# ui
leafletOutput("map", height=650)


# server
##### Interactive Map 1 - Timeseries #####
# Create the map - leaflet 
output$map <- renderLeaflet({
  leaflet() %>% 
    addProviderTiles(providers$Esri.OceanBasemap) %>% 
    setView(lng = -8.2124, lat = 53.2734, zoom = 6)
})

# Filtering for Mapping 
mapdata1 <- reactive({
  subset(mapdata, Year %in% input$slideryear)
})

##### Observer D #####
# This observer is responsible for maintaining the circles and legend,histogram and gauges
# according to the variables the user has chosen to map/display in the "station explorer"   
observe({
  colorBy <-  input$catch_measure
  if(colorBy=="Number of fish (per hour)") {
    colorData <-  mapdata1()$RaisedNo
    pal <- colorNumeric("viridis", colorData)
    radius <- (mapdata1()$RaisedNo / max(mapdata1()$RaisedNo)) * 80000
  }else if(colorBy=="Biomass (Kg)"){
    colorData <-   mapdata1()$CatchKg
    pal <-  colorNumeric("magma", colorData)
    radius <- (mapdata1()$CatchKg/ max(mapdata1()$CatchKg)) *60000
  }
  
  leafletProxy("map", data = mapdata1()) %>% 
    clearShapes() %>% 
    addCircles(~Longitude,~Latitude, radius= radius, layerId=~PrimeStation,                  
               stroke=FALSE,fillOpacity=0.7, fillColor=pal(colorData)) %>% 
    addLegend("bottomleft", pal=pal, values=colorData, title=colorBy,
              layerId="colorLegend")
})

# Show a popup at the given location
showStnPopup <- function(PrimeStation, Latitude, Longitude) {
  selectedStn <- mapdata1()[mapdata1()$PrimeStation == PrimeStation,]
  content <- as.character(tagList(
    tags$strong("Survey Station:", selectedStn$PrimeStation), 
    tags$br(),
    tags$strong("Survey year:", selectedStn$Year),
    tags$br(),
    tags$strong("Catch:", as.integer(selectedStn$CatchKg), "kg"),
    tags$br(),
    tags$strong("Number of fish per hour:", as.integer(selectedStn$RaisedNo)),
    tags$br()
  ))    
  leafletProxy("map") %>% addPopups(lng=selectedStn$Longitude, lat=selectedStn$Latitude, 
                                    popup= content, layerId= PrimeStation, options = popupOptions()) 
}

# When map is clicked, show a popup with info
observe({
  leafletProxy("map") %>% clearPopups()
  event <- input$map_shape_click
  if (is.null(event))
    return() 
  isolate({
    showStnPopup(event$id, event$Latitude, event$Longitude)
  })
}) 