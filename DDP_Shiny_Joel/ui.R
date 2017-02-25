library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Shiny Joel Test"),
  
  sidebarLayout(
    sidebarPanel(
      # Joel Test questions from https://www.joelonsoftware.com/2000/08/09/ 
      # but replaced 'you' with 'they'
       checkboxInput("control", "Do they use source control?"),
       checkboxInput("build", "Can they make a build in one step?"),
       checkboxInput("daily", "Do they make daily builds?"),
       checkboxInput("tracker", "Do they have a bug database?"),
       checkboxInput("fix", "Do they fix bugs before writing new code?"),
       checkboxInput("schedule", "Do they have an up-to-date schedule?"),
       checkboxInput("spec", "Do they have a spec?"),
       checkboxInput("quiet", "Do programmers have quiet working conditions?"),
       checkboxInput("tools", "Do they use the best tools money can buy?"),
       checkboxInput("testers", "Do they have testers?"),
       checkboxInput("interview", "Do new candidates write code during their interview?"),
       checkboxInput("hallway", "Do they do hallway usability testing?")
      
    ),
    
    mainPanel(
      h3("They score this many points out of 12 on the Joel Test: "), 
      textOutput("points")
    )
  )
))
