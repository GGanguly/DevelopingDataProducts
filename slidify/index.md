---
title       : Developing Data Products- Reproducible Pitch Presentation
subtitle    : Project Assignment
author      : Gautam Ganguly
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Explore mtcars

### Part 1: Shiny App
Discover which variables predict miles per gallon (MPG)

### Part 2: Reproducible Pitch Presentation  

*http://gganguly.github.io/developingdataproducts/index.html* (this presentation)
  
### Clone the repo
```
git clone git@github.com:gganguly/developingdataproducts.git
```

--- .class #id

## Dataset

### Motor Trend Car Road Tests
The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).

### Source
Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.

```r
library(datasets)
head(mtcars,2)
```

---

## Format
  
A data frame with 32 observations on 11 variables.
  
1. `mpg` Miles/(US) gallon
1. `cyl` Number of cylinders 
1. `disp` Displacement (cu.in.) 
1. `hp` Gross horsepower 
1. `drat` Rear axle ratio 
1. `wt` Weight (lb/1000) 
1. `qsec` 1/4 mile time 
1. `vs` V-engine / Standard 
1. `am` Transmission (0 = automatic, 1 = manual) 
1. `gear` Number of forward gears 
1. `carb` Number of carburetors 

---

## Reactive Server Code
  
```r
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
```
