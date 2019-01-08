<<<<<<< HEAD
library(shiny)

ui<-fluidPage(
  numericInput( inputId = 'n', label = 'Sample Size', value = 25),
  plotOutput( outputId = 'histogram')
)

server<-function(input, output){
  output$histogram <- renderPlot({ hist(rnorm( input$n )) })
}

shinyApp(ui,server)


=======
library(shiny)

ui<-fluidPage(
  numericInput( inputId = 'n', label = 'Sample Size', value = 25),
  plotOutput( outputId = 'histogram')
)

server<-function(input, output){
  output$histogram <- renderPlot({ hist(rnorm( input$n )) })
}

shinyApp(ui,server)


>>>>>>> e5466b7ea72ed4e93912effaf1b8f10a2b87c10d
