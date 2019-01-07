# Example 1-2
# First attempt to develop shiny apps with printing certain text in output area

library(shiny)

ui <- fluidPage(
  titlePanel("Title of Application"),
  sidebarLayout(
    sidebarPanel("Sidebar Control Panel"),
    mainPanel(
      fluidRow(
        column(width = 6,textOutput("txt1")),
        column(width = 6, textOutput("txt2"))
        )
      )
    )
)

server <- function(input, output){
  output$txt1 <- renderPrint({
    "My first attempt to Shiny apps"
  })
  
  output$txt2 <- renderText({
    "My first attempt to shiny apps"
  })
}

shinyApp(ui,server)