library(shinydashboard)
source("../../stateList.R")

dashboardPage(
  dashboardHeader(title = "ouRhealth", titleWidth = 300),
  dashboardSidebar(
    width = 300,
    sidebarMenu(
      column(selectInput("state", "State:", append(c("All" = -1), stateList)), width = 12),
      column(sliderInput("age", label = "Age:", value = 25, min = 18, max = 85), width = 12),
      column(selectInput("sex", "Sex:", c("All" = -1, "male" = 1, "female" = 2)), width = 12)
    )
  ),
  dashboardBody(
    fluidRow(
      valueBoxOutput("nValueBox.personal", width = 6),
      valueBoxOutput("nValueBox.overall", width = 6),
      
      # Sleep
      box(
        plotOutput("sleepPlot.personal", height = 250),
        width = 6,
        title= "Sleep (you)"),
      box(
        plotOutput("sleepPlot.overall", height = 250),
        width = 6,
        title = "Sleep"),
      
      # General Health
      box(
        plotOutput("generalHealth.personal", height = 250),
        width = 6,
        title= "General Health (you)",
        status="success"),
      box(
        plotOutput("generalHealth.overall", height = 250),
        width = 6,
        title = "General Health",
        status="success")
    )
  )
)