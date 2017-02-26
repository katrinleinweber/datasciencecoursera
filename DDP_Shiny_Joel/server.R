library(shiny)

shinyServer(function(input, output) {
  
  output$points <- renderText({
    length(input$questions)
  })
  
})
