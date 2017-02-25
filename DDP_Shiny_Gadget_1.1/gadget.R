library(shiny)
library(miniUI)

myFirstGadget <- function() {
  
  titles <- "My 1st Gadget"
  
  ui <- miniPage(title = cat("Window: ", titles),
                 gadgetTitleBar(titles)
  )
  
  server <- function(input, output, session) {
    
    # clicking Done button closes the app
    # [ ] implicit button declaration?
    observeEvent(eventExpr = input$done, {
      stopApp()
    })
  }
  
  # implicit declaration of `input$cancel` handling
  runGadget(app = ui, server = server)
}

# separate call necessary to acticate all functions
# [ ] Why doesn't `runGadget` alone make button functional?
myFirstGadget()
