library(igraph)
library(networkD3)

GenerateSmallWorldD3Network <- function(n, nei, p = p.or.m, ...){
  swGraph = watts.strogatz.game(dim = 1, size = n, nei = nei, p = p, loops = FALSE, multiple = FALSE)
  generateD3network(swGraph)
}

GenerateScaleFreeD3Network <- function(n, ...){
  scaleFreeGraph <- barabasi.game(n)
  generateD3network(scaleFreeGraph)
}

GenerateRandomD3Network <- function(n, p.or.m, ...){
  erGraph = igraph::erdos.renyi.game(n = n, p.or.m = p.or.m)
  generateD3network(erGraph)
}




generateD3network <- function(g, fontSize = 0, zoom = TRUE, nodeColour = rgb(0, 0, 0.5), opacity = 0.6, ...){
  edgelist <- data.frame(igraph::as_edgelist(g))
  simpleNetwork(edgelist, fontSize = fontSize, zoom = zoom, nodeColour = nodeColour, opacity = opacity)
}


generateSWplot <- function(n, nei, p = p.or.m, ...) {
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
                           vertex.shape = 'square',
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