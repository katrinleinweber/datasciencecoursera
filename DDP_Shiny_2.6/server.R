library(shiny)
shinyServer(func = function(input, output) {
  
  # calculate upon (new) rectangular selection in plot view
  model <- reactive({
    brushed_data <- brushedPoints(df = trees, brush = input$brush1,
                                  xvar = "Girth", yvar = "Volume")
    
    # throw exception for too few selected points
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    
    # model regression from selected points
    lm(formula = Volume ~ Girth, data = brushed_data)
  })
  
  output$slope <- renderText({
    
    # convert exception to error message
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  
  output$intercept <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  
  output$plot1 <- renderPlot({
    plot(x = trees$Girth, y = trees$Volume, 
         xlab = "Girth", ylab = "Volume", main = "Tree Measurements",
         cex = 1.5, pch = 16, bty = "n")
    
    # implement effect of data selection 
    if(!is.null(model())){
      abline(a = model(), col = "blue", lwd = 2)
    }
  })
  
  
})
