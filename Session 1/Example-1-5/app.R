# Example-1-5

# Input: Number of iteration and sample size
# Output: Density plot

# Defining user interface
library(shiny)

ui <-
  fluidPage(
    titlePanel("Example-1-5"), # This will be the title of the application
    sidebarLayout(
      sidebarPanel(
        selectInput("n", "Sample Size", c(10,50,100,1000),selected = 10),
        sliderInput("iter", "Number of iteration", min = 2, max = 10000, value = 2)
      ),
      mainPanel(
        plotOutput("plot1")
      )
    )
  )


server <- 
  function(input,output){
    dataInput <- reactive({
      set.seed(123456)
      binPop <- rbinom(n=100000, size=1, prob=0.3)
      binPop
    })
    output$plot1 <- renderPlot({
      dat <- dataInput()
      sampleDat <- sample(dat,size = input$n)
      allMean <- NULL
      for(i in 1:input$iter)
      {
       allMean[i] <- mean(sample(dat,size = input$n))
      }
      plot(density(allMean))
    })
  }


shinyApp(ui,server)