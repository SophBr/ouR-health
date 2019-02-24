library(shinydashboard)
source("../../stateList.R")

dashboardPage(
  dashboardHeader(title = "ouRhealth"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
        fluidRow(
          box(
            width = 12, # full width
            fluidRow(
              column(selectInput("state", "State:", append(c("All" = -1), stateList)), width = 12),
              column(sliderInput("age", label = "Age:", value = 25, min = 18, max = 85), width = 6),
              column(selectInput("sex", "Sex:", c("male" = 1, "female" = 2)), width = 6)
            )
          ),
          
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
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)