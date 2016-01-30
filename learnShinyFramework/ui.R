library(networkD3)
library(shiny)
library(igraph)
shinyUI(
  fluidPage(
    # title: how to put title in center?
    titlePanel("Random Networks"),
    hr(),
    
    fluidRow(
      column(4,
             numericInput('n', 'Number of nodes', value = 50, min = 2, max = 200, step = 1)
             ),
      column(4,
             sliderInput('p.or.m', 'Probability', value = 0.05, min = 0, max = 1, step = 0.02)
             ),
      
      column(4,
             sliderInput('nei', 'Neighborhood', value = 3, min = 1,max = 6, step = 1)
             )
    ),
    fluidRow(
      column(11, offset = 10,
             submitButton("Run")
             )
      ),
    hr(),
    fluidRow(
      column(4,
             h3("Scale-Free", align = "center"),
             div(textOutput("text1"), 
                 style = paste0("color:", rgb(0, 0, 0.48)), 
                 align = "center"),
             plotOutput("ScaleFreeGraph")
             ),
      column(4,
             h3("Random", align = "center"),
             div(textOutput("text2"), 
                 style = paste0("color:", rgb(0, 0, 0.48)),  # 
                 align = "center"),
             plotOutput('ErdosRenyiGraph')
             ),
      column(4,
             h3("Small World", align = "center"),
             div(textOutput("text3"), 
                 style = paste0("color:", rgb(0, 0, 0.48)), # rgb color accepted
                 align = "center"),
             plotOutput("SmallWorldGraph")
             )
      )
    )
  )
