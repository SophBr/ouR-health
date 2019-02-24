library(shinydashboard)
source("../../stateList.R")

dashboardPage(
  skin = "green",
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
      # Highlighting Box
      box(
        p("By answering these questions we can highlight your position in the dataset."),
        column(checkboxInput("highlight", "Do you want to highlight yourself in the data?"), width = 12),
        conditionalPanel("input.highlight == 1",
                         column(selectInput("smoke", "How often do you smoke?", c("Every day" = 1, "Some days" = 2, "Former smoker" = 3, "< 100 cigarettes throughout my lifetime" = 4, "never" = 4)), width = 12),
                         column(selectInput("health", "Would you say that in general your health is:", c("Excellent" = 1, "Very good" = 2, "Good" = 3, "Fair" = 4, "Poor" = 5)), width = 12),
                         column(sliderInput("sleep", "On average, how many hours of sleep do you get in a 24-hour period?", value = 0, min = 0, max = 24), width = 12)
                         ),
        
        width = 12,
        collapsible = T,
        title= "Highlighting"),
      
      valueBoxOutput("nValueBox.personal", width = 6),
      valueBoxOutput("nValueBox.overall", width = 6),
      
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
        status="success"),
      
      # Stress
      box(
        plotOutput("stress.personal", height = 250),
        width = 6,
        title= "Stress (you)",
        status="danger"),
      box(
        plotOutput("stress.overall", height = 250),
        width = 6,
        title = "Stress",
        status="danger"),
      
      # Smoking
      box(
        plotOutput("smoking.personal", height = 250),
        width = 6,
        title= "Smoking (you)",
        status="danger"),
      box(
        plotOutput("smoking.overall", height = 250),
        width = 6,
        title = "Smoking",
        status="danger"),
      
      # Food
      box(
        plotOutput("fruit.personal", height = 250),
        plotOutput("veg.personal", height = 250),
        width = 6,
        title= "Nutrition (you)",
        status="success"),
      box(
        plotOutput("fruit.overall", height = 250),
        plotOutput("veg.overall", height = 250),
        width = 6,
        title = "Fruit & Vegetables",
        status="success"),
      
      # Sleep
      box(
        plotOutput("sleepPlot.personal", height = 250),
        width = 6,
        title= "Sleep (you)"),
      box(
        plotOutput("sleepPlot.overall", height = 250),
        width = 6,
        title = "Sleep")
    )
  )
)