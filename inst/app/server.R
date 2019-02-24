library(shiny)
library(tidyverse)

source("../../load_data.R", chdir = T)
source("../../data_manipulation.R")
source("../../eat.R")
source("../../stress.R")
source("../../descriptives.R")
source("../../highlight.R")

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
      icon = icon("user")
    )
  })
  output$sleepPlot.personal <- renderPlot({
    default.highlight(plot.sleep(personal()), input$highlight, input$sleep)
  })
  output$generalHealth.personal <- renderPlot({
    plot <- plot.generalHealth(personal())
    if (input$highlight && !is.na(input$health)) {
      plot <- plot + geom_vline(xintercept = as.numeric(input$health), colour = highlight.color)
    }
    plot
  })
  output$fruit.personal <- renderPlot({
    default.highlight(plot.eat(personal()$X_FRUTSU1, "Fruit Units"), input$highlight, input$fruit)
  })
  output$veg.personal <- renderPlot({
    default.highlight(plot.eat(personal()$X_VEGESU1, "Vegetable Units"), input$highlight, input$veg)
  })
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
  output$sleepPlot.overall <- renderPlot({
    default.highlight(plot.sleep(overall()), input$highlight, input$sleep)
  })
  output$generalHealth.overall <- renderPlot({
    default.highlight(plot.generalHealth(overall()), input$highlight, input$health)
  })
  output$fruit.overall <- renderPlot({
    default.highlight(plot.eat(overall()$X_FRUTSU1, "Fruit Units"), input$highlight, input$fruit)
  })
  output$veg.overall <- renderPlot({
    default.highlight(plot.eat(overall()$X_VEGESU1, "Vegetable Units"), input$highlight, input$veg)
  })
  output$stress.overall <- renderPlot({ plot.stress(overall()) })
  output$smoking.overall <- renderPlot({ plot.smoke(overall()) })
})  