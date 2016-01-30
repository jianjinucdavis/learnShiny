library(igraph)


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

####
#
# add distribution tags
#
####
## ====