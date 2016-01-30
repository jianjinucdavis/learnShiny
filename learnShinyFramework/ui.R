library(networkD3)
library(shiny)
library(igraph)
shinyUI(
  fluidPage(
    # title: how to put title in center?
    titlePanel("Random Networks"),
    hr(),
    
    fluidRow(
      column(3,
             sliderInput('n', 'Number of nodes', value = 50, min = 2, max = 200, step = 1)
             ),
      column(3,
             sliderInput('p.or.m', 'Probability', value = 0.05, min = 0, max = 1, step = 0.02)
             ),
      
      column(3,
             sliderInput('nei', 'Neighborhood', value = 3, min = 1,max = 6, step = 1)
             ),
      column(3,
             selectInput(inputId = "size", 
                         label = "Node Size", 
                         choices = c("None", "Degree", "Betweenness"))
      )
    ),
    # fluidRow(
    #  column(11, offset = 10,
    #         submitButton("Run")
    #         )
    #  ),
    hr(),
    fluidRow(
      column(12,
             tabsetPanel(
               id = 'ohMyDearPlots',
               tabPanel("Network Visualization", plotOutput("Graphs")),
               tabPanel("Degree Distribution", plotOutput("DegreeDistribution"))
             )
             )
      ),
    br(),
    fluidRow(
      column(4,
             div(textOutput("text1"), 
                 style = paste0("color:", rgb(0, 0, 0.48)), 
                 align = "center")
             ),
      column(4,
             div(textOutput("text2"), 
                 style = paste0("color:", rgb(0, 0, 0.48)),  # 
                 align = "center")
             ),
      column(4,
             div(textOutput("text3"), 
                 style = paste0("color:", rgb(0, 0, 0.48)), # rgb color accepted
                 align = "center")
             )
      )
    )
  )
