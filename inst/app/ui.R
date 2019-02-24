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
              column(selectInput("state", "State:", append(c("All" = NA), stateList)), width = 12),
              column(sliderInput("age", label = "Age:", value = NA, min = 18, max = 120), width = 6),
              column(selectInput("sex", "Sex:", c("male" = 1, "female" = 2)), width = 6)
            )
          ),
          
          box(plotOutput("plot1", height = 250)),
          
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)