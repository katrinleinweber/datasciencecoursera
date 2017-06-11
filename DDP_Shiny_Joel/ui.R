library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Shiny Joel Test ++"),
  
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
    
    h5(textOutput("points", inline = TRUE), " points out of 12"),
    p("Source & further reading: ", a("JoelOnSoftware.com/2000/08/09",
      href = "https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/"
    ),
    br(), br(), br(),
    
    checkboxGroupInput("plus", 
      label = "Also ask (check if answer appeals to you):", 
      choices = c(
        "What are the metrics for success around here?" = "metrics",
        "Which countries will I have to travel to?" = "travel",
        "What are the rules for publishing papers or giving conference presentations?" = "publish",
        "Which mechanisms for self-improvement do you apply?" = "improve",
        "Do people here take time to think about their work, instead of just crunching through it mindlessly?" = "think",
        "What types of contributions (beyond completing the work) are considered valuable here?" = "contributions",
        "Why do you think I might be a good candidate?" = "candidate",
        "Which hard- & software products are used here?" = "wares-used",
        "Is remote work / home office / part time possible?" = "remote-home-part"
      )
    ),
    
    h3(textOutput("plus", inline = TRUE), "bonus points")
    )
  )
))
