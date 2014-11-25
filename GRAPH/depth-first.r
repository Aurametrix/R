# DFS function implements algorithm 4.2.1 of Gross and Yellen
# DFS(object, node, checkConn=TRUE)
# object	An instance of the graph class.
# node	A character indicating the starting node.
# checkConn	A logical indicating whether the connectivity of the graph should be checked.

# usage
    graph.dfs (graph, root, neimode = c("out", "in", "all", "total"), 
    unreachable = TRUE, order = TRUE, order.out = FALSE,
    father = FALSE, dist = FALSE, in.callback = NULL,
    out.callback = NULL, extra = NULL, rho = parent.frame())

# example 1
  RNGkind("Mersenne-Twister")
  set.seed(123)
  g1 <- randomGraph(letters[1:10], 1:4, p=.3)
  RNGkind()
  DFS(g1, "a")

