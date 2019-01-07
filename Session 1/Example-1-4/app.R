# Example 1-4

library(shiny)

ui <- fluidPage(
  titlePanel("Mean, SD and Histogram of a Random Variable "),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Sample Size", min = 1, max = 1000, value = 10)
    ),
    mainPanel(
      fluidRow(
        column(width = 6,textOutput("txt1")),
        column(width = 6, textOutput("txt2"))
      ),
      fluidRow(
        column(width = 6, plotOutput("plot1",height = 500))
      )
    )
  )
)

server <- function(input, output){
  getData <- reactive({
    x <- rnorm(n=input$n)
    x
  })
  output$txt1 <- renderText({
    paste("Mean = ",paste(round(mean(getData()),digits = 2)),paste("  Standard deviation = "), paste(round(sd(getData()),digits = 2)),sep = "")
  })
  
  output$txt2 <- renderText({
    x <- rnorm(n=input$n)
    paste("Mean = ",paste(round(mean(getData()),digits = 2)),paste("  Standard deviation = "), paste(round(sd(getData()),digits = 2)),sep = "")
  })
  
  output$plot1 <- renderPlot({
    hist(getData(),main = "Histogram", xlab = "")
  })
}

shinyApp(ui,server)