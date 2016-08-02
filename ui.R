#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
  navbarPage("mtcars",
    tabPanel("Introduction",
      helpText("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."),
      h3("Data"),
      p("A data frame with 32 observations on 11 variables."),
                      
      tags$ol(
        tags$li(code("mpg"), "Miles/(US) gallon"),
        tags$li(code("cyl"), "Number of cylinders"),
        tags$li(code("disp"), "Displacement (cu.in.)"),
        tags$li(code("hp"), "Gross horsepower"),
        tags$li(code("drat"), "Rear axle ratio"),
        tags$li(code("wt"), "Weight (lb/1000)"),
        tags$li(code("qsec"), "1/4 mile time"),
        tags$li(code("vs"), "V-engine / Standard"),
        tags$li(code("am"), "Transmission (0 = automatic, 1 = manual)"),
        tags$li(code("gear"), "Number of forward gears"),
        tags$li(code("carb"), "Number of carburetors")
      ),
                      
      h4("Source"),
      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411."),
      h3("Code"),
      a("https://github.com/gganguly/developingdataproducts")
      ),
      tabPanel("Explore",
        fluidPage(
          p("Discover which variables predict miles per gallon (MPG)"),
          fluidRow(
            selectInput("variable", "",
              c("Number of cylinders" = "cyl",
                "Displacement (cu.in.)" = "disp",
                "Gross horsepower" = "hp",
                "Rear axle ratio" = "drat",
                "Weight (lb/1000)" = "wt",
                "1/4 mile time" = "qsec",
                "V-engine / Standard" = "vs",
                "Transmission" = "am",
                "Number of forward gears" = "gear",
                "Number of carburetors" = "carb"
              )
            ),
            fluidRow(
              plotOutput("mpgPlot"),
              verbatimTextOutput("summaryFit")
            )
          )
        )
      )
  )
)