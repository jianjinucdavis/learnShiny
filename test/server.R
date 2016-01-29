source('./helper.R')
library(networkD3)
library(shiny)
library(igraph)
shinyServer(  
  function(input, output) {
    
    output$ScaleFreeGraph <- renderSimpleNetwork({
      GenerateScaleFreeD3Network(n = input$n)
    })
    output$ErdosRenyiGraph <- renderSimpleNetwork({
      GenerateRandomD3Network(n = input$n, p.or.m = input$p.or.m)
    })
    output$SmallWorldGraph <- renderSimpleNetwork({
      GenerateSmallWorldD3Network(n = input$n, nei = input$nei, p = input$p.or.m)
    })
    
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
