library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Shiny Joel Test"),
  
  sidebarLayout(
    sidebarPanel(
      # Joel Test questions from https://www.joelonsoftware.com/2000/08/09/ 
      # but replaced 'you' with 'they'
      
      checkboxGroupInput(
        "questions", label = "Check all that apply: ", 
        choices = c("Do they use source control?" = "control",
                    "Can they make a build in one step?" = "build",
                    "Do they make daily builds?" = "daily",
                    "Do they have a bug database?" = "tracker",
                    "Do they fix bugs before writing new code?" = "fix",
                    "Do they have an up-to-date schedule?" = "schedule",
                    "Do they have a spec?" = "spec",
                    "Do programmers have quiet working conditions?" = "quiet",
                    "Do they use the best tools money can buy?" = "tools",
                    "Do they have testers?" = "testers",
                    "Do new candidates write code during their interview?" = "interview",
                    "Do they do hallway usability testing?"= "hallway")
      )
    ),
    
    mainPanel(
      h3("They score this many points out of 12 on the Joel Test: "), 
      textOutput("points")
    )
  )
))
