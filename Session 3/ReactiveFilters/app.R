#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Reactive Filter"),
   
   mainPanel(fluidRow(column(3,uiOutput("speciesSelector")),
                          column(5,uiOutput("DescSelector")))
                 )
)


server <- function(input, output) {
   
  ICEStable=read.csv('ICES-New-Old - extra species.csv', header=TRUE)
  ICEStable$Fish=as.character(ICEStable$Fish)
  ICEStable$SpeciesByDiv=as.character(ICEStable$SpeciesByDiv)
  Speciesfilter <- unique(ICEStable$Fish)
  output$speciesSelector <- renderUI({
    selectInput("speciesfilter", h3("Select Species"), as.list(Speciesfilter), selected = "Cod") 
  })
  output$DescSelector <- renderUI({
    SpeciesbyDiv=filter(ICEStable, Fish %in% c(input$speciesfilter))
    Descriptions <- unique(SpeciesbyDiv$SpeciesByDiv)
    selectInput("speciesbydiv", h3("Select Stock Area"), as.list(Descriptions), selected = Descriptions[1])
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

