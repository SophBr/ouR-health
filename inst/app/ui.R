library(shinydashboard)
source("../../stateList.R")
source("../../info.R")

dashboardPage(
  skin = "green",
  dashboardHeader(title = "YouRhealth", titleWidth = 300),
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
                         column(selectInput("health", "Would you say that in general your health is:", c("Excellent" = 1, "Very good" = 2, "Good" = 3, "Fair" = 4, "Poor" = 5)), width = 12),
                         column(sliderInput("sleep", "On average, how many hours of sleep do you get in a 24-hour period?", value = 0, min = 0, max = 24), width = 12),
                         column(numericInput("fruit", "How many items of fruit do you eat per day?", value = 0, min = 0, max = 10), width = 12),
                         column(numericInput("veg", "How many vegetables do you eat per day?", value = 0, min = 0, max = 10), width = 12)
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
      tabBox(
        title = "Stress",
        width = 12,
        tabPanel("Graphs", fluidRow(
          column(plotOutput("stress.personal", height = 250), width = 6),
          column(plotOutput("stress.overall", height = 250), width = 6)
        ), icon = icon("bar-chart")),
        tabPanel("Information", HTML(stressInfo), icon = icon("file-text"))
      ),
      
      # Smoking
      tabBox(
        title = "Smoking",
        width = 12,
        tabPanel("People like you", plotOutput("smoking.personal", height = 250), icon = icon("user")),
        tabPanel("Overall", plotOutput("smoking.overall", height = 250), icon = icon("users"))
      ),
      
      # Food / Nutrition
      tabBox(
        title = "Nutrition",
        width = 12,
        tabPanel("Fruit", fluidRow(
          column(plotOutput("fruit.personal", height = 250), width = 6),
          column(plotOutput("fruit.overall", height = 250), width = 6)
        ), icon = icon("bar-chart")),
        tabPanel("Vegetables", fluidRow(
          column(plotOutput("veg.personal", height = 250), width = 6),
          column(plotOutput("veg.overall", height = 250), width = 6)
        ), icon = icon("bar-chart")),
        tabPanel("Information", HTML(nutritionInfo), icon = icon("file-text"))
      ),
      
      # Sleep
      tabBox(
        title = "Sleep",
        width = 12,
        tabPanel("Graphs", fluidRow(
          column(plotOutput("sleepPlot.personal", height = 250), width = 6),
          column(plotOutput("sleepPlot.overall", height = 250), width = 6)
        ), icon = icon("bar-chart")),
        tabPanel("Information", HTML(sleepInfo), icon = icon("file-text"))
      )
    )
  )
)