library(shiny)
library(datasets)

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am,labels=c('Automatic','Manual'))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  fit <- reactive({
    lm(as.formula(formulaText()), data=mtcars)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$bplot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mtcars,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$plot <- renderPlot({
    with(mtcars, {
      plot(as.formula(formulaText()))
      abline(fit(), col=2)
    })
  })
  
})