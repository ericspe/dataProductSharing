#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsconnect)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris data - K-Mean Clustering -"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
       sliderInput("centers",
                   "Number of centers for kMean:",
                   min = 2,
                   max = 4,
                   value = 2),
      h4("Select the plots to display"),
       checkboxInput("ShowPlot1","type 1", value =TRUE),
       checkboxInput("ShowPlot2","type 2", value =TRUE)

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("This is a example using kMean clustering with a selection of the number of clusters"),
       h3("Plots"),
       
       conditionalPanel(
         condition = "input.ShowPlot1",
       plotOutput("KmPlot1"),
       plotOutput("KmPlot1a") ),

       conditionalPanel(
         condition = "input.ShowPlot2",
         plotOutput("KmPlot2"),
         plotOutput("KmPlot2a") ),
       
       h3("Kmean Centers"),
       tableOutput("kmCenters")
    )
  )
))
