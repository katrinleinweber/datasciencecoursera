#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI type for application that draws a histogram
shinyUI(
  
  # page type => `sidebarPanel` & `mainPanel`
  fluidPage(
  
  # Application title
  titlePanel("Plot random numbers"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How many dots to plot?", 
                   value = 1000, min = 1, max = 1000, step = 1), 
      sliderInput("sliderX", "Pick min values:",
                  # double sliders
                   min = -100, max = 100, value = c(-50,50)), 
      sliderInput("sliderY", "Pick max values:",
                  min = -100, max = 100, value = c(-50,50)),
      checkboxInput("show_xlab", "x axis label", value = TRUE),
      checkboxInput("show_ylab", "y axis label", value = TRUE),
      checkboxInput("show_title", "title")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      h3("graph of random points"),
      # defined in server.R (`output$dots`)
       plotOutput("dots")
    )
  )
))
