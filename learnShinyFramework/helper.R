library(igraph)

# generate Graphs
generateGraphList <- function(n, nei, p.or.m, ...) {
  AscaleFreeGraph = sample_pa(n = n, directed = FALSE)
  ArandomGraph = erdos.renyi.game(n = n, p.or.m = p.or.m)
  AsmallWorldGraph = watts.strogatz.game(dim = 1, size = n, nei = nei, p = p.or.m, loops = FALSE, multiple = FALSE)
  return(list(
    AscaleFreeGraph = AscaleFreeGraph,
    ArandomGraph = ArandomGraph,
    AsmallWorldGraph = AsmallWorldGraph
  ))
}

# normalized degree
getGraphCentrality <- function(graph){
  V(graph)$degree <- degree(graph)
  V(graph)$betweenness <- betweenness(graph)
  return(graph)
}

selectVertexSize <- function(graph, size) {
  if (size == "Degree") {
    vertexSize = V(graph)$degree ^ 0.9
  } else if (size == "Betweenness") {
    vertexSize = V(graph)$betweenness ^ 0.4
  } else {
    vertexSize = 3
  }
}


plotGraphs <- function(graphList, vertexSize) {
  op = par(mfrow = c(1, 3))
  beautifulGraph(graphList$AscaleFreeGraph,
                 vertex.size = vertexSize[[1]])
  title("Scale Free", cex.main = 2)
  
  beautifulGraph(graphList$ArandomGraph,
                 vertex.size = vertexSize[[2]])
  title("Random", cex.main = 2)
  beautifulGraph(graphList$AsmallWorldGraph,
                 vertex.size = vertexSize[[3]])
  title("Small World", cex.main = 2)
  par(op)
}



## ==== plot the graph
generateScaleFreePlot <- function(n, ...) {
  # undirected network
  sfGraph = igraph::sample_pa(n, directed = FALSE)
  beautifulGraph(sfGraph, 
                 vertex.size = 3,
                 vertex.color = rgb(1, 0, 0), 
                 edge.color = rgb(0, 0, 0, alpha = 0.4))
}


generateSmallWorldplot <- function(n, nei, p = p.or.m, ...) {
  swGraph = watts.strogatz.game(dim = 1, size = n, nei = nei, p = p, loops = FALSE, multiple = FALSE)
  beautifulGraph(swGraph, 
                 vertex.size = 3,
                 vertex.color = rgb(1, 0, 0), 
                 edge.color = rgb(0, 0, 0, alpha = 0.4))
}


generateERPlot <- function(n, p.or.m, ...) {
  erGraph = igraph::erdos.renyi.game(n = n, p.or.m = p.or.m)
  beautifulGraph(erGraph, 
                 vertex.size = 3,
                 vertex.color = rgb(1, 0, 0), 
                 edge.color = rgb(0, 0, 0, alpha = 0.4))
}


beautifulGraph <- function(g,
                           vertex.size = 1,
                           layout = layout_nicely(g, dim = 2),
                           vertex.color = rgb(1, 0, 0),
                           vertex.shape = 'circle',
                           edge.width = 1,
                           edge.color = rgb(0, 0, 0),
                           ...) {
  plot(g,
       layout = layout,
       vertex.color = vertex.color,
       vertex.frame.color = NA,
       vertex.label = NA, 
       vertex.shape = vertex.shape,
       vertex.size = vertex.size, 
       edge.curved = TRUE,
       edge.width = edge.width,
       edge.color = edge.color)
}

## ****************************** ##
#                                  #
# add tags for degree distribution #
#                                  #
## ****************************** ##

## == plot degree distribution ==

myHist <- function(theDegree){
  theHist <- hist(theDegree, 
                  breaks = max(theDegree),
                  plot = FALSE)
  return(theHist)
}

myBar <- function(counts, ymax, axes = FALSE){
  barplot(counts, 
          axes = axes, 
          ylim = c(0, ymax), 
          space = 0,
          xlab = "degree"
  )
}

plotBars <- function(countsList) {
  op = par(mfrow = c(1, 3))
  myBar(counts = countsList[[1]], 
        ymax = max(unlist(countsList)), 
        axes = TRUE)
  axis(1)
  title("Scale Free", cex.main = 2)
  myBar(counts = countsList[[2]], 
        ymax = max(unlist(countsList)), 
        axes = FALSE)
  axis(1)
  title("Random", cex.main = 2)
  myBar(counts = countsList[[3]], 
        ymax = max(unlist(countsList)),
        axes = FALSE)
  axis(1)
  title("Small World", cex.main = 2)
  par(op)  
}