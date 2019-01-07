# Example 1-3
# To generate random number from standard normal distribution and then calculate mand & SD
# To display calculated mean and SD in output area in two different columns 
# Important things to notice in this particular output is that,
#  mean and SD value are different in two columns though we have generated the random numbers


library(shiny)

ui <- fluidPage(
  titlePanel("Mean and SD of a Random Variable"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Sample Size", min = 1, max = 10000, 
                  value = 10, step = 10)
    ),
    mainPanel(
      fluidRow(
        column(width = 6,textOutput("txt1")),
        column(width = 6, textOutput("txt2"))
      )
    )
  )
)

server <- function(input, output){
  output$txt1 <- renderText({
    x <- rnorm(n=input$n)
    paste("Mean = ",paste(round(mean(x),digits = 2)),
          paste("  Standard deviation = "), 
          paste(round(sd(x),digits = 2)),sep = "")
  })
  
  output$txt2 <- renderText({
    x <- rnorm(n=input$n)
    paste("Mean = ",paste(round(mean(x),digits = 2)),
          paste("  Standard deviation = "), 
          paste(round(sd(x),digits = 2)),sep = "")
  })
}

shinyApp(ui,server)