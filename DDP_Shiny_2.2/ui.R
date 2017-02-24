library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict Horsepower from MPG"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", label = "What is the MPG of this car?",
                  min = 10, max = 35, value = 20),
      checkboxInput("showModel1", "Show/Hide model 1", TRUE),
      checkboxInput("showModel2", "Show/Hide model 2", TRUE)
    ),
    
    mainPanel(
      plotOutput("plot1"),
      h3("horsepower prediction from model 1: "),
      textOutput("pred1"),
      h3("horsepower prediction from model 2: "),
      textOutput("pred2")
    )
  )
))
