library(shiny)
library(miniUI)

myTreePicker <- function() {
  
  ui <- miniPage(
    gadgetTitleBar("Select Points by Dragging Your Mouse!"),
    miniContentPanel(
      plotOutput("myPlot", height = "100%", 
                 # activate brushing for this plot
                 brush = "myBrush")
    )
  )
  
  server <- function(input, output, session) {
    
    output$myPlot <- renderPlot({
      plot(trees$Volume, trees$Girth, 
           main = "Trees!", xlab = "Girth", ylab = "Volume")
    })
    
    observeEvent(eventExpr = input$done, {
      stopApp(brushedPoints(df = trees, brush = input$myBrush, 
                            xvar = "Girth", yvar = "Volume"))
    })
  }
  
  runGadget(ui, server)
}

myTreePicker()
