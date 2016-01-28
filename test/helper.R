library(igraph)



generatePlot <- function(n, p.or.m, ...) {
  g = igraph::erdos.renyi.game(n = n, p.or.m = p.or.m)
  beautifulGraph(g, 
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
