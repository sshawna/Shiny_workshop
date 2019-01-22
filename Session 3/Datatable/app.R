<<<<<<< HEAD
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

=======
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

>>>>>>> 0f71f546667273d41e91bdd8b2b87eef1c5f4185
