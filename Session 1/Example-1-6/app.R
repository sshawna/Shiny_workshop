# Example 1-6
library(shiny)

ui <- 
  fluidPage(
    titlePanel("Example-1-6: Uploading data file"),
    sidebarLayout(
      sidebarPanel(
        fileInput('file1', 
                  'Choose CSV File', accept=c('text/csv',
                                              'text/comma-separated-values,text/plain', '.csv'))
      ),
      mainPanel(
        tableOutput("tbl")
      )
    )
  )


server <- 
  function(input,output){
    # Defining reactive function to take dataset input dynamically
    dataInput <- reactive({
      inFile <- input$file1
      if (is.null(inFile))
        return(NULL)
      read.csv(inFile$datapath, as.is=T)
    })
    
    output$tbl <- renderTable({
      dat <- dataInput()
      head(dat)
    })
  }

shinyApp(ui,server)