<<<<<<< HEAD
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("ggplot Example"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotlyOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlotly({
      # generate bins based on input$bins from ui.R
     #Using old Faithful volcanic data, eruptions and wait time
      ggplot(faithful, aes(waiting)) + 
        geom_histogram(breaks=seq(min(x), max(x), length.out = input$bins + 1),
                       col="blue", 
                       fill="green", 
                       alpha = .2)   #, 
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

=======
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("ggplot Example"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotlyOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlotly({
      # generate bins based on input$bins from ui.R
     #Using old Faithful volcanic data, eruptions and wait time
      ggplot(faithful, aes(waiting)) + 
        geom_histogram(breaks=seq(min(x), max(x), length.out = input$bins + 1),
                       col="blue", 
                       fill="green", 
                       alpha = .2)   #, 
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

>>>>>>> 9133c36e44b9aa75c5a5ba0829d191ea93908466
