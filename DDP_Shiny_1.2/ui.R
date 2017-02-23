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
  titlePanel("Testing a user-defined histogram"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins", # name
                   label = "Slide this:",
                   min = 1,
                   max = 33,
                   value = 11)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      # defined in server.R (`output$testing`)
       plotOutput("testing")
    )
  )
))
