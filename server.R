#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(cluster)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  myiris <- iris
  myiris$Species <- NULL
  
  
  kmean <- reactive({
    kmeans(myiris, input$centers)}) 
  
  output$KmPlot1 <- renderPlot({
    km <- kmean()
    plot(myiris[c("Sepal.Length", "Sepal.Width")], col=km$cluster)
    points(km$centers[,c("Sepal.Length", "Sepal.Width")], col=1:nrow(km$centers), pch=15, cex=2)
  })
  
  output$KmPlot1a <- renderPlot({
    km <- kmean()
    plot(myiris[c("Petal.Length", "Petal.Width")], col=km$cluster)
    points(km$centers[,c("Petal.Length", "Petal.Width")], col=1:nrow(km$centers), pch=15, cex=2)
  })
 
  output$KmPlot2 <- renderPlot({
    if(input$ShowPlot2) {
    km <- kmean() 
  clusplot(myiris, km$cluster, color=TRUE, shade=TRUE, 
           labels=2, lines=0)
    }
  })
  
  output$KmPlot2a <- renderPlot({
    if(input$ShowPlot2) {
    km <- kmean() 
  with(myiris, pairs(myiris, col=c(1:3)[km$cluster])) 
  } 
  })
  
  output$kmCenters <- renderTable({
    km <- kmean()
    km$centers})
})


