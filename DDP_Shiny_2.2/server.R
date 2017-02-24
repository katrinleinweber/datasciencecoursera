library(shiny)

shinyServer(func = function(input, output) {
  
  # add spline/breakpoint to dataset, because observed by 
  # plot(mtcars$mpg, mtcars$hp)
  # splits model2 into two linear sections 
  mtcars$mpgsp <- ifelse(test = mtcars$mpg - 20 > 0, 
                         yes = mtcars$mpg - 20, 
                         no = 0)
  model1 <- lm(formula = hp ~ mpg, data = mtcars)
  model2 <- lm(hp ~ mpgsp + mpg, data = mtcars)
  
  # calculate upon new slider input
  model1pred <- reactive(x = {
    predict(object = model1, newdata = data.frame(mpg = input$sliderMPG))
  })
  
  # as above, but apply spline to input
  model2pred <- reactive({
    predict(model2, newdata = data.frame(mpg = input$sliderMPG,
                                         mpgsp = ifelse(input$sliderMPG - 20 > 0,
                                                        input$sliderMPG - 20, 0)))
  })
  
  output$plot1 <- renderPlot(expr = {
    
    # basic scatter plot
    plot(x = mtcars$mpg, y = mtcars$hp, 
         xlab = "MPG", ylab = "horsepower", 
         bty = "n", pch = 16,
         xlim = c(10,35), ylim = c(50,350)
    )
    
    # implement effects of checkboxes => fitted lines for models
    if(input$showModel1) {
      abline(a = model1, col = "red", lwd = 2)
    }
    if(input$showModel2) {
      model2lines <- predict(model2, newdata = data.frame(
        mpg = 10:35, mpgsp = ifelse(10:35 - 20 > 0, 
                                    10:35 - 20, 0)
      ))
      lines(x = 10:35, y = model2lines, col = "blue", lwd = 2)
    }
    
    # draw prediction for slider value
    points(x = input$sliderMPG, y = model1pred(), col = "red", pch = 16, cex = 2)
    points(input$sliderMPG, model2pred(), col = "blue", pch = 16, cex = 2)
    
    legend(x = 25, y = 250, legend = c("Model 1 Prediction", "Model 2 Prediction"), 
           pch = 16, col = c("red", "blue"), bty = "n", cex = 1.2)
  })
  
  output$pred1 <- renderText(expr = {
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
})
