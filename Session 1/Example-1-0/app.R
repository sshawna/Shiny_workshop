# Example-1-0
# To show a blank webpage, the starting point of shiny apps

library(shiny)
library(shinythemes)

ui <- fluidPage(
 
  fluidRow(
    img(src="EMFF_logos.png"),
           themeSelector())
)



server <- function(input, output){
  
}

shinyApp(ui,server)

#runApp() #alternative to 'Run App' button
