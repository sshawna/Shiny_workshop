library(DT)
library(shiny)

ui <- fluidPage(
  h2("Datatable Exploration"),
  DT::dataTableOutput('tbl1')
)

server <- function(input, output) {
  output$tbl1 <- DT::renderDataTable(iris)
}

# Run the application 
shinyApp(ui,server)

