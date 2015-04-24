#
#   ui.R
#
#   Small UI file for the shiny project.
#


library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("MPG performance"),
    sidebarPanel(
        h3("Input section:"),
        selectInput("cyl", "Select cylinders:", c("4 cylinders" = "4", "6 cylinders" = "6", "8 cylinders" = "8")),
        checkboxInput("regressionLine", "Regression line in graph", FALSE),
        numericInput("hp", "To get estimated MPG, input engine power [hp]:", 100, min = 1, max = 400),
        h4("Instructions:"),
        p("- Select number of cylinders in the Input section to the left,"),
        p("- If you would like to see a calculated regression line in the plot, click the Regression Line box,"),
        p("- Insert the engine power in HP."),
        p("You will see a plot of MPG performance for typical cars in the selected cylinder class, with or witout regression line."),
        p("The regression line will show the estimated relation HP -> MPG."),
        p("Below the plot is the resulting MPG from the inserted engine power level shown.")
    ),
    mainPanel(
        h3("Calculation tool for MPG performance"),
        p("This tool helps you to calculate the anticipated miles per gallon (MPG) performance for your car. "),
        p("Based on a selection of cars the relation between engine size, expressed as power (HP), and MPG "),
        p("can be estimated. Since this relation differs depending on the number of cylinders in the engine,"),
        p("the number of cylinders has to be stated in order to get the proper result."),
        h4("Plot of MPG performance:"),
        plotOutput("plot"),
        h4("Resulting MPG estimation:"),
        textOutput("inputText"),
        textOutput("resultText")
    )
))




# EOF ui.R