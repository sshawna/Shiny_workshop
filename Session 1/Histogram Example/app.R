library(shiny)

ui<-fluidPage(
  numericInput( inputId = 'n', label = 'Sample Size', value = 25),
  plotOutput( outputId = 'histogram')
)

server<-function(input, output){
  output$histogram <- renderPlot({ hist(rnorm( input$n )) })
}

shinyApp(ui,server)


