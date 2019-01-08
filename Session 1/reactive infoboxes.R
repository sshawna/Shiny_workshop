# server
## Box2
biggestkg <-  reactive({
  max(stnInView()$CatchKg, na.rm=TRUE)
})
maxKG <- reactive({
  formatC(biggestkg(),digits = 1, format = "d", mode = "integer", big.mark = ",")
})

# ui
valueBoxOutput("box2")