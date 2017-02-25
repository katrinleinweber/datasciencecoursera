library(shiny)
library(miniUI)

myMultiplierGadget <- function(number1, number2) {
  
  ui <- miniPage(
    gadgetTitleBar("Multiply two numbers!"),
    miniContentPanel(
      selectInput("num1", "1st Number: ", choices = number1),
      selectInput("num2", "2nd Number: ", choices = number2)
    )
  )
  
  server <- function(input, output, session) {
    observeEvent(eventExpr = input$done, {
      num1 <- as.numeric(input$num1)
      num2 <- as.numeric(input$num2)
      stopApp(num1 * num2)
    })
  }
  
  runGadget(app = ui, server = server)
}
