# UI Code
# Author : Rajasekhar Jetty
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
    fluidRow(
      column(4,
             h4("Understanding Relationships"),
             selectInput("varX", 
                         label = "X axis: Choose a variable to display",
                         choices = c("Sepal.Length", "Sepal.Width","Petal.Length","Petal.Width"),
                         selected = "Sepal.Length"),
             selectInput("varY", 
                         label = "Y axis : Choose a variable to display",
                         choices = c("Sepal.Length", "Sepal.Width","Petal.Length","Petal.Width"),
                         selected = "Sepal.Length")
             
      ),
      
      column(8, plotOutput("plot1"))
    ),
    
    fluidRow(
      column(4,
             h4("Distribution Explorer"),
             
             selectInput("varZ", 
                         label = "Choose a variable to display",
                         choices = c("Sepal.Length", "Sepal.Width","Petal.Length","Petal.Width"),
                         selected = "Sepal.Length"),
             
             sliderInput("bins", "Number of bins:",  
                         min = 5, max = 30, value = 10)

             
      ),
      
      column(8, plotOutput("plot2"))
    )
    
    
    
    
  )
  
)