library(shiny)

# Define UI for application that draws a histogram
ui = fluidPage(
  uiOutput("tab"),
  htmlOutput("text")
)

# Define server logic required to draw a histogram
server = function(input, output, session){
  url = a("Google Homepage", href="https://www.google.com/")
  output$tab = renderUI({
    tagList("URL link:", url)
  })
  
  
  output$text = renderText({
    paste("Some test text here. Click the link that follows: see" ,
    a(href=paste0("https://www.marine.ie/Home/home"),
      "Click Here",target="_blank"))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

