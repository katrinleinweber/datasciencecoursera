#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # data input & presentation defined in ui.R (`sliderInput()` & `plotOutput()`)
  # [x] Are "output" & "input" reserved variable names (orange symbol in RStudio)?
  # ==> no, function parameters defined above
  output$dots <- renderPlot({ # reactivity requires parentheses with inner curly braces
    
    set.seed(2017-02-23)
    
    # implement effects of inputs
    number_of_points <- input$numeric
    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    
    # generate random, uniform numbers
    dataX <- runif(n = number_of_points, min = minX, max = maxX)
    dataY <- runif(number_of_points, minY, maxY)
    
    # implement effects of checkboxes
    xlab <- ifelse(test = input$show_xlab, yes = "x axis", no = "")
    ylab <- ifelse(input$show_ylab, "y axis", "")
    main <- ifelse(input$show_title, "title", "")
    
    plot(x = dataX, y = dataY, xlab = xlab, ylab = ylab, main = main, 
         xlim = c(-100,100), ylim = c(-100,100))
  })
  
})
