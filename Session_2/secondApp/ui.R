# UI for shiny app
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
            title = "Embedding of Multiple plots",
    
            fluidRow(
                            column(4,
                                   h4("Distribution Explorer"),
                                   sliderInput("bins", "Number of bins:",  
                                               min = 5, max = 20, value = 10)
                      
                            ),
                            
                            column(8, plotOutput("distPlot1"))
              ),
            
            fluidRow(
                            column(4,
                                   h4("Distribution Explorer"),
                                   sliderInput("bins2", "Number of bins:",  
                                               min = 5, max = 20, value = 10)
                                   
                            ),
                            
                            column(8, plotOutput("distPlot2"))
                  )
    
    
    
    
    )
  
)