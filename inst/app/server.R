library(shiny)
library(tidyverse)

source("../../load_data.R", chdir = T)
source("../../eat.R")
source("../../descriptives.R")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
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

  output$nValueBox.personal <- renderValueBox({
    valueBox(
      nrow(personal()),
      "Number of People like you",
      icon = icon("users")
    )
  })
  output$sleepPlot.personal <- renderPlot({ plot.sleep(personal()) })
  output$generalHealth.personal <- renderPlot({ plot.generalHealth(personal()) })
  output$fruit.personal <- renderPlot({ plot.eat(personal()$X_FRUTSU1, "Fruit Units") })
  output$veg.personal <- renderPlot({ plot.eat(personal()$X_VEGESU1, "Vegetable Units") })
  
  output$nValueBox.overall <- renderValueBox({
    valueBox(
      nrow(overall()),
      "Number of People (total)",
      icon = icon("users")
    )
  })
  output$sleepPlot.overall <- renderPlot({ plot.sleep(overall()) })
  output$generalHealth.overall <- renderPlot({ plot.generalHealth(overall()) })
  output$fruit.overall <- renderPlot({ plot.eat(overall()$X_FRUTSU1, "Fruit Units") })
  output$veg.overall <- renderPlot({ plot.eat(overall()$X_VEGESU1, "Vegetable Units") })
})  