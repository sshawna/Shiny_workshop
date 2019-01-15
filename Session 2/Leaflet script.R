##This is a subsection of code taken from the IGFS main page for illustrative 
##purposes only, it will not run by itself

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
# This observer is responsible for maintaining the circles and legend, histogram and gauges
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
  
  #leafletProxy creates a map-like object that can be used to customise
  #and control a map that has already been rendered
  leafletProxy("map", data = mapdata1()) %>%
    clearShapes() %>% 
    addCircles(~Longitude,~Latitude, radius= radius, layerId=~PrimeStation,                  
               stroke=FALSE,fillOpacity=0.7, fillColor=pal(colorData)) %>% 
    addLegend("bottomleft", pal=pal, values=colorData, title=colorBy,
              layerId="colorLegend")
})
