library(shiny)

shinyServer(function(input, output) {
  
  output$points <- renderText({
    length(input$questions)
  })
  
  output$plus <- renderText({
    length(input$plus)
  })
  
})
