library(shiny)
library(miniUI)

myFirstGadget <- function() {
  
  ui <- miniPage(
    gadgetTitleBar("My 1st Gadget")
  )
  
  server <- function(input, output, session) {
    
    # clicking Done button closes the app
    observeEvent(input$done, {
      stopApp()
    })
  }
  
  runGadget(ui, server)
}
