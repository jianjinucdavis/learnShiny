
shinyUI(
  fluidPage(
    titlePanel("Graph Parameters"),
    fluidRow(
      column(4,
             numericInput('n', 'Number of nodes', value = 50, min = 2, max = 1000, step = 1)
             ),
      column(4,
             sliderInput('p.or.m', 'Probability', value = 0.3, min = 0, max = 1, step = 0.02)
             ),
      
      column(4,
             sliderInput('nei', 'Neighborhood', value = 3, min = 1,max = 6, step = 1)
             )
    ),
    hr(),
    fluidRow(
      column(4,
             h2("Scale-Free", align = "center"),
             div(textOutput("text1"), style = "color:blue", align = "center"),
             simpleNetworkOutput("ScaleFreeGraph")
             ),
      column(4,
             h2("Random", align = "center"),
             div(textOutput("text2"), style = "color:blue", align = "center"),
             simpleNetworkOutput('ErdosRenyiGraph')
             ),
      column(4,
             h2("Small World", align = "center"),
             div(textOutput("text3"), style = "color:blue", align = "center"),
             simpleNetworkOutput("SmallWorldGraph")
             )
      )
    )
  )
