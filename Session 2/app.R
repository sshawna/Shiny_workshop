

library(shiny)
library(shinythemes)

ui <- fluidPage(
  fluidRow(
    img(src="EMFF_logos.png")),
  fluidRow(themeSelector())
)



server <- function(input, output){
  
}

shinyApp(ui,server)


