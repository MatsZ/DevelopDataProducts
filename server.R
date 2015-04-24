#
#   server.R
#
#   Small UI file for the shiny project.
#


library(shiny)
data(mtcars)

#
#   Small function to plot HP, MPG and regression line for a specific car set
#   based on cylinders:
#
plotMpg <- function(cyl, line) {
            plot(mtcars[mtcars$cyl == cyl, ]$hp, mtcars[mtcars$cyl == cyl, ]$mpg, pch = 20, main = paste("MPG for different HP, ", as.numeric(cyl), " cylinders", sep = ""), xlab = "HP", ylab = "MPG")
            if (line == TRUE) abline(lm(mpg ~ hp, data = mtcars[mtcars$cyl == cyl, ]), col = "red")
}

#
#   Small function to calculate the modelled MPG from HP regression:
#
calcMpg <- function(cyl, hpInput) {
            model <- lm(mpg ~ hp, data = mtcars[mtcars$cyl == cyl, ])
            round(coef(model)[1] + hpInput * coef(model)[2], 2)
}


shinyServer(
    function(input, output) {
        output$plot <- renderPlot(plotMpg(as.numeric(input$cyl), input$regressionLine))
        output$inputText <- renderText(paste("Estimated MPG for a car with ", input$cyl, " cylinders and ", input$hp, " hp:"))
        output$resultText <- renderText(paste(calcMpg(input$cyl, input$hp), " mpg"))        
    }
)



# EOF server.R