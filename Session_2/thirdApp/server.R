# Server Code 
# Author : Rajasekhar Jetty
library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$plot1 <- renderPlot({
    
    qplot(eval(parse(text=paste(input$varX))),eval(parse(text=paste(input$varY))),
          data=iris,color=iris$Species,geom="point",
          xlab=paste(input$varX),ylab=paste(input$varY))

  })
  
  
  output$plot2 <- renderPlot({
    
    qplot(eval(parse(text=paste(input$varZ))), data = iris, facets = Species ~ .,
          geom = "histogram",fill=Species,bins=input$bins,xlab=paste(input$varZ))

  })
  
})