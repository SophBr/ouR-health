library(shiny)
library(tidyverse)

source("../../load_data.R", chdir = T)
source("../../eat.R")
source("../../stress.R")
source("../../descriptives.R")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  # ==== Data Filtering ===
  personal <- reactive({
    user.sex = input$sex # 1 = male; 2 = female
    user.age = max(min(floor((input$age - 15) / 5), 13), 1) # calculate age group
    user.state = input$state
    
    filtered <- BRFSS
    if (user.sex >= 0) {
      filtered <- filtered %>% filter(SEX == user.sex)
    }
    if (!is.na(user.age)) {
      filtered <- filtered %>% filter(X_AGEG5YR == user.age)
    }
    if (user.state >= 0) {
      filtered <- filtered %>% filter(X_STATE == user.state)
    }
    
    filtered
  })
  overall <- reactive({ BRFSS })

  # ==== Output ====
  # --- Output: personal ---
  output$nValueBox.personal <- renderValueBox({
    valueBox(
      formatNumber(nrow(personal())),
      "Number of People like you",
      icon = icon("users")
    )
  })
  output$sleepPlot.personal <- renderPlot({ plot.sleep(personal()) })
  output$generalHealth.personal <- renderPlot({ plot.generalHealth(personal()) })
  output$fruit.personal <- renderPlot({ plot.eat(personal()$X_FRUTSU1, "Fruit Units") })
  output$veg.personal <- renderPlot({ plot.eat(personal()$X_VEGESU1, "Vegetable Units") })
  output$stress.personal <- renderPlot({ plot.stress(personal()) })
  output$smoking.personal <- renderPlot({ plot.smoke(personal()) })
  
  # --- Output: overall ---
  output$nValueBox.overall <- renderValueBox({
    valueBox(
      formatNumber(nrow(overall())),
      "Number of People (total)",
      color = "yellow",
      icon = icon("users")
    )
  })
  output$sleepPlot.overall <- renderPlot({ plot.sleep(overall()) })
  output$generalHealth.overall <- renderPlot({ plot.generalHealth(overall()) })
  output$fruit.overall <- renderPlot({ plot.eat(overall()$X_FRUTSU1, "Fruit Units") })
  output$veg.overall <- renderPlot({ plot.eat(overall()$X_VEGESU1, "Vegetable Units") })
  output$stress.overall <- renderPlot({ plot.stress(overall()) })
  output$smoking.overall <- renderPlot({ plot.smoke(overall()) })
})  