source('./helper.R')
library(shiny)
library(igraph)

shinyServer(  
  function(input, output) {
    
    
    # graph outputs
    output$Graphs <- renderPlot({
      # create graphs using inputs
      graph_list <- generateGraphList(n = input$n, nei = input$nei, p.or.m = input$p.or.m)
      graph_centrality_list <- lapply(graph_list, getGraphCentrality)
      # Network Visualization
      sizeList <- lapply(graph_centrality_list, function(x) selectVertexSize(x, input$size))
      plotGraphs(graph_centrality_list, vertexSize = sizeList)
    })
    output$DegreeDistribution <- renderPlot({
      # create graphs using inputs
      graph_list <- generateGraphList(n = input$n, nei = input$nei, p.or.m = input$p.or.m)
      graph_centrality_list <- lapply(graph_list, getGraphCentrality)
      
      # Degree Distribution
      countsList <- lapply(graph_centrality_list, function(x) myHist(V(x)$degree)$counts)
      plotBars(countsList)
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


