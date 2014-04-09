## usage examples for shortest (directed or undirected) paths between vertices
## shortest.paths calculates the length of all the shortest paths from or to the vertices in the network. 
## get.shortest.paths calculates the shortest path itself, not just its length, from or to the given vertex.

shortest.paths(graph, v=V(graph), to=V(graph),
      mode = c("all", "out", "in"),
      weights = NULL, algorithm = c("automatic", "unweighted",
                                    "dijkstra", "bellman-ford",
                                    "johnson"))
get.shortest.paths(graph, from, to=V(graph), mode = c("out", "all",
      "in"), weights = NULL, output=c("vpath", "epath", "both"))
get.all.shortest.paths(graph, from, to = V(graph), mode = c("out", 
      "all", "in"), weights=NULL) 
average.path.length(graph, directed=TRUE, unconnected=TRUE)
path.length.hist (graph, directed = TRUE)

