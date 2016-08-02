#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

mpgData <- mtcars

shinyServer(function(input, output) {
  formulaString <- reactive({
    paste("mpg ~ ", input$variable)
  })

  fit <- reactive({
    lm(as.formula(formulaString()), data = mpgData)
  })
  
  output$summaryFit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaString()), main = formulaString())
      abline(fit(), col = 4)
    })
  })
})