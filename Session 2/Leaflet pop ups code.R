##This is a subsection of code for illustrative purposes only, it will not run by itself

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