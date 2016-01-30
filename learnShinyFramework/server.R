source('./helper.R')
library(shiny)
library(igraph)

shinyServer(  
  function(input, output) {
    
    # graph outputs
    output$ScaleFreeGraph <- renderPlot({
      generateScaleFreePlot(n = input$n)
    })
    output$ErdosRenyiGraph <- renderPlot({
      generateERPlot(n = input$n, p.or.m = input$p.or.m)
    })
    output$SmallWorldGraph <- renderPlot({
      generateSmallWorldplot(n = input$n, nei = input$nei, p = input$p.or.m)
    })
    
    # texts
    output$text1 <- renderText({
      print(paste0("N = ", input$n))
    })
    output$text2 <- renderText({
      print(paste0("N = ", input$n, "; P = ", input$p.or.m))
    })
    output$text3 <- renderText({
      print(paste0("N = ", input$n, "; P = ", input$p.or.m, "; Neighbor = ", input$nei))
    })
  })

?runApp
