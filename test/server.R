source('./helper.R')
shinyServer(  
  function(input, output) {    
    output$ErdosRenyiGraph <- renderPlot({
      generatePlot(n = input$n, p.or.m = input$p.or.m)
    })      }
)

