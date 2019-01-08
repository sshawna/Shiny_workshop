# server
observeEvent(input$modal1,{
  showModal(modalDialog(
    tags$iframe(style="height:800px; width:100%; scrolling=yes", 
                src="IGFS Introduction.pdf"),
    title= "Introduction to the Irish Groundfish Survey",
    easyClose = TRUE,
    footer = NULL))
})


# ui
actionButton("modal1", "Introduction")