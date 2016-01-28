
shinyUI(pageWithSidebar(  
  headerPanel("Scale Free Network"),  
  sidebarPanel(    
    sliderInput('n', 
                'Number of nodes',
                value = 50, min = 2, max = 100, step = 1), 
    sliderInput('p.or.m', 'Probability of drawing an edge between two nodes', 3,
                value = 0.3, 
                min = 0, 
                 max = 1,
                step = 0.02)), 
  mainPanel(    
    plotOutput('ErdosRenyiGraph')  
  )
))

