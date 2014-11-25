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

### example 1
  RNGkind("Mersenne-Twister")
  set.seed(123)
  g1 <- randomGraph(letters[1:10], 1:4, p=.3)
  RNGkind()
  DFS(g1, "a")

### example 2
## A graph with two separate trees
graph.dfs(graph.tree(10) %du% graph.tree(10), root=1, "out",
          TRUE, TRUE, TRUE, TRUE)
 
## How to use a callback
f.in <- function(graph, data, extra) {
  cat("in:", paste(collapse=", ", data), "\n")
  FALSE
}
f.out <- function(graph, data, extra) {
  cat("out:", paste(collapse=", ", data), "\n")
  FALSE
}
tmp <- graph.dfs(graph.tree(10), root=1, "out",
                 in.callback=f.in, out.callback=f.out)
 
## Terminate after the first component, using a callback
f.out <- function(graph, data, extra) {
 data['vid'] == 1
}
tmp <- graph.dfs(graph.tree(10) %du% graph.tree(10), root=1,
                 out.callback=f.out)
