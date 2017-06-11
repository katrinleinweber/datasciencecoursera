library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Shiny Joel Test"),
  
  verticalLayout(fluid = TRUE,
    
    checkboxGroupInput("questions", 
      label = "Do they/you… (Check all that apply)", 
      choices = c(
        "use source control?" = "control",
        "build in one step?" = "build",
        "build daily?" = "daily",
        "have bug database?" = "tracker",
        "fix bugs before writing new code?" = "fix",
        "have up-to-date schedule?" = "schedule",
        "have spec?" = "spec",
        "provide quiet working conditions?" = "quiet",
        "use best tools money can buy?" = "tools",
        "have testers?" = "testers",
        "write code during candidate interview?" = "interview",
        "use hallway usability testing?" = "hallway")
    ),
    
    h3(textOutput("points", inline = TRUE), " points out of 12"),
    p("Source & further reading: ", a("JoelOnSoftware.com/2000/08/09",
      href = "https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/"
    ))
    
  )
))
